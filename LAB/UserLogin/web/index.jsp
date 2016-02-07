<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="contains/header.jsp" %>

<div class="login-card">
    <h1>Log-in</h1><br>
    <form action="login" method="POST">
        <input type="text" name="username" placeholder="Username">
        <input type="password" name="password" placeholder="Password">
        <input type="submit" name="login" class="login login-submit" value="login">
    </form>
</div>

<%@ include file="contains/footer.jsp" %>
