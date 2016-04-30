<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="contains/header.jsp" %>

<%@ include file="contains/navbar.jsp" %>

<%@ include file="contains/datasource.jsp" %>

<div class="container header-top">
    <div class="page-header">
        <h1>Add your achievement</h1>
    </div>
</div>

<div class="container">
    <div class="btn-group btn-group-justified" role="group" aria-label="...">
        <div class="btn-group" role="group">
            <button type="button" class="btn btn-default" data-toggle="modal" data-target=".competition">
                ลงทะเบียนการแข่งขัน | Compete Registration
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" class="btn btn-default" data-toggle="modal" data-target=".participation">
                ลงทะเบียนเข้าร่วมโครงการ | Participate Registration
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" class="btn btn-default" data-toggle="modal" data-target=".certificate">
                ลงทะเบียนใบประกาศเกียรติคุณ | Certificate Registration
            </button>
        </div>
    </div>
</div>

<form method="post" action="achievement.register">
    <div class="modal fade competition" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">ลงทะเบียนการแข่งขัน | Compete Registration</h4>
                </div>
                <div class="modal-body">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">อาจารย์ที่ปรึกษา</h3>
                        </div>
                        <div class="panel-body">
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
                                <label class="control-label">ชื่อโครงการ | Competition Name</label>
                                <input type="text" class="form-control" name="compete_name">
                            </div>
                            <div class="form-group">
                                <label class="control-label">หมวดการแข่งขัน | Competition Topic</label>
                                <input type="text" class="form-control" name="compete_topic">
                            </div>
                            <div class="form-group">
                                <label class="control-label">ระดับ | Level</label>
                                <select class="form-control" name="compete_level">
                                    <option>เลือกระดับ</option>
                                    <option value="ระดับชั้น">ระดับชั้น</option>
                                    <option value="ระดับสถาบันการศึกษา / มหาวิทยาลัย">ระดับสถาบันการศึกษา / มหาวิทยาลัย
                                    </option>
                                    <option value="ระดับจังหวัด">ระดับจังหวัด</option>
                                    <option value="ระดับภูมิภาค">ระดับภูมิภาค</option>
                                    <option value="ระดับประเทศ">ระดับประเทศ</option>
                                    <option value="ระดับนานาชาติ">ระดับนานาชาติ</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class="control-label">ประเภท | Type</label>
                                <select class="form-control" name="compete_type">
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
                                    <input type="text" class="form-control" name="reward_name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">ผลงานได้อันดัน | Rank</label>
                                <input type="text" class="form-control" name="reward_rank">
                            </div>
                            <div class="form-group">
                                <label class="control-label">รางวัล | Reward</label>
                                <textarea type="text" class="form-control" name="reward_description"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">ส่วนอื่นๆ</h3>
                        </div>
                        <div class="form-group">
                            <label class="control-label">วันที่ออกใบประกาศ</label>
                            <div id="competition_publish_date" class="input-group date" data-date-format="mm-dd-yyyy">
                                <input class="form-control" type="text" name="publish-date" readonly/>
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close
                    </button>
                    <button type="submit" class="btn btn-primary" name="action" value="competition">Update
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade participation" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">ลงทะเบียนเข้าร่วมโครงการ | Participate Registration</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label">ชื่อผลงาน</label>
                        <input type="text" class="form-control" name="reward">
                    </div>
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
                        <label class="control-label">ประจำปี</label>
                        <input type="text" class="form-control" name="year">
                    </div>
                    <div class="form-group">
                        <label class="control-label">วันที่ออกใบประกาศ</label>
                        <div id="ambassador_publish_date" class="input-group date" data-date-format="mm-dd-yyyy">
                            <input class="form-control" type="text" name="publish-date" readonly/>
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Upload your file</label>
                        <input type="file" name="ambassador_file">
                        <p class="help-block">We recommend you upload with .pdf file(s). <br> If you
                            have multiple file, please zip before uploaded.</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close
                    </button>
                    <button type="submit" class="btn btn-primary" name="action" value="participation">Update
                    </button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade certificate" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">ลงทะเบียนใบประกาศเกียรติคุณ | Certificate Registration</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label">ชื่อผลงาน</label>
                        <input type="text" class="form-control" name="reward_name">
                    </div>
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
                        <label class="control-label">วันที่ออกใบประกาศ</label>
                        <div id="publish_date" class="input-group date" data-date-format="mm-dd-yyyy">
                            <input class="form-control" type="text" name="publish-date" readonly/>
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label">วันที่ใบประกาศหมดอายุ</label>
                        <div id="expire_date" class="input-group date" data-date-format="mm-dd-yyyy">
                            <input class="form-control" type="text" readonly name="expire-date"/>
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Upload your file</label>
                        <input type="file" name="certificate_file">
                        <p class="help-block">We recommend you upload with .pdf file(s). <br> If you
                            have multiple file, please zip before uploaded.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close
                        </button>
                        <button type="submit" class="btn btn-primary" name="action" value="certificate">Update
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<%@ include file="contains/footer.jsp" %>

<script>
    $(function () {
        $("#publish_date, #expire_date, #ambassador_publish_date, #competition_publish_date").datepicker({
            autoclose: true,
            todayHighlight: true
        }).datepicker('update', new Date());
        ;
    });

</script>