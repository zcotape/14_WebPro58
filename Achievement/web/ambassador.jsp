<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="contains/header.jsp" %>

<%@ include file="contains/navbar.jsp" %>

<%@ include file="contains/datasource.jsp" %>

<sql:query var="query_organization_name" dataSource="${dataSource}">
    SELECT id, organization_name FROM organizations;
</sql:query>
    
<div class="container header-top">
    <div class="page-header">
        <h1>Ambassador | ลงทะเบียนฑูตหรือตัวแทนองค์กร</h1>
    </div>
    <form action="" method="post" enctype="multipart/form-data">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">รายละเอียด</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="control-label">ชื่อผลงาน</label>
                    <input type="text" class="form-control" name="achievement_name">
                </div>
                <div class="form-group">
                    <label class="control-label">หน่วยงานที่จัด</label>
                    <select class="form-control" name="organization_name">
                        <option value="0">เลือกหน่วยงานที่จัด</option>
                        <c:forEach var="list" items="${query_organization_name.rows}">
                            <option value="${list.id}">${list.organization_name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <div class="form-group">
                        <label class="control-label">ถ้าไม่มีเลือก ให้เพิ่มในช่องนี้</label>
                        <input type="text" class="form-control" name="organization_optional_name">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">ประจำปี</label>
                    <select class="form-control" name="year">
                        <% for (int i = 2000; i <= 2030; i++) { %>
                        <option value="<%= i %>"><%= i %></option>
                        <% } %>
                    </select>
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
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Update
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>

<%@ include file="contains/footer.jsp" %>