<%--
  Created by IntelliJ IDEA.
  User: earthz
  Date: 2/5/16
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="contains/header.jsp" %>
<div class="container">
    <h1>Welcome, <%out.print(request.getAttribute("username")); %></h1>
    <p>Type: <%out.print(request.getAttribute("user_type")); %></p>
</div>

<%@ include file="contains/footer.jsp" %>
