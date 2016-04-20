<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="contains/header.jsp" %>
<%@ include file="contains/navbar.jsp" %>
<%@ include file="contains/datasource.jsp" %>

<% if (session.getAttribute("role").equals("student")) {%>
<div class="container header-top">
    <div class="page-header">
        <h1>Welcome
            <small><% out.print(session.getAttribute("th_name"));%></small>
        </h1>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Registered Achievement</h3>
                </div>
                <div class="panel-body">
                    <span>You have</span>
                    <p class="archieve-count">
                        <c:forEach var="list" items="${query_student_achievement_count.rows}">
                            <c:choose>
                                <c:when test="${list.count == 1}">
                                    Only ${list.count} Achievement
                                </c:when>
                                <c:when test="${list.count <= 0}">
                                    Not Achievement Registered
                                </c:when>
                                <c:otherwise>
                                    ${list.count} Achievements
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
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
                    <a href="<% out.print(Guide.getRoute(request, "achievement.register"));%>" class="list-group-item">
                        <h4 class="list-group-item-heading">Add Achievement</h4>
                    </a>
                    <a href="<% out.print(Guide.getRoute(request, "achievement.manager"));%>" class="list-group-item">
                        <h4 class="list-group-item-heading">Edit/Drop Achievement</h4>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<% } else if (session.getAttribute("role").equals("staff")) {%>
<div class="container header-top">
    <div class="page-header">
        <h1>Welcome
            <small><% out.print(session.getAttribute("th_name"));%></small>
        </h1>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Registered Achievement in System</h3>
                </div>
                <div class="panel-body">
                    <p class="archieve-count">
                        <c:forEach var="list" items="${query_achievement_count.rows}">
                            <c:choose>
                                <c:when test="${list.count == 1}">
                                    Only ${list.count} Achievement
                                </c:when>
                                <c:when test="${list.count <= 0}">
                                    No Achievement Registered
                                </c:when>
                                <c:otherwise>
                                    ${list.count} Achievements
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
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
                    <a href="<% out.print(Guide.getRoute(request, "achievement.register"));%>" class="list-group-item">
                        <h4 class="list-group-item-heading">Add achievement</h4>
                    </a>
                    <a href="<% out.print(Guide.getRoute(request, "achievement.manager"));%>" class="list-group-item">
                        <h4 class="list-group-item-heading">Edit/Drop achievement</h4>
                    </a>

                </div>
            </div>
        </div>
    </div>
</div>
<% } else { %>
<div class="container header-top">
    <div class="page-header">
        <h1>Welcome
            <small><% out.print(session.getAttribute("th_prename")); %><% out.print(session.getAttribute("th_name"));%></small>
        </h1>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Registered Achievement</h3>
                </div>
                <div class="panel-body">
                    <p class="archieve-count">
                        <c:forEach var="list" items="${query_teacher_achievement_count.rows}">
                            <c:choose>
                                <c:when test="${list.count == 1}">
                                    Only ${list.count} Achievement
                                </c:when>
                                <c:when test="${list.count <= 0}">
                                    No Achievement Registered
                                </c:when>
                                <c:otherwise>
                                    ${list.count} Achievements
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
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
                    <a href="<% out.print(Guide.getRoute(request, "achievement.register"));%>" class="list-group-item">
                        <h4 class="list-group-item-heading">Add Achievement</h4>
                    </a>
                    <a href="<% out.print(Guide.getRoute(request, "achievement.manager"));%>" class="list-group-item">
                        <h4 class="list-group-item-heading">Edit/Drop Achievement</h4>
                    </a>

                </div>
            </div>
        </div>
    </div>
</div>
<% } %>

<%@ include file="contains/footer.jsp" %>