<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="contains/header.jsp"%>

<%@ include file="contains/navbar.jsp"%>

<div class="container header-top">
    <div class="page-header">
        <h1>Welcome <small><% out.print(request.getAttribute("first_name"));%></small></h1>
    </div>
</div>

<% if (request.getAttribute("role").equals("student")) {%>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Your Archive(s)</h3>
                </div>
                <div class="panel-body">
                    <span>You have</span>
                    <p class="archieve-count">
                        3 Archives
                    </p>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Activities</h3>
                </div>
                <div class="list-group">
                    <a href="<% out.print(RouteGuide.getURL(request, "add_archive"));%>" class="list-group-item">
                        <h4 class="list-group-item-heading">Add archieve(s)</h4>
                    </a>
                    <a href="<% out.print(RouteGuide.getURL(request, "query"));%>" class="list-group-item">
                        <h4 class="list-group-item-heading">Edit/Drop archieve(s)</h4>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<% } else if (request.getAttribute("role").equals("staff")) {%>

<% } else { %>

<% } %>

<%@ include file="contains/footer.jsp"%>