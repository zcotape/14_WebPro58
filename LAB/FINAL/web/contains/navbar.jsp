<%@ page import="guide.RouteGuide" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<% out.print(RouteGuide.getURL(request, "dashboard"));%>">#COLLECTED.project</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Welcome, <%out.print(request.getAttribute("first_name")); %> <span class="caret"></span></a>
                    <% if (request.getAttribute("role").equals("student")) {%>
                    <ul class="dropdown-menu">
                        <li><a href="<% out.print(RouteGuide.getURL(request, "profile")); %>">Profile</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="logout">Logout</a></li>
                    </ul>
                    <% } else if (request.getAttribute("role").equals("staff")){ %>
                    <ul class="dropdown-menu">
                        <li><a href="<% out.print(RouteGuide.getURL(request, "dashboard")); %>">Dashboard</a></li>
                        <li><a href="<% out.print(RouteGuide.getURL(request, "profile")); %>">Profile</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="logout">Logout</a></li>
                    </ul>
                    <% } else {%>
                    <ul class="dropdown-menu">
                        <li><a href="<% out.print(RouteGuide.getURL(request, "dashboard")); %>">Admin</a></li>
                        <li><a href="<% out.print(RouteGuide.getURL(request, "profile")); %>">Profile</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="logout">Logout</a></li>
                    </ul>
                    <% } %>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>