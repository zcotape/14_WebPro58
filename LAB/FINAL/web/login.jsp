<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="contains/login_header.jsp"%>

<div class="container">
     <form class="form-signin" action="auth" method="post">
         <h2 class="form-signin-heading">Please login</h2>
         <label class="sr-only">Username</label>
         <input type="text" name="inputUsername" class="form-control" placeholder="Username" required="" autofocus="">
         <label class="sr-only">Password</label>
         <input type="password" name="inputPassword" class="form-control" placeholder="Password" required="">
         <div class="checkbox">
             <label>
                 <input type="checkbox" value="remember-me"> Remember me
             </label>
         </div>
         <button class="btn btn-lg btn-primary btn-block" type="submit">Log in</button>
         <br>
         <%
             if(request.getAttribute("error") != null) {
                 if((Integer)request.getAttribute("error") == 1) {
                     out.println("<div class=\"alert alert-danger\" role=\"alert\"><b>Error!</b> incorrect username or password</div>");
                 } else if((Integer)request.getAttribute("error") == 2) {
                     out.println("<div class=\"alert alert-info\" role=\"alert\">Please login first.</div>");
                 }
             }
         %>
     </form>
    </div>
</div>

<%@ include file="contains/footer.jsp"%>