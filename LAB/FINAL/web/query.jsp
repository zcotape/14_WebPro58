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
                    <h3 class="panel-title">Result</h3>
                </div>
                <div class="list-group">
                    <table class="table">
                        <tr>
                            <td>#</td>
                            <td>Archive Name</td>
                            <td></td>
                        </tr>
                        <% for (int i = 0; i <= 10; i++) {
                            out.print("<tr>\n" +
                                    "                            <td>\n</td>\n" +
                                    "                            <td>Testing</td>\n" +
                                    "                            <td>\n" +
                                    "                                <div class=\"btn-group\" role=\"group\" aria-label=\"...\">\n" +
                                    "                                    <button type=\"button\" class=\"btn btn-default\">Edit</button>\n" +
                                    "                                    <button type=\"button\" class=\"btn btn-default\">Drop</button>\n" +
                                    "                                </div>\n" +
                                    "                            </td>\n" +
                                    "                        </tr>");
                        }%>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<% } else if (request.getAttribute("role").equals("staff")) {%>

<% } else { %>

<% } %>

<%@ include file="contains/footer.jsp"%>