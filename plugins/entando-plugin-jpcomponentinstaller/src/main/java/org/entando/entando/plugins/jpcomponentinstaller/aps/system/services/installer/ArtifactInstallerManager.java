/*
*
* Copyright 2014 Entando S.r.l. (http://www.entando.com) All rights reserved.
*
* This file is part of Entando software.
* Entando is a free software;
* You can redistribute it and/or modify it
* under the terms of the GNU General Public License (GPL) as published by the Free Software Foundation; version 2.
* 
* See the file License for the specific language governing permissions   
* and limitations under the License
* 
* 
* 
* Copyright 2014 Entando S.r.l. (http://www.entando.com) All rights reserved.
*
*/
package org.entando.entando.plugins.jpcomponentinstaller.aps.system.services.installer;

import com.agiletec.aps.system.SystemConstants;
import com.agiletec.aps.system.common.AbstractService;
import com.agiletec.aps.system.exception.ApsSystemException;
import com.agiletec.aps.system.services.baseconfig.ConfigInterface;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import org.apache.maven.repository.internal.MavenRepositorySystemUtils;
import org.eclipse.aether.DefaultRepositorySystemSession;
import org.eclipse.aether.RepositorySystem;
import org.eclipse.aether.RepositorySystemSession;
import org.eclipse.aether.artifact.Artifact;
import org.eclipse.aether.artifact.DefaultArtifact;
import org.eclipse.aether.repository.Authentication;
import org.eclipse.aether.repository.LocalRepository;
import org.eclipse.aether.repository.RemoteRepository;
import org.eclipse.aether.resolution.ArtifactRequest;
import org.eclipse.aether.resolution.ArtifactResult;
import org.eclipse.aether.resolution.VersionRangeRequest;
import org.eclipse.aether.resolution.VersionRangeResult;
import org.eclipse.aether.util.repository.AuthenticationBuilder;
import org.eclipse.aether.version.Version;
import org.entando.entando.aps.system.services.storage.IStorageManager;
import org.entando.entando.plugins.jpcomponentinstaller.aps.aetherutil.manual.ManualRepositorySystemFactory;
import org.entando.entando.plugins.jpcomponentinstaller.aps.system.InstallerSystemConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author E.Santoboni
 */
public class ArtifactInstallerManager extends AbstractService implements IArtifactInstallerManager {
	
	private static final Logger _logger = LoggerFactory.getLogger(ArtifactInstallerManager.class);
	
	@Override
	public void init() throws Exception {
		_logger.debug("{} ready", this.getClass().getName());
	}
	
	@Override
	public List<String> findAvailableVersions(Integer availableComponentId) throws ApsSystemException {
		List<String> versionsArray = new ArrayList<String>();
		AvailableArtifact availableArtifact = null;
		try {
			if (null == availableComponentId) {
				return null;
			}
			availableArtifact = this.getComponentCatalogueManager().getArtifact(availableComponentId);
			if (null == availableArtifact) {
				return null;
			}
			String entandoVersion = this.getConfigManager().getParam("version");
			RepositorySystem system = this.newSystem();
			RepositorySystemSession localSession = this.newSession(system);
			
			StringBuilder builder = new StringBuilder();
			builder.append(availableArtifact.getGroupId()).append(":").append(availableArtifact.getArtifactId());
			builder.append(":[").append(entandoVersion).append(",)");
			
			Artifact artifact = new DefaultArtifact(builder.toString());
			VersionRangeRequest rangeRequest = new VersionRangeRequest();
			rangeRequest.setArtifact(artifact);
			rangeRequest.setRepositories(this.newRepositories());
			VersionRangeResult rangeResult = system.resolveVersionRange(localSession, rangeRequest);
			List<Version> versions = rangeResult.getVersions();
			for (int i = 0; i < versions.size(); i++) {
				Version version = versions.get(i);
				versionsArray.add(version.toString());
			}
		} catch (Throwable t) {
			availableArtifact = (null != availableArtifact) ? availableArtifact : new AvailableArtifact();
			_logger.error("Error extracting version for component '{}' - '{}'", 
					availableArtifact.getGroupId(), availableArtifact.getArtifactId(), t);
		}
		return versionsArray;
	}
	
