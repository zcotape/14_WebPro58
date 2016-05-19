<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="contains/header.jsp" %>

<%@ include file="contains/navbar.jsp" %>

<%@ include file="contains/datasource.jsp" %>

<form action="edit.achievement" method="post" enctype="multipart/form-data">
    
    <!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
        integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous">
</script>
    
    <% if (request.getAttribute("achievement_type").equals("1")) { %>
    <%
        Integer level = (Integer) request.getAttribute("level");
        System.out.println(level);
        Integer rank = (Integer) request.getAttribute("rank");
        Integer category = (Integer) request.getAttribute("category");
    %>
    <div class="container header-top">
        <div class="page-header">
            <h1>Edit Completition<br><small>แก้ไขผลงานการแข่งขัน</small></h1>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">ข้อมูลการแข่งขัน</h3>
            </div>
            <div class="panel-body">
                <input type="hidden" name="achievement_id" value="<% out.print(request.getAttribute("achievement_id"));%>" />
                <div class="form-group">
                    <label class="control-label">ชื่อการแข่งขัน | Competition Name <span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span></label>
                    <input type="text" class="form-control" name="event_name" value="<% out.print(request.getAttribute("event_name"));%>">
                </div>
                <div class="form-group">
                    <label class="control-label">หมวดการแข่งขัน | Competition Topic</label>
                    <input type="text" class="form-control" name="topic" value="<% out.print(request.getAttribute("topic"));%>">
                </div>
                <div class="form-group">
                    <label class="control-label">ระดับ | Level</label>
                    <select class="form-control" name="level">
                        <% switch (level) {
                                case 1: %>
                        <option>เลือกระดับ</option>
                        <option value="1" selected>ระดับชั้น</option>
                        <option value="2">ระดับสถาบันการศึกษา / มหาวิทยาลัย
                        </option>
                        <option value="3">ระดับจังหวัด</option>
                        <option value="4">ระดับภูมิภาค</option>
                        <option value="5">ระดับประเทศ</option>
                        <option value="6">ระดับนานาชาติ</option>
                        <% break;
                            case 2: %>
                        <option>เลือกระดับ</option>
                        <option value="1">ระดับชั้น</option>
                        <option value="2" selected>ระดับสถาบันการศึกษา / มหาวิทยาลัย
                        </option>
                        <option value="3">ระดับจังหวัด</option>
                        <option value="4">ระดับภูมิภาค</option>
                        <option value="5">ระดับประเทศ</option>
                        <option value="6">ระดับนานาชาติ</option>
                        <% break;
                            case 3: %>
                        <option>เลือกระดับ</option>
                        <option value="1">ระดับชั้น</option>
                        <option value="2">ระดับสถาบันการศึกษา / มหาวิทยาลัย
                        </option>
                        <option value="3" selected>ระดับจังหวัด</option>
                        <option value="4">ระดับภูมิภาค</option>
                        <option value="5">ระดับประเทศ</option>
                        <option value="6">ระดับนานาชาติ</option>
                        <% break;
                            case 4: %>
                        <option>เลือกระดับ</option>
                        <option value="1">ระดับชั้น</option>
                        <option value="2">ระดับสถาบันการศึกษา / มหาวิทยาลัย
                        </option>
                        <option value="3">ระดับจังหวัด</option>
                        <option value="4" selected>ระดับภูมิภาค</option>
                        <option value="5">ระดับประเทศ</option>
                        <option value="6">ระดับนานาชาติ</option>
                        <% break;
                            case 5: %>
                        <option>เลือกระดับ</option>
                        <option value="1">ระดับชั้น</option>
                        <option value="2">ระดับสถาบันการศึกษา / มหาวิทยาลัย
                        </option>
                        <option value="3">ระดับจังหวัด</option>
                        <option value="4">ระดับภูมิภาค</option>
                        <option value="5" selected>ระดับประเทศ</option>
                        <option value="6">ระดับนานาชาติ</option>
                        <% break;
                            case 6: %>
                        <option>เลือกระดับ</option>
                        <option value="1">ระดับชั้น</option>
                        <option value="2">ระดับสถาบันการศึกษา / มหาวิทยาลัย
                        </option>
                        <option value="3">ระดับจังหวัด</option>
                        <option value="4">ระดับภูมิภาค</option>
                        <option value="5">ระดับประเทศ</option>
                        <option value="6" selected>ระดับนานาชาติ</option>
                        <% break;
                            default: %>
                        <option>เลือกระดับ</option>
                        <option value="1">ระดับชั้น</option>
                        <option value="2">ระดับสถาบันการศึกษา / มหาวิทยาลัย
                        </option>
                        <option value="3">ระดับจังหวัด</option>
                        <option value="4">ระดับภูมิภาค</option>
                        <option value="5">ระดับประเทศ</option>
                        <option value="6">ระดับนานาชาติ</option>
                        <% break;
                            }%>
                    </select>
                </div>
                <div class="form-group">
                    <label class="control-label">ประเภท | Type</label>
                    <select class="form-control" name="category">
                        <% switch (category) {
                                case 1: %>
                        <option>เลือกประเภท</option>
                        <option value="1" selected>วิชาการ (เดี่ยว)</option>
                        <option value="2">วิชาการ (ทีม)</option>
                        <option value="3">คุณธรรม จริยธรรม</option>
                        <% break;
                            case 2: %>
                        <option>เลือกประเภท</option>
                        <option value="1">วิชาการ (เดี่ยว)</option>
                        <option value="2" selected>วิชาการ (ทีม)</option>
                        <option value="3">คุณธรรม จริยธรรม</option>
                        <% break;
                            case 3: %>
                        <option>เลือกประเภท</option>
                        <option value="1">วิชาการ (เดี่ยว)</option>
                        <option value="2">วิชาการ (ทีม)</option>
                        <option value="3" selected>คุณธรรม จริยธรรม</option>
                        <% break;
                            default: %>
                        <option>เลือกประเภท</option>
                        <option value="1">วิชาการ (เดี่ยว)</option>
                        <option value="2">วิชาการ (ทีม)</option>
                        <option value="3">คุณธรรม จริยธรรม</option>
                        <% break;
                            }%>
                    </select>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">ส่วนรายละเอียดผลงาน</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <div class="form-group">
                        <label class="control-label">ชื่อผลงาน | Achievement's Name</label>
                        <input type="text" class="form-control" name="achievement_name" value="<% out.print(request.getAttribute("achievement_name"));%>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">ผลงานได้อันดับ | Rank</label>
                    <select class="form-control" id="rank" name="rank">
                        <% switch (level) {
                                case 1: %>
                        <option>เลือกอันดับ</option>
                        <option value="1" selected>รางวัลชนะเลิศ</option>
                        <option value="2">รางวัลรองชนะเลิศอันดับที่ 1</option>
                        <option value="3">รางวัลรองชนะเลิศอันดับที่ 2</option>
                        <option value="4">รางวัลชมเชย</option>
                        <option value="5">ได้เข้าร่วมการแข่งขัน</option>
                        <% break;
                            case 2: %>
                        <option>เลือกอันดับ</option>
                        <option value="1">รางวัลชนะเลิศ</option>
                        <option value="2" selected>รางวัลรองชนะเลิศอันดับที่ 1</option>
                        <option value="3">รางวัลรองชนะเลิศอันดับที่ 2</option>
                        <option value="4">รางวัลชมเชย</option>
                        <option value="5">ได้เข้าร่วมการแข่งขัน</option>
                        <% break;
                            case 3: %>
                        <option>เลือกอันดับ</option>
                        <option value="1">รางวัลชนะเลิศ</option>
                        <option value="2">รางวัลรองชนะเลิศอันดับที่ 1</option>
                        <option value="3" selected>รางวัลรองชนะเลิศอันดับที่ 2</option>
                        <option value="4">รางวัลชมเชย</option>
                        <option value="5">ได้เข้าร่วมการแข่งขัน</option>
                        <% break;
                            case 4: %>
                        <option>เลือกอันดับ</option>
                        <option value="1">รางวัลชนะเลิศ</option>
                        <option value="2">รางวัลรองชนะเลิศอันดับที่ 1</option>
                        <option value="3">รางวัลรองชนะเลิศอันดับที่ 2</option>
                        <option value="4"selected>รางวัลชมเชย</option>
                        <option value="5">ได้เข้าร่วมการแข่งขัน</option>
                        <% break;
                            case 5: %>
                        <option>เลือกอันดับ</option>
                        <option value="1">รางวัลชนะเลิศ</option>
                        <option value="2">รางวัลรองชนะเลิศอันดับที่ 1</option>
                        <option value="3">รางวัลรองชนะเลิศอันดับที่ 2</option>
                        <option value="4">รางวัลชมเชย</option>
                        <option value="5" selected>ได้เข้าร่วมการแข่งขัน</option>
                        <% break;
                            default: %>
                        <option>เลือกอันดับ</option>
                        <option value="1">รางวัลชนะเลิศ</option>
                        <option value="2">รางวัลรองชนะเลิศอันดับที่ 1</option>
                        <option value="3">รางวัลรองชนะเลิศอันดับที่ 2</option>
                        <option value="4">รางวัลชมเชย</option>
                        <option value="5">ได้เข้าร่วมการแข่งขัน</option>
                        <% break;
                            }%>
                    </select>
                </div>
                <div class="form-group">
                    <label class="control-label">รางวัล | Reward</label>
                    <textarea type="text" class="form-control" name="reward" ><% out.print(request.getAttribute("reward"));%></textarea>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">ส่วนอื่นๆ</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="control-label">วันที่ออกใบประกาศ</label>
                    <div id="competition_publish_date" class="input-group date" data-date-format="yyyy-mm-dd">
                        <input class="form-control" type="text" name="publish_date" value="<% out.print(request.getAttribute("publish_date"));%>" readonly/>
                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                    </div>                    
                </div>
                <div class="form-group">
                    <label class="control-label">Upload File</label>
                    <input type="file" name="file">
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="submit" name="action" value="competition" class="btn btn-primary">Update</button>
        </div>
    </div>
    <% } else if (request.getAttribute("achievement_type").equals("2")) { %>
    <%
        System.out.println(request.getAttribute("year"));
        Integer year = Integer.parseInt(request.getAttribute("year").toString());
    %>
    <div class="container header-top">
        <div class="page-header">
            <h1>Edit Ambassador<br><small>แก้ไขผลงานทูตหรือตัวแทนการแข่งขัน</small></h1>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">รายละเอียด</h3>
            </div>
            <div class="panel-body">
                <input type="hidden" name="achievement_id" value="<% out.print(request.getAttribute("achievement_id"));%>" />
                <div class="form-group">
                    <label class="control-label">ชื่อผลงาน</label>
                    <input type="text" class="form-control" name="achievement_name" value="<% out.print(request.getAttribute("achievement_name"));%>">
                </div>
                <div class="form-group">
                    <label class="control-label">ประจำปี</label>
                    <select class="form-control" name="year">
                        <% for (int i = 2000; i <= 2030; i++) {%>
                        <% if (i == year) {%>
                        <option value="<%= i%>" selected><%= i%></option>
                        <% } else {%>
                        <option value="<%= i%>"><%= i%></option>
                        <% } %>
                        <% } %>
                    </select>
                </div>
                <div class="form-group">
                    <label class="control-label">วันที่ออกใบประกาศ</label>
                    <div id="ambassador_publish_date" class="input-group date" data-date-format="yyyy-mm-dd">
                        <input class="form-control" type="text" name="publish_date" value="<% out.print(request.getAttribute("publish_date"));%>" readonly/>
                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                    </div>
                </div>
                <div class="form-group">
                    <label>Upload your file</label>
                    <input type="file" name="ambassador_file">
                </div>
                <div class="modal-footer">
                    <button type="submit" name="action" value="ambassador" class="btn btn-primary">Update
                    </button>
                </div>
            </div>
        </div>
    </div>
    <% } else { %>
    <div class="container header-top">
        <div class="page-header">
            <h1>Edit Certificate<br><small>แก้ไขใบประกาศความเชี่ยวชาญ</small></h1>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">รายละเอียด</h3>
            </div>
            <div class="panel-body">
                <input type="hidden" name="achievement_id" value="<% out.print(request.getAttribute("achievement_id"));%>" />
                <div class="form-group">
                    <label class="control-label">ชื่อผลงาน</label>
                    <input type="text" class="form-control" name="achievement_name" value="<% out.print(request.getAttribute("achievement_name"));%>">
                </div>
                <div class="form-group">
                    <label class="control-label">วันที่ออกใบประกาศ</label>
                    <div id="publish_date" class="input-group date" data-date-format="yyyy-mm-dd">
                        <input class="form-control" type="text" name="publish_date" value="<% out.print(request.getAttribute("publish_date"));%>" readonly/>
                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">วันที่ใบประกาศหมดอายุ</label>
                    <div id="expire_date" class="input-group date" data-date-format="yyyy-mm-dd">
                        <input class="form-control" type="text" name="expire_date" value="<% out.print(request.getAttribute("expire_date"));%>" readonly/>
                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                    </div>
                </div>
                <div class="form-group">
                    <label>Upload your file</label>
                    <input type="file" name="certificate_file">
                </div>
                <div class="modal-footer">
                    <button type="submit" name="action" value="certificate" class="btn btn-primary">Update
                    </button>
                </div>
            </div>
        </div>
    </div>
    <% }%>
</form>

<%@ include file="contains/footer.jsp" %>
