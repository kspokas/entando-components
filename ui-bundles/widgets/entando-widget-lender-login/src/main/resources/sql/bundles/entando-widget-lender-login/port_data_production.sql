INSERT INTO widgetcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked, maingroup) VALUES ('entando-widget-lender-login', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Choose a language Inspinia</property>
<property key="it">Scegli la lingua Inspinia</property>
</properties>', NULL, NULL, NULL, NULL, 1, NULL);

INSERT INTO guifragment (code, widgettypecode, plugincode, gui, defaultgui, locked) VALUES ('entando-widget-lender-login', 'entando-widget-lender-login', NULL, NULL, '<#assign wp=JspTaglibs["/aps-core"]>
<div class="middle-box text-center loginscreen animated fadeInDown">
    <#if (Session.currentUser.username != "guest") >
    <#if (Session.currentUser.entandoUser) >
    <#if (!Session.currentUser.credentialsNotExpired) >
    <div class="alert alert-block">
        <p>
            <@wp.i18n key="USER_STATUS_EXPIRED_PASSWORD" />:
            <a href="<@wp.info key="systemParam" paramName="applicationBaseURL" />do/editPassword.action">
               <@wp.i18n key="USER_STATUS_EXPIRED_PASSWORD_CHANGE" /></a>
        </p>
    </div>
    </#if>
    </#if>
    <p>
        <script>window.location = "<@wp.url page="lender" />";</script>
    </p>
    <#else>
    <#if (accountExpired?? && accountExpired == true) >
    <div class="alert alert-block alert-error">
        <p><@wp.i18n key="USER_STATUS_EXPIRED" /></p>
    </div>
    </#if>
    <#if (wrongAccountCredential?? && wrongAccountCredential == true) >
    <div class="alert alert-block alert-error">
        <p><@wp.i18n key="USER_STATUS_CREDENTIALS_INVALID" /></p>
    </div>
    </#if>
    <h3><@wp.i18n key="RESERVED_AREA" /></h3>
    <form action="<@wp.url/>" method="post" class="m-t">
        <#if (RequestParameters.returnUrl??) >
        <input type="hidden" name="returnUrl" value="${RequestParameters.returnUrl}" />
        </#if>
        <div class="form-group">
            <input id="username" type="text" name="username" placeholder="<@wp.i18n key="USERNAME" />" class="form-control" />
        </div>
        <div class="form-group">
            <input id="password" type="password" name="password" placeholder="<@wp.i18n key="PASSWORD" />" class="form-control" />
        </div>
        <div class="form-actions">
            <input type="submit" value="<@wp.i18n key="SIGNIN" />" class="btn btn-primary block full-width m-b" />
        </div>
    </form>
    </#if>
</div>
<style>
    .loginscreen.middle-box {
        width: 342px;
    }
    .middle-box {
        max-width: 342px;
        z-index: 100;
        margin: 0 auto;
        padding-top: 40px;
    }
    .full-width {
        width: 100% !important;
    }
    .m-b {
        margin-bottom: 15px;
    }
    .btn-w-m {
        min-width: 100px;
    }
    .btn {
        border-radius: 3px;
    }
</style>', 1);