	private RepositorySystemSession newSession(RepositorySystem system) {
        DefaultRepositorySystemSession session = MavenRepositorySystemUtils.newSession();
		String homeDir = System.getProperty("user.home");
        LocalRepository localRepo = new LocalRepository(homeDir + "/.m2/repository");
        session.setLocalRepositoryManager(system.newLocalRepositoryManager(session, localRepo));
        return session;
    }
	
	private RepositorySystem newSystem() {
		return ManualRepositorySystemFactory.newRepositorySystem();
	}
	
	@Override
	public boolean downloadArtifact(Integer availableComponentId, String version) throws ApsSystemException {
		AvailableArtifact aa = null;
		try {
			if (null == availableComponentId) {
				return false;
			}
			aa = this.getComponentCatalogueManager().getArtifact(availableComponentId);
			if (null == aa) {
				return false;
			}
			//System.out.println("************************** 1111");
			
			RepositorySystem system = this.newSystem();
			RepositorySystemSession localSession = this.newSession(system);
			//System.out.println("************************** 2222");
			//RepositorySystemSession session = Booter.newRepositorySystemSession(system);
			//RemoteRepository centralRepos = Booter.newCentralRepository();
			List<RemoteRepository> remoteRepositories = this.newRepositories();
            
			ArtifactRequest artifactRequest = new ArtifactRequest();
            Artifact artifact = new DefaultArtifact(aa.getGroupId(), aa.getArtifactId(), "", "war", version);
			artifactRequest.setArtifact(artifact);
			//System.out.println("************************** 3333");
			//artifactRequest.addRepository(centralRepos);
			artifactRequest.setRepositories(remoteRepositories);
			
			ArtifactResult artifactResult = system.resolveArtifact(localSession, artifactRequest);
			artifact = artifactResult.getArtifact();
			//System.out.println("************************** 4444");
			
			String basePath = "plugins/jpcomponentinstaller/";
			
			InputStream ais = new FileInputStream(artifact.getFile());
			String filename = basePath + aa.getGroupId() + "_" + aa.getArtifactId() + "_" + version + ".war";
			if (!this.getStorageManager().exists(filename, true)) {
				this.getStorageManager().saveFile(filename, true, ais);
			}
            
			//System.out.println(artifact + " resolved to " + artifact.getFile());
			/*
			DependencyFilter classpathFlter = DependencyFilterUtils.classpathFilter(JavaScopes.COMPILE);
			
			CollectRequest collectRequest = new CollectRequest();
			collectRequest.setRoot(new Dependency(artifact, JavaScopes.COMPILE));
			collectRequest.setRepositories(Booter.newRepositories(system, localSession));
			
			DependencyRequest dependencyRequest = new DependencyRequest(collectRequest, classpathFlter);
			
			List<ArtifactResult> artifactResults = 
					system.resolveDependencies(localSession, dependencyRequest).getArtifactResults();
			
			for (ArtifactResult dependencyResult : artifactResults) {
				System.out.println(dependencyResult.getArtifact() + " resolved to " + dependencyResult.getArtifact().getFile());
				Artifact da = dependencyResult.getArtifact();
				String filenameDep = basePath + da.getGroupId() + "_" + da.getArtifactId() + "_" + da.getVersion() + ".war";
				InputStream dais = new FileInputStream(da.getFile());
				this.getStorageManager().saveFile(filenameDep, true, dais);
			}
			*/
			return true;
		} catch (Throwable t) {
			aa = (null != aa) ? aa : new AvailableArtifact();
			_logger.error("Error downloading artifact '{}' - '{}'", 
					aa.getGroupId(), aa.getArtifactId(), t);
			return false;
		}
	}
    
