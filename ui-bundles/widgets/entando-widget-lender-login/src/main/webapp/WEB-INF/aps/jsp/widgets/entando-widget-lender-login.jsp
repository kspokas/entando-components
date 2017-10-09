<%@ taglib prefix="wp" uri="/aps-core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${sessionScope.currentUser != 'guest'}">
        <c:if test="${sessionScope.currentUser.entandoUser}">
            <c:if test="${!sessionScope.currentUser.credentialsNotExpired}">
                <div class="alert alert-block">
                    <p><wp:i18n key="USER_STATUS_EXPIRED_PASSWORD" />: <a href="<wp:info key="systemParam" paramName="applicationBaseURL" />do/editPassword.action"><wp:i18n key="USER_STATUS_EXPIRED_PASSWORD_CHANGE" /></a></p>
                </div>
            </c:if>
        </c:if>
        <wp:ifauthorized permission="enterBackend">
            <h2><wp:i18n key="ADMINISTRATION" />:</h2>
            <div class="btn-group">
                <a href="<wp:info key="systemParam" paramName="applicationBaseURL" />do/main.action?request_locale=<wp:info key="currentLang" />&amp;backend_client_gui=normal" class="btn"><wp:i18n key="ADMINISTRATION_BASIC" /></a>
                <a href="<wp:info key="systemParam" paramName="applicationBaseURL" />do/main.action?request_locale=<wp:info key="currentLang" />&amp;backend_client_gui=advanced" class="btn btn-primary"><wp:i18n key="ADMINISTRATION_MINT" /></a>
            </div>
        </wp:ifauthorized>
        <p class="pull-right"><a href="<wp:info key="systemParam" paramName="applicationBaseURL" />do/logout.action" class="btn"><wp:i18n key="LOGOUT" /></a></p>

        <wp:pageWithWidget widgetTypeCode="userprofile_editCurrentUser" var="userprofileEditingPageVar" listResult="false" />
        <c:if test="${null != userprofileEditingPageVar}" >
            <p><a href="<wp:url page="${userprofileEditingPageVar.code}" />" ><wp:i18n key="userprofile_CONFIGURATION" /></a></p>
            </c:if>
        </c:when>
    <p>
        <script>window.location = "<wp:url page="lender" />";</script>
    </p>
    <c:otherwise>
        <c:if test="${accountExpired}">
            <div class="alert alert-block alert-error">
                <p><wp:i18n key="USER_STATUS_EXPIRED" /></p>
            </div>
        </c:if>
        <c:if test="${wrongAccountCredential}">
            <div class="alert alert-block alert-error">
                <p><wp:i18n key="USER_STATUS_CREDENTIALS_INVALID" /></p>
            </div>
        </c:if>
        <h3><wp:i18n key="RESERVED_AREA" /></h3>
        <form action="<wp:url/>" method="post" class="form-horizontal margin-medium-top">
            <c:if test="${null != param['returnUrl']}">
                <input type="hidden" name="returnUrl" value="<c:out value="${param['returnUrl']}" />" />
            </c:if>
            <div class="form-group">
                <input id="username" type="text" name="username" placeholder="<wp:i18n key="USERNAME" />" class="form-control" />
            </div>
            <div class="form-group">
                <input id="password" type="password" name="password" placeholder="<wp:i18n key="PASSWORD" />" class="form-control" />
            </div>
            <div class="form-actions">
                <input type="submit" value="<wp:i18n key="SIGNIN" />" class="btn btn-primary block full-width m-b" />
            </div>
        </form>
    </c:otherwise>
</c:choose>

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
</style>
