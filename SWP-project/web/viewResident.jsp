<%-- 
    Document   : viewResident
    Created on : May 24, 2022, 12:50:30 PM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin cư dân</title>
    </head>
    <link rel="stylesheet" href="css/addResident.css">
    <link rel="stylesheet" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <body>   
        <c:if test="${sessionScope.LOGIN_USER == null or ((sessionScope.LOGIN_USER.roleID ne 'AD') and ((sessionScope.LOGIN_USER.roleID ne 'EM')))}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <c:if test="${sessionScope.LOGIN_USER.roleID == 'EM'}">
            <jsp:include page="headerEmp.jsp"></jsp:include>
        </c:if>
        <c:if test="${sessionScope.LOGIN_USER.roleID == 'AD'}">
            <jsp:include page="headerAdmin.jsp"></jsp:include>
        </c:if>

        <!--NEW-->
        <div class="container">
            <h1 class="text-center">Danh sách cư dân</h1>
            <form action="MainController" method="POST">
                <div class="input-group mb-3 btn-search">
                    <input type="text" class="form-control" placeholder="Tên hoặc Mã chủ sở hữu..." name="search" value="${param.search}"/>
                    <div class="input-group-append">                        
                        <button class="btn" type="submit" name="action" value="ViewResident">
                            <span class="input-group-text">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </span>
                        </button>
                    </div>
                </div>
            </form>

            <c:if test="${requestScope.LIST_RESIDENT!=null}">
                <c:if test="${not empty requestScope.LIST_RESIDENT}">
                    <c:forEach var="resident" items="${requestScope.LIST_RESIDENT}" varStatus="count" >
                        <!--Each Resident-->
                        <div class="eachResident">


                            <form action="MainController" method="POST">
                                <div>
                                    <div class="form-row">
                                        <div class="col-md-6 mb-3">
                                            <label>Mã cư dân: </label>
                                            <input type="text" class="form-control" name="residentId" placeholder="Nguyễn Văn A" value="${resident.residentId}" readonly="">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label>Mã chủ sở hữu: </label>
                                            <input type="text" class="form-control" name="ownerId" placeholder="Nguyễn Văn A" value="${resident.ownerId}" readonly="">
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="col-md-8 mb-3">
                                            <label>Họ và tên: </label>
                                            <input type="text" class="form-control" name="name" placeholder="Nguyễn Văn A" value="${resident.name}" required="">
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label>Giới tính: </label>
                                            <select class="custom-select form-control" name="gender">
                                                <c:if test="${resident.gender}">
                                                    <option value="1" selected="">Nam</option>
                                                    <option value="0">Nữ</option>
                                                </c:if>
                                                <c:if test="${!resident.gender}">
                                                    <option value="1">Nam</option>
                                                    <option value="0" selected="">Nữ</option>
                                                </c:if>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-row" >
                                        <div class="col-md-4 mb-3" >
                                            <label>Sinh ngày: </label>
                                            <input type="date" class="form-control" name="dob" value="${resident.dob}">
                                        </div>
                                        <div class="col-md-4 mb-3" >
                                            <label>Nghề nghiệp: </label>
                                            <input type="text" class="form-control" name="job" placeholder="Giáo viên..." value="${resident.job}" required="">
                                        </div>
                                        <div class="col-md-4 mb-3" >
                                            <label>Số điện thoại: </label>
                                            <input type="text" class="form-control" name="phone" placeholder="0123456789..." value="${resident.phone}" required="">
                                        </div>
                                    </div>                                    
                                </div>
                                <input type="hidden" name="search" value="${param.search}" readonly=""/>
                                <input type="hidden" name="index" value="${param.index}" readonly=""/>
                                <c:if test="${sessionScope.LOGIN_USER.roleID == 'EM'}">
                                    <button class="btn-add btn btn-outline-success float-right" type="submit" name="action" value="UpdateResident">Cập nhật</button> 
                                </c:if>
                            </form>
                            <c:if test="${sessionScope.LOGIN_USER.roleID == 'EM'}">
                                <form action="MainController" method="POST">
                                    <input type="hidden" name="search" value="${param.search}" readonly=""/>
                                    <input type="hidden" name="index" value="${param.index}" readonly=""/>
                                    <input type="hidden" name="residentId" value="${resident.residentId}"/>
                                    <input type="hidden" name="ownerId" value="${resident.ownerId}"/>
                                    <button type="submit" class="btn btn-add btn-outline-warning float-right" name="action" value="RemoveResident">Xóa</button>
                                </form>
                            </c:if>
                            <!--END Each Resident-->

                        </div>
                    </c:forEach>                    
                </c:if>
            </c:if>           
        </div>
        <!--PAGING-->
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <c:if test="${tag-1==0}">
                    <li class="page-item disabled">
                        <a class="page-link" href="MainController?action=ViewResident&search=${param.search}&index=${tag-1}">Previous</a>
                    </li>
                </c:if>
                <c:if test="${tag-1!=0}">
                    <li class="page-item">
                        <a class="page-link" href="MainController?action=ViewResident&search=${param.search}&index=${tag-1}">Previous</a>
                    </li>
                </c:if>
                <c:forEach begin="1" end="${endP}" var="i">
                    <li class="page-item ${tag==i?"active":""}"><a class="page-link" href="MainController?action=ViewResident&search=${param.search}&index=${i}">${i}</a></li>
                    </c:forEach>
                    <c:if test="${tag==endP}">
                    <li class="page-item disabled">
                        <a class="page-link" href="MainController?action=ViewResident&search=${param.search}&index=${tag+1}">Next</a>
                    </li>
                </c:if>
                <c:if test="${tag!=endP}">
                    <li class="page-item">
                        <a class="page-link" href="MainController?action=ViewResident&search=${param.search}&index=${tag+1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </nav>
        <!--END-PAGING-->
        <!--END-NEW-->
        <jsp:include page="footer.jsp"></jsp:include>
        </body>
        <script>
            $(document).ready(function () {
                $(".resident").addClass("active");
            });
        </script>
    <c:if test="${requestScope.SUCCESS!=null}">
        <c:if test="${not empty requestScope.SUCCESS}">
            <script>
                $(document).ready(function () {
                    alert("${requestScope.SUCCESS}");
                });
            </script>
        </c:if>
    </c:if>
    <c:if test="${requestScope.ERROR!=null}">
        <c:if test="${not empty requestScope.ERROR}">
            <script>
                $(document).ready(function () {
                    alert("${requestScope.ERROR}");
                });
            </script>
        </c:if>
    </c:if>
    <c:if test="${requestScope.INFO_ERROR!=null}">
        <c:if test="${not empty requestScope.INFO_ERROR}">
            <script>
                $(document).ready(function () {
                    alert("${requestScope.INFO_ERROR.nameError}\n"
                            + "${requestScope.INFO_ERROR.dobError}\n"
                            + "${requestScope.INFO_ERROR.sexError}\n"
                            + "${requestScope.INFO_ERROR.jobError}\n"
                            + "${requestScope.INFO_ERROR.phoneError}\n");
                });
            </script>
        </c:if>
    </c:if>
</html>
