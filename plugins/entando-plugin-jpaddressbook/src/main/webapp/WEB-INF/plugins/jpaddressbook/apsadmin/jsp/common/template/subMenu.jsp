<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/apsadmin-core" prefix="wpsa" %>
<%@ taglib prefix="wp" uri="/aps-core" %>

<wp:ifauthorized permission="superuser">
    <li class="list-group-item">
        <a role="menuitem"  href="<s:url namespace="/do/jpaddressbook/AddressBook" action="list" />">
            <span class="list-group-item-value">
                <s:text name="jpaddressbook.title.addressbook" />
            </span>
        </a>
    </li>
</wp:ifauthorized>
