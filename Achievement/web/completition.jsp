<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="contains/header.jsp" %>

<%@ include file="contains/navbar.jsp" %>

<%@ include file="contains/datasource.jsp" %>

<div class="container header-top">
    <div class="page-header">
        <h1>Completition | ลงทะเบียนการแข่งขัน</h1>
    </div>
    <form action="" method="post" enctype="multipart/form-data">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">ข้อมูลนักศึกษาและอาจารย์ที่ปรึกษา</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="control-label">นักศึกษาที่เข้าร่วม | Competition Attendee</label>
                    <select class="form-control" name="co_student">
                        <option>ไม่มี</option>
                        <c:forEach var="list" items="${query_student_name.rows}">
                            <option value="${list.student_id}">${list.th_name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label class="control-label">ชื่ออาจารย์ที่ปรึกษา | Competition Advisor</label>
                    <select class="form-control" name="advisor">
                        <option>เลือกอาจารย์ที่ปรึกษา</option>
                        <c:forEach var="list" items="${query_teacher_name.rows}">
                            <option value="${list.teacher_id}">${list.th_prename} ${list.th_name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">ข้อมูลการแข่งขัน</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="control-label">ชื่อการแข่งขัน | Competition Name <span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span></label>
                    <input type="text" class="form-control" name="event_name">
                </div>
                <div class="form-group">
                    <label class="control-label">หมวดการแข่งขัน | Competition Topic</label>
                    <input type="text" class="form-control" name="topic">
                </div>
                <div class="form-group">
                    <label class="control-label">ระดับ | Level</label>
                    <select class="form-control" name="level">
                        <option>เลือกระดับ</option>
                        <option value="1">ระดับชั้น</option>
                        <option value="2">ระดับสถาบันการศึกษา / มหาวิทยาลัย
                        </option>
                        <option value="3">ระดับจังหวัด</option>
                        <option value="4">ระดับภูมิภาค</option>
                        <option value="5">ระดับประเทศ</option>
                        <option value="6">ระดับนานาชาติ</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="control-label">ประเภท | Type</label>
                    <select class="form-control" name="category">
                        <option>เลือกประเภท</option>
                        <option value="1">วิชาการ (เดี่ยว)</option>
                        <option value="2">วิชาการ (ทีม)</option>
                        <option value="3">คุณธรรม จริยธรรม</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">ส่วนรายละเอียดหน่วยงาน</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="control-label">หน่วยงานที่จัด</label>
                    <select class="form-control" name="organization_name">
                        <option>เลือกหน่วยงานที่จัด</option>
                        <c:forEach var="list" items="${query_organization_name.rows}">
                            <option value="${list.id}">${list.organization_name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <div class="form-group">
                        <label class="control-label">ถ้าไม่มีเลือก ให้เพิ่มในช่องนี้</label>
                        <input type="text" class="form-control" name="organization_optinal_name">
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-group">
                        <label class="control-label">ชื่อผลงาน | Reward's Name</label>
                        <input type="text" class="form-control" name="achievement_name">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">ผลงานได้อันดับ | Rank</label>
                    <select class="form-control" id="rank" name="rank">
                        <option>เลือกอันดับ</option>
                        <option value="1">รางวัลชนะเลิศ</option>
                        <option value="2">รางวัลรองชนะเลิศอันดับที่ 1</option>
                        <option value="3">รางวัลรองชนะเลิศอันดับที่ 2</option>
                        <option value="4">รางวัลชมเชย</option>
                        <option value="5">ได้เข้าร่วมการแข่งขัน</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="control-label">หากไม่มีให้เลือก สามารถพิมพ์ในช่องนี้ได้</label>
                    <input type="text" class="form-control" name="rank_optional">
                </div>
                <div class="form-group">
                    <label class="control-label">รางวัล | Reward</label>
                    <textarea type="text" class="form-control" name="reward"></textarea>
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
                    <div id="competition_publish_date" class="input-group date" data-date-format="mm-dd-yyyy">
                        <input class="form-control" type="text" name="publish-date" readonly/>
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
            <button type="submit" class="btn btn-primary">Update</button>
        </div>
    </form>
</div>

<%@ include file="contains/footer.jsp" %>