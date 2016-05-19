<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="contains/header.jsp" %>
<%@ include file="contains/navbar.jsp" %>
<%@ include file="contains/datasource.jsp" %>

<% String username = session.getAttribute("username").toString(); %>

<div class="container header-top">
    <div class="page-header">
        <h1>Welcome
            <% if (session.getAttribute("role").equals("teacher")) { %>
            <small><% out.print(session.getAttribute("th_prename")); %><% out.print(session.getAttribute("th_name"));%></small>
            <% } else { %>
            <small><% out.print(session.getAttribute("th_name"));%></small>
            <% } %>
        </h1>
    </div>
</div>

<% if (session.getAttribute("role").equals("student")) {%>
<sql:query var="query_student_achievement_count" dataSource="${dataSource}">
    SELECT COUNT(achievement_id) as count FROM student_achievement WHERE student_id = '<%= username%>';
</sql:query>

<sql:query var="query_student_achievement" dataSource="${dataSource}">
    SELECT achievements.id,
    achievements.achievement_name,
    achievements.achievement_type
    FROM student_achievement
    JOIN achievements
    ON (student_achievement.achievement_id = achievements.id)
    WHERE student_id = '<%= username%>'
    GROUP BY achievements.id;
</sql:query>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Registered Portfolio</h3>
                </div>
                <div class="panel-body">
                    <span>You have</span>
                    <p class="archieve-count">
                        <c:forEach var="list" items="${query_student_achievement_count.rows}">
                            <c:choose>
                                <c:when test="${list.count == 1}">
                                    Only ${list.count} Achievement
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
                    <h3 class="panel-title">Result</h3>
                </div>
                <div class="list-group">
                    <table class="table">
                        <tr>
                            <td>#</td>
                            <td>Achievement Name</td>
                            <td>Action</td>
                        </tr>
                        <c:forEach var="list" items="${query_student_achievement.rows}">
                            <tr>
                                <td><c:out value="${list.id}"/></td>
                                <td><c:out value="${list.achievement_name}"/></td>
                                <td>
                                    <div class="btn-group" role="group" aria-label="...">
                                        <form action="edit.achievement" method="get">
                                            <input type="hidden" name="achievement_id" value="${list.id}">
                                            <button type="submit" class="btn btn-default" data-toggle="modal"
                                                    data-target=".edit" name="edit" value="${list.achievement_type}">Edit
                                            </button>
                                            <button type="button" class="btn btn-default" data-toggle="modal"
                                                    data-target=".drop" name="drop" data-id="${list.id}"
                                                    data-name="${list.achievement_name}">Drop
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <form action="achievement.action" method="post">
                        <div class="modal fade drop" tabindex="-1" role="dialog">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-label="Close"><span
                                                aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">You are dropping <code></code></h4>
                                    </div>
                                    <div class="modal-body">
                                        <input type="hidden" class="form-control" name="drop_id">
                                        <p>Be careful, you cannot undo this process when you confirmed!!!</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                        </button>
                                        <button type="submit" class="btn btn-primary" name="action" value="drop">Drop it
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<% } else if (session.getAttribute("role").equals("teacher")) {%>
<% String teacher_id = session.getAttribute("teacher_id").toString(); %>
<sql:query var="query_teacher_achievement_count" dataSource="${dataSource}">
    SELECT COUNT(achievement_id) as count FROM teacher_achievement WHERE teacher_id = '<%= teacher_id%>';
</sql:query>

<sql:query var="query_teacher_achievements" dataSource="${dataSource}">
    SELECT achievements.id,
    achievements.achievement_name,
    achievements.achievement_type
    FROM teacher_achievement
    JOIN achievements
    ON (teacher_achievement.achievement_id = achievements.id)
    WHERE teacher_id = '<%= teacher_id%>'
    GROUP BY achievements.id;
</sql:query>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Registered Portfolio</h3>
                </div>
                <div class="panel-body">
                    <span>You have</span>
                    <p class="archieve-count">
                        <c:forEach var="list" items="${query_teacher_achievement_count.rows}">
                            <c:choose>
                                <c:when test="${list.count == 1}">
                                    Only ${list.count} Achievement
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
                    <h3 class="panel-title">Result</h3>
                </div>
                <div class="list-group">
                    <table class="table">
                        <tr>
                            <td>#</td>
                            <td>Achievement Name</td>
                            <td>Action</td>
                        </tr>
                        <c:forEach var="list" items="${query_teacher_achievements.rows}">
                            <tr>
                                <td><c:out value="${list.id}"/></td>
                                <td><c:out value="${list.achievement_name}"/></td>
                                <td>
                                    <div class="btn-group" role="group" aria-label="...">
                                        <form action="edit.achievement" method="get">
                                            <input type="hidden" name="achievement_id" value="${list.id}">
                                            <button type="submit" class="btn btn-default" data-toggle="modal"
                                                    data-target=".edit" name="edit" value="${list.achievement_type}">Edit
                                            </button>
                                            <button type="button" class="btn btn-default" data-toggle="modal"
                                                    data-target=".drop" name="drop" data-id="${list.id}"
                                                    data-name="${list.achievement_name}">Drop
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <form action="achievement.action" method="post">
                        <div class="modal fade drop" tabindex="-1" role="dialog">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-label="Close"><span
                                                aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">You are dropping <code></code></h4>
                                    </div>
                                    <div class="modal-body">
                                        <input type="hidden" class="form-control" name="drop_id">
                                        <p>Be careful, you cannot undo this process when you confirmed!!!</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                        </button>
                                        <button type="submit" class="btn btn-primary" name="action" value="drop">Drop it
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<% }%>
<footer class="footer">
    <div class="container">
        <h3>ติดต่อเรา</h3>
        <p>คณะเทคโนโลยีสารสนเทศ สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง</p>
        <p class="text-muted" href="//www.it.kmitl.ac.th">www.it.kmitl.ac.th</p>
    </div>
</footer>

<!-- jQuery first, then Bootstrap JS. -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
        integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous">
</script>

<script>
    $('.drop').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var portfolio_id = button.data('id')
        var portfolio_name = button.data('name')

        var modal = $(this)
        modal.find('.modal-title code').text(portfolio_name)
        modal.find('.modal-body input').val(portfolio_id)
    })
</script>
</body>
</html>