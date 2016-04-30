<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="contains/header.jsp" %>
<%@ include file="contains/navbar.jsp" %>
<%@ include file="contains/datasource.jsp" %>

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
                            <td>Archive Name</td>
                            <td>Action</td>
                        </tr>
                        <c:forEach var="list" items="${queryPortfolio.rows}">
                            <tr>
                                <td><c:out value="${list.arch_id}"/></td>
                                <td><c:out value="${list.arch_name}"/></td>
                                <td>
                                    <div class="btn-group" role="group" aria-label="...">
                                        <button type="button" class="btn btn-default" data-toggle="modal"
                                                data-target=".edit" name="edit" data-id="${list.arch_id}"
                                                data-name="${list.arch_name}">Edit
                                        </button>
                                        <button type="button" class="btn btn-default" data-toggle="modal"
                                                data-target=".drop" name="drop" data-id="${list.arch_id}"
                                                data-name="${list.arch_name}">Drop
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <form action="portfolio.action" method="post">
                        <div class="modal fade edit" tabindex="-1" role="dialog">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">

                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-label="Close"><span
                                                aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">You are editing <code></code></h4>
                                    </div>
                                    <div class="modal-body">
                                        <input type="hidden" class="form-control" name="edit_id">
                                        <div class="form-group">
                                            <label for="portID" class="control-label">Portfolio ID:</label>
                                            <input type="text" class="form-control" id="portID" disabled>
                                        </div>
                                        <div class="form-group">
                                            <label for="portName" class="control-label">Portfolio Name:</label>
                                            <input type="text" class="form-control" id="portName">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                        </button>
                                        <button type="submit" class="btn btn-primary" name="action" value="edit">Update
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
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

<% } else if (session.getAttribute("role").equals("staff")) {%>

<% } else { %>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Registered Portfolio in System</h3>
                </div>
                <div class="panel-body">
                    <p class="archieve-count">
                        <c:forEach var="list" items="${queryCountAll.rows}">
                            <c:choose>
                                <c:when test="${list.count == 1}">
                                    Only ${list.count} Portfolio
                                </c:when>
                                <c:otherwise>
                                    ${list.count} Portfolios
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
                            <td>Archive Name</td>
                            <td>Action</td>
                        </tr>
                        <c:forEach var="list" items="${queryAll.rows}">
                            <tr>
                                <td><c:out value="${list.arch_id}"/></td>
                                <td><c:out value="${list.arch_name}"/></td>
                                <td>
                                    <div class="btn-group" role="group" aria-label="...">
                                        <button type="button" class="btn btn-default" data-toggle="modal"
                                                data-target=".edit" name="edit" data-id="${list.arch_id}"
                                                data-name="${list.arch_name}">Edit
                                        </button>
                                        <button type="button" class="btn btn-default" data-toggle="modal"
                                                data-target=".drop" name="drop" data-id="${list.arch_id}"
                                                data-name="${list.arch_name}">Drop
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <form action="portfolio.action" method="post">
                        <div class="modal fade edit" tabindex="-1" role="dialog">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-label="Close"><span
                                                aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">You are editing <code></code></h4>
                                    </div>
                                    <div class="modal-body">
                                        <input type="hidden" class="form-control" name="edit_id">
                                        <div class="form-group">
                                            <label for="portID" class="control-label">Portfolio ID:</label>
                                            <input type="text" class="form-control" id="portID" disabled>
                                        </div>
                                        <div class="form-group">
                                            <label for="portName" class="control-label">Portfolio Name:</label>
                                            <input type="text" class="form-control" id="portName">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                        </button>
                                        <button type="submit" class="btn btn-primary" name="action" value="edit">Update
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
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

<% } %>

<!-- jQuery first, then Bootstrap JS. -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
        integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous">
</script>

<script>
    $('.edit').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var portfolio_id = button.data('id')
        var portfolio_name = button.data('name')

        var modal = $(this)
        modal.find('.modal-title code').text(portfolio_name)
        modal.find('.modal-body input', '#portID').val(portfolio_id)
        modal.find('.modal-body #portName').val(portfolio_name)
    })

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