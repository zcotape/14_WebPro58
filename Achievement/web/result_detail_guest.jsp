<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="guide.Guide" %>
<%@ include file="contains/result_header.jsp" %>

<%@ include file="contains/datasource.jsp" %>

<div class="container header-top">
    <% System.out.println(request.getAttribute("achievement_name")); %>
    <div class="page-header">
        <h1>Your achievement name<br><small><% out.print(request.getAttribute("achievement_name"));%></small></h1>
    </div>
</div>

<div class="container">
    <% if ((request.getAttribute("achievement_type").equals("1"))) { %>
    <div class="row">
        <img src="<% out.print(Guide.getRoute(request, "content.image?id=" + request.getAttribute("achievement_id")));%>" class="img-responsive" alt="Responsive image" />
        <hr>
    </div>

    <div class="row">
        <div class="col-lg-6 col-md-6 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">ส่วนรายละเอียดข้อมูลบุคคล</h3>
                </div>
                <div class="panel-body">
                    <div class="input-group">
                        <span class="input-group-addon">รหัสนักศึกษา</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("student_id"));%>" readonly>
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon">ชื่อและนามสกุล</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("student_name"));%>" readonly>
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon">อาจารย์ที่ปรึกษา</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("teacher_name"));%>"readonly>
                    </div><br>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">ส่วนรายละเอียดผลงาน</h3>
                </div>
                <div class="panel-body">
                    <div class="input-group">
                        <span class="input-group-addon">ชื่อหน่วยงาน</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("organization_name"));%>" readonly>
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon">ชื่อการแข่งขัน</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("competition_event_name"));%>" readonly>
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon">หมวดการแข่งขัน</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("competition_topic"));%>" readonly>
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon">ประเภท</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("competition_category"));%>" readonly>
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon">ระดับ</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("competition_level"));%>" readonly>
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon">ได้อันดับ</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("competition_rank"));%>" readonly>
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon">รางวัลที่ได้</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("competition_reward"));%>" readonly>
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon">วันเดือนปีที่ได้</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("date"));%>" readonly>
                    </div><br>
                </div>
            </div>
        </div>
    </div>
    <% } else if ((request.getAttribute("achievement_type").equals("2"))) { %>
    <div class="row">
        <img src="<% out.print(Guide.getRoute(request, "content.image?id=" + request.getAttribute("achievement_id")));%>" class="img-responsive" alt="Responsive image" />
        <hr>
    </div>

    <div class="row">
        <div class="col-lg-6 col-md-6 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">ส่วนรายละเอียดข้อมูลบุคคล</h3>
                </div>
                <div class="panel-body">
                    <div class="input-group">
                        <span class="input-group-addon">รหัสนักศึกษา</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("student_id"));%>" readonly>
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon">ชื่อและนามสกุล</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("student_name"));%>" readonly>
                    </div><br>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">ส่วนรายละเอียดผลงาน</h3>
                </div>
                <div class="panel-body">
                    <div class="input-group">
                        <span class="input-group-addon">ชื่อหน่วยงาน</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("organization_name"));%>" readonly>
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon">ประจำปี</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("ambassador_year"));%>" readonly>
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon">วันเดือนปีที่ได้</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("date"));%>" readonly>
                    </div><br>
                </div>
            </div>
        </div>
    </div>
    <a role="button" class="btn btn-primary btn-lg btn-block" href="<% out.print(Guide.getRoute(request, "dashboard"));%>">Back</a>
    <% } else { %>
    <div class="row">
        <img src="<% out.print(Guide.getRoute(request, "content.image?id=" + request.getAttribute("achievement_id")));%>" class="img-responsive" alt="Responsive image" />
        <hr>
    </div>

    <div class="row">
        <div class="col-lg-6 col-md-6 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">ส่วนรายละเอียดข้อมูลบุคคล</h3>
                </div>
                <div class="panel-body">
                    <div class="input-group">
                        <span class="input-group-addon">รหัสนักศึกษา</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("student_id"));%>" readonly>
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon">ชื่อและนามสกุล</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("student_name"));%>" readonly>
                    </div><br>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">ส่วนรายละเอียดผลงาน</h3>
                </div>
                <div class="panel-body">
                    <div class="input-group">
                        <span class="input-group-addon">ชื่อหน่วยงาน</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("organization_name"));%>" readonly>
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon">วันเดือนปีที่ได้</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("publish_date"));%>" readonly>
                    </div><br>
                    <div class="input-group">
                        <span class="input-group-addon">วันเดือนปีที่หมดอายุ</span>
                        <input type="text" class="form-control" value="<% out.print(request.getAttribute("expire_date"));%>" readonly>
                    </div><br>
                </div>
            </div>
        </div>
    </div>
    <a role="button" class="btn btn-primary btn-lg btn-block" href="<% out.print(Guide.getRoute(request, "guest.search"));%>">Back</a>
    <% }%>
</div>

<%@include file="contains/footer.jsp" %>
