<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="contains/header.jsp" %>

<%@ include file="contains/navbar.jsp" %>

<div class="container header-top">
    <div class="page-header">
        <h1>Update your account</h1>
    </div>
</div>

<%
    if (session.getAttribute("role").equals("student")) {
%>
<div class="container">
    <form class="form-horizontal" action="update" method="post">
        <div class="form-group">
            <label class="col-sm-2 control-label">Username</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" value="<% out.print(session.getAttribute("username"));%>"
                       readonly>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">ชื่อ นามสกุล</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" value="<%out.print(session.getAttribute("th_name"));%>"
                       readonly>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">ชื่อ นามสกุล (English)</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" value="<%out.print(session.getAttribute("en_name"));%>"
                       readonly>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">Email Address</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="email"
                       value="<%out.print(session.getAttribute("email"));%>">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">Password</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" name="password">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".confirmation">Update
                    Profile
                </button>
            </div>
        </div>
</div>
<% } else { %>
<div class="container">
    <form class="form-horizontal" action="update" method="post">
        <div class="form-group">
            <label class="col-sm-2 control-label">Username</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" value="<% out.print(session.getAttribute("username"));%>"
                       readonly>
            </div>
        </div>
            <% if (session.getAttribute("role").equals("teacher")) { %>
        <div class="form-group">
            <label class="col-sm-2 control-label">คำนำหน้า</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" value="<%out.print(session.getAttribute("th_prename"));%>"
                       readonly>
            </div>
        </div>
            <% } %>
        <div class="form-group">
            <label class="col-sm-2 control-label">ชื่อ นามสกุล</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" value="<%out.print(session.getAttribute("th_name"));%>"
                       readonly>
            </div>
        </div>
            <% if (session.getAttribute("role").equals("teacher")) { %>
        <div class="form-group">
            <label class="col-sm-2 control-label">คำนำหน้าชื่อ (English)</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" value="<%out.print(session.getAttribute("en_prename"));%>"
                       readonly>
            </div>
        </div>
            <% } %>
        <div class="form-group">
            <label class="col-sm-2 control-label">ชื่อ นามสกุล (English)</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" value="<%out.print(session.getAttribute("en_name"));%>"
                       readonly>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">Password</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" name="password">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">Email Address</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="email"
                       value="<%out.print(session.getAttribute("email"));%>">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">Mobile Phone</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="mobile"
                       value="<%out.print(session.getAttribute("mobile"));%>">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".confirmation">Update
                    Profile
                </button>
            </div>
        </div>
</div>
<% } %>

<div class="modal fade confirmation" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Caution!</h4>
            </div>
            <div class="modal-body">
                <p>Do you want to update your profile?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
</form>


<%@ include file="contains/footer.jsp" %>
