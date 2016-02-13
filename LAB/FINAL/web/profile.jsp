<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="contains/header.jsp"%>

<%@ include file="contains/navbar.jsp"%>

<div class="container header-top">
    <div class="page-header">
        <h1>Update your profile</h1>
    </div>
</div>

<%
    if (request.getAttribute("role").equals("student")) {
%>
<div class="container">
    <form class="form-horizontal" action="update" method="post">
        <div class="form-group">
            <label class="col-sm-2 control-label">Username</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" value="<% out.print(request.getAttribute("username"));%>" disabled>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">ชื่อ</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="first_name" value="<%out.print(request.getAttribute("first_name"));%>">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">นามสกุล</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="last_name" value="<%out.print(request.getAttribute("last_name"));%>">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">หมายเลขโทรศัพท์มือถือ</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="mobile_phone" value="<%out.print(request.getAttribute("mobile_phone"));%>">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">ชั้นปี</label>
            <div class="col-sm-10">
                <select class="form-control">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">Update Profile</button>
            </div>
        </div>
    </form>
</div>
<% } else { %>
<div class="container">
    <form class="form-horizontal" action="update" method="post">
        <div class="form-group">
            <label class="col-sm-2 control-label">Username</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" value="<% out.print(request.getAttribute("username"));%>" disabled>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">ชื่อ</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="firstname" value="<%out.print(request.getAttribute("first_name"));%>">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">นามสกุล</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="lastname" value="<%out.print(request.getAttribute("last_name"));%>">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">Update Profile</button>
            </div>
        </div>
    </form>
</div>
<% } %>
<%@ include file="contains/footer.jsp"%>
