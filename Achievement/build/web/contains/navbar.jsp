<%@ page import="guide.Guide" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<% out.print(Guide.getRoute(request, "dashboard"));%>">ระบบกรอกข้อมูลผลงานต่างๆ ของนักศึกษา</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <% if (session.getAttribute("role").equals("student")) {%>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">Welcome, <%out.print(session.getAttribute("th_name")); %> <span
                            class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="<% out.print(Guide.getRoute(request, "account")); %>">ข้อมูลส่วนตัว</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="logout">ออกจากระบบ</a></li>
                    </ul>
                    <% } else if (session.getAttribute("role").equals("staff")) { %>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">Welcome, <%out.print(session.getAttribute("th_name")); %> <span
                            class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="<% out.print(Guide.getRoute(request, "account")); %>">ข้อมูลส่วนตัว</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="logout">ออกจากระบบ</a></li>
                    </ul>
                    <% } else { %>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">Welcome, <% out.print(session.getAttribute("th_prename")); %><%out.print(session.getAttribute("th_name")); %> <span
                            class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="<% out.print(Guide.getRoute(request, "account")); %>">ข้อมูลส่วนตัว</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="logout">ออกจากระบบ</a></li>
                    </ul>
                    <% }%>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>