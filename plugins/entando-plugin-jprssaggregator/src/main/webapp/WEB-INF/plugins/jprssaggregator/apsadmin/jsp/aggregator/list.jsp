<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="wp" uri="/aps-core" %>
<%@ taglib prefix="wpsa" uri="/apsadmin-core" %>
<%@ taglib prefix="wpsf" uri="/apsadmin-form" %>

<ol class="breadcrumb page-tabs-header breadcrumb-position">
    <li>
        <s:text name="breadcrumb.integrations"/>
    </li>
    <li>
        <s:text name="breadcrumb.integrations.components"/>
    </li>
    <li class="page-title-container">
        <s:text name="jprssaggregator.title.rssAggregator"/>
    </li>
</ol>
<div class="page-tabs-header">
    <div class="row">
        <div class="col-sm-12">
            <h1>
                <s:text name="jprssaggregator.title.rssAggregator.rssManagement"/>
                <span class="pull-right">
                    <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-html="true" title=""
                       data-content="<s:text name="rssAggregator.help"/>" data-placement="left" data-original-title="">
                        <i class="fa fa-question-circle-o" aria-hidden="true"></i>
                    </a>
                </span>
            </h1>
        </div>
    </div>
</div>
<br>

<div id="main">
    <s:include value="/WEB-INF/apsadmin/jsp/common/inc/messages.jsp"/>
    <a href="<s:url action="new" namespace="/do/jprssaggregator/Aggregator"/>" class="btn btn-primary pull-right mb-5">
        <s:text name="label.add"/>
    </a>
    <table class="table table-striped table-bordered">
        <p class="sr-only"><s:text name="jprssaggregator.title.rssAggregator.list" /></p>
        <thead>
            <tr>
                <th class="table-w-50"><s:text name="jprssaggregator.rssAggregator.description"/></th>
                <th class=""><s:text name="jprssaggregator.rssAggregator.delay"/></th>
                <th class=""><s:text name="jprssaggregator.rssAggregator.updated"/></th>
                <th class="text-center table-w-5"><s:text name="jprssaggregator.rssAggregator.actions"/></th>
            </tr>
        </thead>
        <tbody>
            <s:set var="aggregatorItems" value="aggregatorItems"/>
            <s:iterator value="aggregatorItems" var="item">
                <tr>
                    <td>
                        <s:property value="#item.descr"/>
                        <a title="<s:property value="#item.link" />" href="<s:property value="#item.link" />">
                            <span class="icon fa fa-globe"></span>
                        </a>
                    </td>
                    <td>
                        <% /*FIXME fare in modo che il valore delay del singolo canale sia compatibile con le chiavi della mappa "delays"*/%>
                        <s:property value="%{delays.get(#item.delay.intValue())}"/>
                    </td>
                    <td>
                        <s:date name="#item.lastUpdate" nice="true" format="dd/MM/yyyy HH:mm:ss"/>
                    </td>
                    <td class="table-view-pf-actions text-center">
                        <div class="dropdown dropdown-kebab-pf">
                            <button class="btn btn-menu-right dropdown-toggle"
                                    type="button" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                <span class="fa fa-ellipsis-v"></span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li>
                                    <a href="<s:url action="edit"><s:param name="code" value="#item.code"/></s:url>"
                                       title="<s:text name="label.edit" />:&#32;<s:property value="#item.descr" />">
                                        <span><s:text name="label.edit"/></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="<s:url action="syncronize"><s:param name="code" value="#item.code"/></s:url>"
                                       title="<s:text name="label.rssSync" />:&#32;<s:property value="#item.descr" />">
                                        <span><s:text name="label.rssSync"/></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="<s:url action="delete"><s:param name="code" value="#item.code"/></s:url>"
                                       title="<s:text name="label.remove" />:&#32;<s:property value="#item.descr" />">
                                        <span><s:text name="label.remove"/></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
</div>
