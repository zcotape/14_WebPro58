<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="contains/header.jsp" %>

<%@ include file="contains/navbar.jsp" %>

<div class="container header-top">
    <div class="page-header">
        <h1>Certificate | ลงทะเบียนการแข่งขัน</h1>
    </div>
    <form action="" method="post">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">ส่วนอื่นๆ</h3>
            </div>
            <div class="panel-body">
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
    </form>
</div>

<%@ include file="contains/footer.jsp" %>