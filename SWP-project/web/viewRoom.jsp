<%-- 
    Document   : viewRoom
    Created on : Jul 30, 2022, 9:58:17 PM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin phòng ở</title>
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null or (sessionScope.LOGIN_USER.roleID ne 'US')}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <jsp:include page="headerUser.jsp"></jsp:include>
        <jsp:include page="slider.jsp"></jsp:include>
            <div class="container">
                <h1 style="margin-top: 3%">Hợp đồng</h1>
                <form>
                <c:if test="${requestScope.CONTRACT != null}">
                    <c:if test="${not empty requestScope.CONTRACT }">
                        <div class="form-row">                                
                            <div class="col-md-3 mb-3">                                    
                                <label>Hợp đồng số: </label>
                                <input type="text" class="form-control" id="validationServer03" readonly="" value="${CONTRACT.contractId}">
                            </div>
                            <div class="col-md-3 mb-3">                                    
                                <label>ID Phòng: </label>
                                <input type="text" class="form-control" id="validationServer03" readonly="" value="${CONTRACT.apartmentId}">
                            </div>
                            <div class="col-md-3 mb-3">                                    
                                <label>Ngày ký: </label>
                                <input type="date" class="form-control" id="validationServer03" readonly="" value="${CONTRACT.startDate}">
                            </div>
                            <div class="col-md-3 mb-3">                                    
                                <label>Ngày kết thúc: </label>
                                <input type="date" class="form-control" id="validationServer03" readonly="" value="${CONTRACT.endDate}">
                            </div>

                        </div>
                    </c:if>
                </c:if>
                <c:if test="${requestScope.CONTRACT == null}">
                    <p>
                        <i>------Hợp đồng đã bị hủy hoặc không tồn tại------</i>
                    </p>
                </c:if>
            </form>
            <h4 style="margin-top: 5%;">Danh sách người ở hiện tại</h4>
            <form>
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
                                <hr>
                            </div>
                        </c:forEach>
                    </c:if>
                </c:if>
            <c:if test="${requestScope.LIST_RESIDENT == null}">
                <p>
                    <i>-----Danh sách trống</i>
                </p>
            </c:if>
            </form>
            <a href="user.jsp"><button style="padding: 0px 40px; margin: 10px 10px" class="btn btn-light float-right">Quay về trang chủ</button><a/>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".detail").addClass("active");
        });
    </script>
</html>
