INSERT INTO widgetcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked, maingroup) VALUES ('entando-language_choose_purple_light', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Choose language Purple/Light</property>
<property key="it">Scegli lingua Purple/Light</property>
</properties>', NULL, NULL, NULL, NULL, 1, NULL);

INSERT INTO guifragment (code, widgettypecode, plugincode, gui, defaultgui, locked) VALUES ('entando-language_choose_purple_light', 'entando-language_choose_purple_light', NULL, NULL, '<#assign wp=JspTaglibs["/aps-core"]>
<@wp.info key="langs" var="langsVar" />
<@wp.info key="currentLang" var="currentLangVar" />
<a data-toggle="dropdown" class="dropdown-toggle" href="#"  title="<@wp.i18n key="ESLC_LANGUAGE" />">
   <#if (accountExpired?? && accountExpired == true) || (wrongAccountCredential?? && wrongAccountCredential == true)>open</#if>
   <#if (Session.currentUser != "guest")>
   <span class="block m-t-xs">
        <strong class="font-bold">
            ${Session.currentUser}
        </strong>
    </span>
    <#else>
    <span class="block m-t-xs">
        <strong class="font-bold">
            <@wp.i18n key="ESLF_SIGNIN" />
        </strong>
    </span>
    </#if>
    <span class="text-muted text-xs block">
        <@wp.i18n key="ESLC_LANGUAGE" />
        <b class="caret"></b>
    </span>
</a>
<ul class="dropdown-menu animated fadeInRight m-t-xs">
    <@wp.freemarkerTemplateParameter var="langsListVar" valueName="langsVar" removeOnEndTag=true >
    <#list langsListVar as curLangVar>
    <li <#if (curLangVar.code == currentLangVar)>class="active" </#if>>
        <a href="<@wp.url lang="${curLangVar.code}" paramRepeat=true />">
        <@wp.i18n key="ESLC_LANG_${curLangVar.code}" />
        </a>
    </li>
    </#list>
    </@wp.freemarkerTemplateParameter>
</ul>', 1);
