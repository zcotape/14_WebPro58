<%@ page import="customer.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Result</title>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw==" crossorigin="anonymous">
</head>
<body>

    <div class="container">
        <h1>Customer Information</h1>
        <%
            Customer newCustomer = (Customer)request.getAttribute("newcustomer");
            Customer findCustomer = (Customer)request.getAttribute("findcustomer");
            if(newCustomer != null) {
                out.println("<b>First Name: </b>" + newCustomer.getFirstName() + "<br />");
                out.println("<b>Last Name: </b>" + newCustomer.getLastName() + "<br />");
                out.println("<b>Company: </b>" + newCustomer.getCompany() + "<br />");
                out.println("<b>Mobile: </b>" + newCustomer.getMobile() + "<br />");
                out.println("<b>E-mail: </b>" + newCustomer.getEmail() + "<br />");
                out.println("<b>Address: </b>" + newCustomer.getAddr() + "<br />");
            } else if (findCustomer != null){
                out.println("<b>First Name: </b>" + findCustomer.getFirstName() + "<br />");
                out.println("<b>Last Name: </b>" + findCustomer.getLastName() + "<br />");
                out.println("<b>Company: </b>" + findCustomer.getCompany() + "<br />");
                out.println("<b>Mobile: </b>" + findCustomer.getMobile() + "<br />");
                out.println("<b>E-mail: </b>" + findCustomer.getEmail() + "<br />");
                out.println("<b>Address: </b>" + findCustomer.getAddr() + "<br />");
            }
            else {
                response.sendRedirect("index.html");
            }
        %>
    </div>

    <script src="https://code.jquery.com/jquery-1.12.0.min.js\" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha256-KXn5puMvxCw+dAYznun+drMdG1IFl3agK0p/pqT9KAo= sha512-2e8qq0ETcfWRI4HJBzQiA3UoyFk6tbNyG+qSaIBZLyW9Xf3sWZHN/lxe9fTh1U45DpPf07yj94KsUHHWe4Yk1A==" crossorigin="anonymous"></script>
</body>
</html>

