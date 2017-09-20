INSERT INTO widgetcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked, maingroup) VALUES ('banner-advisors', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
    <property key="en">banner-advisors</property>
    <property key="it">banner-advisors </property>
</properties>', NULL, NULL, NULL, NULL, 1, NULL);

INSERT INTO guifragment (code, widgettypecode, plugincode, gui, defaultgui, locked) VALUES ('banner-advisors', 'banner-advisors', NULL, NULL, '<#assign wp=JspTaglibs["/aps-core"]>
<@wp.info key="langs" var="langsVar" />
<@wp.info key="currentLang" var="currentLangVar" />
<div class="banner-advisors">
    <div class="container">
        <div class="row">
            <div class="col-sm-7">
            </div>
            <div class="col-sm-5">
                <h3 class="title-advisors">Highly skilled advisors,<br> dedicated to serving you</h3>
                <p class="title-advisors-subtitle">Yes once you submit an application we provide a fully informative report on your mortgage request.
                    But if you prefere a personal feedback before starting the application, you can contact our mortagage advisors Nate, Nick, Nora.
                    Give us a call at 0800 987 654 or e-mail mortgageconsultancy@acmebank.com
                    designed for describing your app, agency or business.</p>
            </div>
        </div>
    </div>
</div>', 1);
