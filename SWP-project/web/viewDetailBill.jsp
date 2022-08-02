<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Detail</title>
        <link rel="stylesheet" href="css/viewTrouble.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null or ((sessionScope.LOGIN_USER.roleID ne 'US') and ((sessionScope.LOGIN_USER.roleID ne 'EM')))}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <c:if test="${sessionScope.LOGIN_USER.roleID == 'EM'}">
            <jsp:include page="headerEmp.jsp"></jsp:include>
        </c:if>
        <c:if test="${sessionScope.LOGIN_USER.roleID == 'US'}">
            <jsp:include page="headerUser.jsp"></jsp:include>
        </c:if>
        <!--NEW-->
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="float-left">
                        Hóa đơn sinh hoạt
                    </h4>
                </div>
                <c:if test="${requestScope.LIST_BILL_DETAIL_SERVICE != null}">
                    <c:if test="${not empty requestScope.LIST_BILL_DETAIL_SERVICE}">
                        <div class="table-responsive" id="no-more-tables">
                            <table class="table col-sm-12 table-bordered table-striped table-condensed cf">
                                <thead class="cf">
                                    <tr>
                                        <th>Tên dịch vụ</th>
                                        <th>Giá theo đơn vị</th>
                                        <th>Ngày ghi nhận</th>
                                        <th>Chỉ số cũ</th>
                                        <th>Chỉ số mới</th>
                                        <th>Sử dụng</th>
                                        <th>Giá dịch vụ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="serviceDetail" items="${requestScope.LIST_BILL_DETAIL_SERVICE}" varStatus="counter">
                                        <tr>
                                            <td data-title="Tên dịch vụ: " >${serviceDetail.name}                          
                                            </td>                                       
                                            <td  data-title="Giá theo đơn vị: " >
                                                ${serviceDetail.price} VNĐ
                                            </td>
                                            <td data-title="Ngày ghi nhận: " >
                                                <input class="text-center" type="date" value="${serviceDetail.date}" readonly="">                                               
                                            </td>
                                            <td data-title="Chỉ số cũ: " >${serviceDetail.oldIndex}                              
                                            </td>
                                            <td data-title="Chỉ số mới: " >${serviceDetail.newIndex}                         
                                            </td>
                                            <td data-title="Sử dụng: " >${serviceDetail.usageIndex}                             
                                            </td>
                                            <td data-title="Giá dịch vụ: " >${serviceDetail.priceDetail}                            
                                            </td>
                                        </tr>
                                    </c:forEach>                           
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </c:if>
            </div>

            <!--ANOTHER-->
            <div class="row">
                <div class="col-md-12">
                    <h4 class="float-left">
                        Hóa đơn khác
                    </h4>
                </div>
                <c:if test="${requestScope.LIST_BILL_DETAIL != null}">
                    <c:if test="${not empty requestScope.LIST_BILL_DETAIL}">
                        <div class="table-responsive" id="no-more-tables">
                            <table class="table col-sm-12 table-bordered table-striped table-condensed cf">
                                <thead class="cf">
                                    <tr>
                                        <th>Tên dịch vụ</th>
                                        <th>Giá theo đơn vị</th>
                                        <th>Ngày ghi nhận</th>
                                        <th>Giá dịch vụ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="service" items="${requestScope.LIST_BILL_DETAIL}" varStatus="counter">
                                        <tr>
                                            <td data-title="Tên dịch vụ: " >${service.serviceName}                         
                                            </td>                                       
                                            <td  data-title="Giá theo đơn vị: " >
                                                ${service.price} VNĐ
                                            </td>
                                            <td data-title="Ngày ghi nhận: " >
                                                <input class="text-center" type="date" value="${service.createdDate}" readonly="">                                               
                                            </td>
                                            <td data-title="Giá dịch vụ: " >${service.priceDetail}                           
                                            </td>
                                        </tr>
                                    </c:forEach>                           
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </c:if>
            </div>
            <c:if test="${sessionScope.LOGIN_USER.roleID == 'EM'}">
                <a href="MainController?action=ViewAllBill"><button class="btn btn-light float-right">Quay lại</button></a>
            </c:if>
            <c:if test="${sessionScope.LOGIN_USER.roleID == 'US'}">
                <a href="MainController?action=ViewBill"><button class="btn btn-light float-right">Quay lại</button></a>
            </c:if>          
        </div>

        <!--END-NEW-->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".bill").addClass("active");
        });
    </script>
    <script src="js/js.js" ></script>
</html>
