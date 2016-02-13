<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="contains/header.jsp"%>

<%@ include file="contains/navbar.jsp"%>

<div class="container header-top">
    <div class="page-header">
        <h1>Add Archive(s)</h1>
    </div>
</div>

<div class="container">
    <form action="/add_archive">
        <div class="row">
            <div class="col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Archive Profile</h3>
                    </div>
                    <div class="container">
                        <div class="form-group">
                            <label >Archive Name</label>
                            <input type="text" class="form-control" name="archiveName" placeholder="KAESAD Tournament">
                        </div>
                        <div class="form-group">
                            <label>Upload your file</label>
                            <input type="file" >
                            <p class="help-block">We recommend you upload your archive with .pdf file(s). <br> If you have multiple file, please zip before uploaded.</p>
                        </div>
                        <div class="form-group">
                            <label>Categories</label>
                            <select class="form-control">
                                <option>1</option>
                                <option>Don't have</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label >If category selector don't have that you want, you can add here</label>
                            <input type="text" class="form-control" name="categoryName" placeholder="Internet of Things">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Update</button>
    </form>
</div>


<%@ include file="contains/footer.jsp"%>