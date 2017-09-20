INSERT INTO widgetcatalog (code, titles, parameters, plugincode, parenttypecode, defaultconfig, locked, maingroup) VALUES ('right_columns_help', '<?xml version="1.0" encoding="UTF-8"?>
<properties>
    <property key="en">right_columns_help</property>
    <property key="it">right_columns_help </property>
</properties>', NULL, NULL, NULL, NULL, 1, NULL);

INSERT INTO guifragment (code, widgettypecode, plugincode, gui, defaultgui, locked) VALUES ('right_columns_help', 'right_columns_help', NULL, NULL, '<#assign wp=JspTaglibs["/aps-core"]>
<div class="title-box-icon">
    <h2 class="title">Need some help?</h2>
    <p class="margin-top"><strong>Call us on </strong></p>
    <p class="title"><strong> 0800 123 456</strong></p>
    <p> Open all day</p>
    <hr>
    <p>Write to us</p>
    <p><strong>mortagageinfo@acmebank.com</strong></p>
    <p>We are here to answer your mortgage questions</p>
    <hr>
    <p><strong> No panic mail!</p></strong>
<p><strong>urgentedits@acmebank.com </p></strong>
<p>We are here to change your application details before processing starts</p>
<hr>
<h2 class="title margin-top">Newsletter</h2>

<label class="margin-top-email"> Email</label>
<input type="text" class="form-control" placeholder="Full name" required="required">
<div>
    <br>
    <button type="button" class="btn btn-primary btn-sm pull-right ">Send</button>
</div>
<div class="clearfix"></div>
<hr>
<div class="security-logos">
    <img alt="acme-logo" class="logo-security" src="<@wp.imgURL />Loghi_Security.png">
</div>
</div>', 1);
