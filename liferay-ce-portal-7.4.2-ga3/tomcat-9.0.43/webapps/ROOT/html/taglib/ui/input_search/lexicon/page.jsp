<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/html/taglib/init.jsp" %>

<%
boolean autoFocus = GetterUtil.getBoolean(request.getAttribute("liferay-ui:input-search:autoFocus"));
String cssClass = GetterUtil.getString((String)request.getAttribute("liferay-ui:input-search:cssClass"));
String id = GetterUtil.getString((String)request.getAttribute("liferay-ui:input-search:id"));
String name = GetterUtil.getString((String)request.getAttribute("liferay-ui:input-search:name"));
String placeholder = GetterUtil.getString((String)request.getAttribute("liferay-ui:input-search:placeholder"));
boolean showButton = GetterUtil.getBoolean(request.getAttribute("liferay-ui:input-search:showButton"), true);
String title = GetterUtil.getString((String)request.getAttribute("liferay-ui:input-search:title"));

boolean useNamespace = GetterUtil.getBoolean(request.getAttribute("liferay-ui:input-search:useNamespace"), true);

if (!useNamespace) {
	namespace = StringPool.BLANK;
}

String value = ParamUtil.getString(request, name);
%>

<div class="<%= cssClass %> input-group lfr-input-search">
	<div class="input-group-item input-group-prepend">
		<label class="hide-accessible" for="<%= namespace + id %>"><%= title %></label>

		<input class="form-control search-query" data-qa-id="searchInput" id="<%= namespace + id %>" name="<%= namespace + name %>" placeholder="<%= placeholder %>" title="<%= title %>" type="text" value="<%= HtmlUtil.escapeAttribute(value) %>" />
	</div>

	<c:if test="<%= showButton %>">
		<div class="input-group-append input-group-item input-group-item-shrink">
			<button class="btn btn-monospaced btn-secondary" data-qa-id="searchButton" type="submit">
				<aui:icon image="search" markupView="lexicon" />
			</button>
		</div>
	</c:if>
</div>

<c:if test="<%= autoFocus %>">
	<aui:script>
		Liferay.Util.focusFormField('#<%= namespace %><%= id %>');
	</aui:script>
</c:if>