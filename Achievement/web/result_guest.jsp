<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="guide.Guide" %>
<%@ include file="contains/header.jsp" %>

<% if (session.getAttribute("username") == null) { %>
<% } else { %>
<%@ include file="contains/navbar.jsp" %>
<% } %>

<%@ include file="contains/datasource.jsp" %>

<% String query_string = request.getAttribute("query_string").toString();%>

<sql:query var="query_search" dataSource="${dataSource}">
    <%= query_string%>
</sql:query>

<div class="container header-top">
    <div class="page-header">
        <h1>Search your achievement name<br><small>ค้นหาชื่อผลงานของคุณ</small></h1>
    </div>
</div>

<% if (session.getAttribute("username") == null) { %>
<div class="container">
    <form class="form-horizontal" action="guest.result" method="get">
        <div class="col-lg-12">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search for..." name="search_query">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="submit">Go!</button>
                </span>
            </div>
        </div>
    </form>
</div>
<div class="container">
    <c:forEach var="list" items="${query_search.rows}">
        <div class="col-lg-4 col-md-6 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a href="<% out.print(Guide.getRoute(request, "guest.result.detail"));%>?achievement_id=${list.id}&achievement_type=${list.achievement_type}">
                        <h3 class="panel-title">${list.achievement_name}</h3>
                    </a>
                </div>
                <div class="panel-body">
                    <input type="hidden" name="id" value="${list.id}">
                    Date: ${list.date}<br>
                    Attendee: ${list.StudentName}<br>
                    Organization: ${list.Organization}<br>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<% } else { %>
<div class="container">
    <form class="form-horizontal" action="result" method="get">
        <div class="col-lg-12">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search for..." name="search_query">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="submit">Go!</button>
                </span>
            </div>
        </div>
    </form>
</div>
<div class="container">
    <c:forEach var="list" items="${query_search.rows}">
        <div class="col-lg-4 col-md-6 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a href="<% out.print(Guide.getRoute(request, "result.detail"));%>?achievement_id=${list.id}&achievement_type=${list.achievement_type}">
                        <h3 class="panel-title">${list.achievement_name}</h3>
                    </a>
                </div>
                <div class="panel-body">
                    <input type="hidden" name="id" value="${list.id}">
                    Date: ${list.date}<br>
                    Attendee: ${list.StudentName}<br>
                    Organization: ${list.Organization}<br>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<% }%>

<%@include file="contains/footer.jsp" %>

