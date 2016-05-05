<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="guide.Guide" %>
<%@include file="contains/cover_header.jsp" %>

<video autoplay loop id="video-background" muted>
  <source src="http://cheatnotz.in.th/content/it_ladkrabang_presentation.mp4" type="video/mp4">
</video>

<div class="site-wrapper">
    <div class="site-wrapper-inner">
        <div class="cover-container">
            <div class="masthead clearfix">
                <div class="inner">
                    <h3 class="masthead-brand">Achievement Record</h3>
                    <nav>
                        <ul class="nav masthead-nav">
                            <li class="active"><a href="<% out.print(Guide.getRoute(request, ""));%>">Home</a></li>
                            <li><a href="<% out.print(Guide.getRoute(request, "auth"));%>">Login</a></li>
                        </ul>
                    </nav>
                </div>
            </div>

            <div class="inner cover">
                <h1 class="cover-heading">Combine your achievement in one place.</h1>
                <p class="lead">อยากจะค้นหาอะไร อยากรู้ว่าคณะนี้มีชื่อเสียงด้านไหน ทำไมไม่ลองค้นหาดูหละ</p>
                <p class="lead">
                    <a href="<% out.print(Guide.getRoute(request, "guest.search"));%>" class="btn btn-lg btn-default">Search | ค้นหา</a>
                    <a href="<% out.print(Guide.getRoute(request, "auth"));%>" class="btn btn-lg btn-info">Login | เข้าสู่ระบบ</a>
                </p>
            </div>

            <div class="mastfoot">
                <div class="inner">
                    <p>Develop by <a href="http://www.it.kmitl.ac.th">IT Ladkrabang</a>, by <a>IT@KMITL #12</a>.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="contains/cover_footer.jsp" %>