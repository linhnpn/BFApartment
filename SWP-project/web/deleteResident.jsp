<%-- 
    Document   : deleteResident
    Created on : Jun 7, 2022, 11:08:32 AM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Resident Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null or (sessionScope.LOGIN_USER.roleID ne 'US')}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <jsp:include page="headerUser.jsp"></jsp:include>
            <div class="container">
                <h1 class="text-center">Danh sách công dân</h1>
                <form action="MainController" method="POST">
                <c:if test="${requestScope.LIST_RESIDENT != null}">
                    <c:if test="${not empty requestScope.LIST_RESIDENT }">
                        <c:forEach var="resident" items="${requestScope.LIST_RESIDENT}" varStatus="counter" >
                            <!--bat dau-->
                            <div class="resident">                            
                                <div class="form-row">                                
                                    <div class="col-md-8 mb-3">                                    
                                        <label for="validationServer01">Họ và tên: </label>
                                        <input type="text" class="form-control" id="validationServer03" readonly="" value="${resident.name}">
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label for="validationServer01">Giới tính: </label>
                                        <select class="custom-select form-control">
                                            <c:if test="${resident.gender}">
                                                <option selected="">Nam</option>
                                            </c:if>
                                            <c:if test="${!resident.gender}">
                                                <option selected="">Nữ</option>
                                            </c:if>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row" >
                                    <div class="col-md-4 mb-3" >
                                        <label for="validationServer02">Sinh ngày: </label>
                                        <input type="date" class="form-control" id="validationServer01" value="${resident.dob}" readonly="" >
                                    </div>
                                    <div class="col-md-4 mb-3" >
                                        <label for="validationServer02">Nghề nghiệp: </label>
                                        <input type="text" class="form-control" id="validationServer01" value="${resident.job}" readonly="">
                                    </div>
                                    <div class="col-md-4 mb-3" >
                                        <label for="validationServer02">Số điện thoại: </label>
                                        <input type="text" class="form-control" id="validationServer01" value="${resident.phone}" readonly="">

                                    </div>
                                </div>
                                <div class="form-check-inline float-right">
                                    <label class="form-check-label">
                                        <input type="checkbox" name="delete" class="form-check-input" value="${resident.residentId}">Chọn
                                    </label>
                                </div>
                                </br>
                                <hr>
                            </div>
                        </c:forEach>

                        <button type="submit" class="btn btn-primary float-right" name="action" style="padding: 0px 40px; margin: 10px 10px" value="DeleteResident">Xóa các mục đã chọn</button>
                    </form>
                    <a href="user.jsp"><button style="padding: 0px 40px; margin: 10px 10px" class="btn btn-light float-right">Hủy</button><a/>
                    </c:if>
                </c:if>

                <c:if test="${requestScope.LIST_RESIDENT==null}">
                    <c:if test="${empty requestScope.LIST_RESIDENT}">
                        <i>-----Phòng của bạn hiện không có người khác-----</i>
                        <a href="user.jsp"><button style="padding: 0px 40px; margin: 10px 10px" class="btn btn-light float-right">Quay về trang chủ</button><a/>
                        </c:if>
                    </c:if>                
                    </div>
                    <jsp:include page="footer.jsp"></jsp:include>
                        </body>
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
                        <script>
                            $(document).ready(function () {
                                $(".request").addClass("active");
                            });
                        </script>
                    <c:if test="${requestScope.ERROR!=null}">
                        <c:if test="${not empty requestScope.ERROR}">
                            <script>
                                $(document).ready(function () {
                                    alert("${requestScope.ERROR}");
                                });
                            </script>
                        </c:if>
                    </c:if>
                    <script>
                        $(document).ready(function () {
                            $(".request").addClass("active");
                        });
                    </script>
                    <script src="js/js.js" ></script>
                    </html>
