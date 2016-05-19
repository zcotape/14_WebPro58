<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="contains/header.jsp" %>
<% if (session.getAttribute("username") == null) { %>
<% } else { %>
<%@ include file="contains/navbar.jsp" %>
<% } %>
<div class="container header-top">
    <div class="page-header">
        <h1>Search your achievement name<br><small>ค้นหาชื่อผลงานของคุณ</small></h1>
    </div>
</div>

<div class="container">
    <% if (session.getAttribute("username") == null) { %>
    <form class="form-horizontal" action="guest.result" method="get">
        <div class="col-lg-12">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search for..." name="search_query">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="submit">Go!</button>
                </span>
            </div>
        </div>
    </form>
    <% } else { %>
    <form class="form-horizontal" action="result" method="get">
        <div class="col-lg-12">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search for..." name="search_query">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="submit">Go!</button>
                </span>
            </div>
        </div>
    </form>
    <% } %>
</div>

<%@ include file="contains/footer.jsp" %>
