<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://database.it.kmitl.ac.th/it_14"
                   scope="session" user="it_14" password="7xdTD2Uv"/>

<sql:query var="query_student_achievement" dataSource="${dataSource}">
    SELECT achievement_id FROM student_achievement WHERE student_id = '<% session.getAttribute("username"); %>';
</sql:query>

<sql:query var="query_student_achievement_count" dataSource="${dataSource}">
    SELECT COUNT(achievement_id) as count FROM student_achievement WHERE student_id = '<% session.getAttribute("username"); %>';
</sql:query>

<sql:query var="query_teacher_achievement" dataSource="${dataSource}">
    SELECT achievement_id FROM teacher_achievement WHERE teacher_id = '<% session.getAttribute("teacher_id"); %>';
</sql:query>

<sql:query var="query_teacher_achievement_count" dataSource="${dataSource}">
    SELECT COUNT(achievement_id) as count FROM teacher_achievement WHERE teacher_id = '<% session.getAttribute("teacher_id");%>';
</sql:query>

<sql:query var="query_achievement_count" dataSource="${dataSource}">
    SELECT COUNT(id) as count FROM achievements;
</sql:query>

<sql:query var="query_organization_name" dataSource="${dataSource}">
    SELECT id, organization_name FROM organizations;
</sql:query>

<sql:query var="query_teacher_name" dataSource="${dataSource}">
    SELECT teacher_id, th_prename, th_name FROM teacher;
</sql:query>

<sql:query var="query_student_name" dataSource="${dataSource}">
    SELECT student_id, th_name FROM student;
</sql:query>
