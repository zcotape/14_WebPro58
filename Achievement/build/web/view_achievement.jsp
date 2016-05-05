<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="contains/header.jsp" %>

<%@include file="contains/navbar.jsp" %>

<%@include file="contains/datasource.jsp" %>

<sql:query var="query_achievement" dataSource="${dataSource}">
    SELECT 
    GROUP_CONCAT(DISTINCT student.th_name) AS 'StudentName', 
    achievements.achievement_name, 
    achievements.category, 
    organizations.organization_name, 
    achievements.reward, 
    achievements.date

    FROM achievements
    JOIN student_achievement
    ON (student_achievement.achievement_id = achievements.id)
    JOIN student
    ON (student.student_id = student_achievement.student_id)
    JOIN organization_achievement
    ON (organization_achievement.achievement_id = student_achievement.achievement_id)
    JOIN organizations
    ON (organizations.id = organization_achievement.organization_id)
    GROUP BY achievements.achievement_name
    ORDER BY achievements.date
</sql:query>

<div class="container header-top">
    <div class="page-header">
        <h1>View Achievement List<br><small>ดูรายชื่อผลงานทั้งหมดในระบบ</small></h1>
    </div>
</div>

<div class="container">
    <table class="table">
        <thead>
            <tr>
                <th>#</th>
                <th>ชื่อนักศึกษา</th>
                <th>ชื่อผลงาน</th>
                <th>ประเภท</th>
                <th>หน่วยงานที่จัด</th>
                <th>รางวัล/ประกาศเกียรติคุณยกย่อง</th>
                <th>วันเดือนปี ที่ได้รับ</th>
            </tr>
        </thead>
        <c:forEach var="list" items="${query_achievement.rows}">
            <tr>
                <td></td>
                <td>${list.StudentName}</td>
                <td>${list.achievement_name}</td>
                <td>${list.category}</td>
                <td>${list.organization_name}</td>
                <td>${list.reward}</td>
                <td>${list.date}</td>
            </tr>
        </c:forEach>
    </table>
    <div class="modal-footer">
        <a role="button" class="btn btn-primary" href="<% out.print(Guide.getRoute(request, "download.excel"));%>">Download to Excel File
        </a>
    </div>
</div>

<%@include file="contains/footer.jsp" %>