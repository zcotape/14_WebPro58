<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="contains/header.jsp" %>

<%@ include file="contains/navbar.jsp" %>

<%@ include file="contains/datasource.jsp" %>

<% String username = session.getAttribute("username").toString();%>
<sql:query var="query_student_achievement_count" dataSource="${dataSource}">
    SELECT COUNT(achievement_id) as count FROM student_achievement WHERE student_id = '<%= username%>';
</sql:query>

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
                    <h3 class="panel-title">Your Achievement | ผลงานของคุณ</h3>
                </div>
                <div class="list-group">
                    <a href="<% out.print(Guide.getRoute(request, "register.completition"));%>" class="list-group-item">
                        <h4 class="list-group-item-heading">ลงทะเบียนการแข่งขัน</h4>
                    </a>
                    <a href="<% out.print(Guide.getRoute(request, "register.ambassador"));%>" class="list-group-item">
                        <h4 class="list-group-item-heading">ลงทะเบียนตัวแทนองค์กร</h4>
                    </a>
                    <a href="<% out.print(Guide.getRoute(request, "register.certificate"));%>" class="list-group-item">
                        <h4 class="list-group-item-heading">ลงทะเบียนใบรับรองความสามารถ</h4>
                    </a>
                    <a href="<% out.print(Guide.getRoute(request, "achievement.manager"));%>" class="list-group-item">
                        <h4 class="list-group-item-heading">แก้ไขผลงานของคุณ</h4>
                    </a>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Activities</h3>
                </div>
                <div class="list-group">
                    <a href="<% out.print(Guide.getRoute(request, "search"));%>" class="list-group-item">
                        <h4 class="list-group-item-heading">ค้นหาผลงาน</h4>
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
        <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Activities</h3>
                </div>
                <div class="list-group">
                    <a href="<% out.print(Guide.getRoute(request, "search"));%>" class="list-group-item">
                        <h4 class="list-group-item-heading">ค้นหาผลงาน</h4>
                    </a>
                    <a href="<% out.print(Guide.getRoute(request, "view.achievement"));%>" class="list-group-item">
                        <h4 class="list-group-item-heading">ดูรายชื่อผลงานทั้งหมด</h4>
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
                    <h3 class="panel-title">Activities</h3>
                </div>
                <div class="list-group">
                    <a href="<% out.print(Guide.getRoute(request, "register.completition"));%>" class="list-group-item">
                        <h4 class="list-group-item-heading">ลงทะเบียนการแข่งขัน</h4>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-md-6">
            <form class="form-horizontal" action="result" method="get">
                <div class="col-lg-12">
                    <label class="control-label">ค้นหาผลงาน</label>
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for..." name="search_query">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit">Go!</button>
                        </span>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<% }%>

<%@ include file="contains/footer.jsp" %>