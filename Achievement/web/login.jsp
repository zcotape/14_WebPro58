<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="contains/login_header.jsp" %>

<div class="container">
    <form class="form-signin" action="auth" method="post">
        <h2 class="form-signin-heading">Please login</h2>
        <label class="sr-only">Username</label>
        <input type="text" name="inputUsername" class="form-control" placeholder="Username" required="" autofocus="">
        <label class="sr-only">Password</label>
        <input type="password" name="inputPassword" class="form-control" placeholder="Password" required="">
        <button class="btn btn-lg btn-primary btn-block" type="submit">Log in</button>
        <br>
        <%
            if (request.getAttribute("error") != null) {
                if ((Integer) request.getAttribute("error") == 1) {
                    out.println("<div class=\"alert alert-danger\" role=\"alert\"><b>Error!</b> Incorrect username or password</div>");
                } else if ((Integer) request.getAttribute("error") == 2) {
                    out.println("<div class=\"alert alert-info\" role=\"alert\">Please login first.</div>");
                }
            }
        %>
        <hr>
        <p>ระบบกรอกข้อมูลผลงานนักศึกษา<br>The Achievement Record System</p>
        <code>SID: <% out.print(session.getId());%></code>
    </form>
</div>
</div>

<!-- jQuery first, then Bootstrap JS. -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
        integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous">

</script>

<script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>