    @Override
    public boolean installArtifact(Integer availableComponentId, String version) throws ApsSystemException {
        AvailableArtifact aa = null;
		try {
			if (null == availableComponentId) {
				return false;
			}
			aa = this.getComponentCatalogueManager().getArtifact(availableComponentId);
			if (null == aa) {
				return false;
			}
            String basePath = "plugins/jpcomponentinstaller/";
			String filename = basePath + aa.getGroupId() + "_" + aa.getArtifactId() + "_" + version + ".war";
            if (!this.getStorageManager().exists(filename, true)) {
				return false;
			}
            InputStream is = this.getStorageManager().getStream(filename, true);
            this.getPluginInstaller().install(aa, version, is);
			return true;
		} catch (Throwable t) {
			aa = (null != aa) ? aa : new AvailableArtifact();
			_logger.error("Error installing artifact '{}' - '{}'", 
					aa.getGroupId(), aa.getArtifactId(), t);
			return false;
		}
    }
	
	public boolean uninstallArtifact(Integer availableComponentId, String version) throws ApsSystemException {
		try {
			//backup database
			//spostare da parte jar e cartelle plugin
			//chiamare inizializer manager per rimuovere record database
		} catch (Exception e) {
			//ripristinare file
		} finally {
			//cancellare file spostati
		}
		return true;
	}
	
	private List<RemoteRepository> newRepositories() {
		List<RemoteRepository> list = new ArrayList<RemoteRepository>();
		list.add(this.newCentralRepository());
		RemoteRepository remote = this.newRemoteRepository();
		if (null != remote) {
			list.add(remote);
		}
        return list;
    }
	
    private RemoteRepository newCentralRepository() {
        return new RemoteRepository.Builder("central", "default", "http://central.maven.org/maven2/" ).build();
    }
	
    private RemoteRepository newRemoteRepository() {
		String param = this.getConfigManager().getParam(InstallerSystemConstants.NEXUS_REPOSITORY_ACTIVE_PARAM_NAME);
		boolean active = (null != param && Boolean.parseBoolean(param));
		if (!active) {
			return null;
		}
		String nexusUrl = this.getConfigManager().getParam(InstallerSystemConstants.NEXUS_REPOSITORY_URL_PARAM_NAME);
		String nexusUsername = this.getConfigManager().getParam(InstallerSystemConstants.NEXUS_REPOSITORY_USERNAME_PARAM_NAME);
		String nexusPassword = this.getConfigManager().getParam(InstallerSystemConstants.NEXUS_REPOSITORY_PASSWORD_PARAM_NAME);
		Authentication auth = new AuthenticationBuilder().addUsername(nexusUsername).addPassword(nexusPassword).build();
        RemoteRepository nexus =
            new RemoteRepository.Builder("nexus", "default", nexusUrl).setAuthentication(auth).build();
		return nexus;
    }
	
	protected IStorageManager getStorageManager() {
		return _storageManager;
	}
	public void setStorageManager(IStorageManager storageManager) {
		this._storageManager = storageManager;
	}
	
	protected ConfigInterface getConfigManager() {
		return _configManager;
	}
	public void setConfigManager(ConfigInterface configManager) {
		this._configManager = configManager;
	}
	
	protected IComponentCatalogueManager getComponentCatalogueManager() {
		return _componentCatalogueManager;
	}
	public void setComponentCatalogueManager(IComponentCatalogueManager componentCatalogueManager) {
		this._componentCatalogueManager = componentCatalogueManager;
	}
    
    protected IPluginInstaller getPluginInstaller() {
        return _pluginInstaller;
    }
    public void setPluginInstaller(IPluginInstaller pluginInstaller) {
        this._pluginInstaller = pluginInstaller;
    }
	
	private IStorageManager _storageManager;
	private ConfigInterface _configManager;
	private IComponentCatalogueManager _componentCatalogueManager;
    private IPluginInstaller _pluginInstaller;
	
}
