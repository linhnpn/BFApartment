<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lí dịch vụ</title>
        <link rel="stylesheet" href="css/viewTrouble.css"/>
        <link rel="stylesheet" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null or (sessionScope.LOGIN_USER.roleID ne 'AD')}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <jsp:include page="headerAdmin.jsp"></jsp:include>           
            <div class="container">
                <h1 class="text-center">Thông tin dịch vụ</h1>
                <form action="MainController" method="POST">
                    <div class="input-group mb-3 btn-search">
                        <input type="text" class="form-control" placeholder="Tên dịch vụ..." name="search" value="${param.search}"/>
                    <div class="input-group-append">                        
                        <button class="btn" type="submit" name="action" value="SearchService">
                            <span class="input-group-text">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </span>
                        </button>
                    </div>
                </div>
            </form>
            <c:if test="${requestScope.LIST_SERVICE!=null}">
                <c:if test="${not empty requestScope.LIST_SERVICE}">
                    <div class="table-responsive" id="no-more-tables">
                        <table class="table col-sm-12 table-bordered table-striped table-condensed cf">
                            <thead class="cf">
                                <tr>
                                    <th>STT</th>
                                    <th>Dịch vụ số</th>
                                    <th>Tên dịch vụ </th>
                                    <th>Ngày tạo</th>
                                    <th>Giá (VNĐ)</th>
                                    <th>Trạng thái</th>
                                    <th>Cập nhật</th>
                                    <th>Xóa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="service" items="${requestScope.LIST_SERVICE}" varStatus="counter">
                                <form action="MainController" method="POST">
                                    <tr>
                                    <input type="hidden" name="search" value="${param.search}"/> 
                                    <td data-title="STT: " >${counter.count}                                
                                    </td>
                                    <td  data-title="Dịch vụ số: " >
                                        <input type="hidden" name="serID" value="${service.serviceId}" readonly=""/>
                                        ${service.serviceId}
                                    </td>
                                    <td  data-title="Tên dịch vụ: " >
                                        <input type="text" name="serName" value="${service.serviceName}" required=""/>
                                        ${contract.apartmentId}
                                    </td>
                                    <td data-title="Ngày tạo: " >
                                        <input type="date" name="serDate" value="${service.createdDate}" readonly=""/>
                                    </td>
                                    <td  data-title="Giá (VNĐ): " >
                                        <input type="text" name="serPrice" value="${service.price}" required>
                                    </td>
                                    <td  data-title="Trạng thái: " >                                          
                                        <c:if test="${service.status eq '1'}">
                                            Đang hoạt động
                                        </c:if>
                                        <c:if test="${service.status eq '0'}">
                                            Ngưng hoạt động
                                        </c:if>
                                    </td>
                                    <td  data-title="Sửa: " >
                                        <div>
                                            <c:if test="${service.status eq '1'}">
                                                <button type="submit" name="action" class="btn btn-outline-secondary" value="UpdateService">Cập nhật</button>
                                            </c:if>
                                            <c:if test="${service.status eq '0'}">
                                                <button type="button" name="action" class="btn btn-outline-secondary disabled" value="UpdateService">Cập nhật</button>
                                            </c:if>                                          
                                        </div>
                                    </td>
                                    <td  data-title="Xóa: " >
                                        <div>
                                            <c:if test="${service.status eq '1' && service.serviceId ne 'E01' && service.serviceId ne 'W01'}">
                                                <button type="submit" name="action" class="btn btn-outline-warning" value="RemoveService">Xóa</button>             
                                            </c:if>
                                            <c:if test="${service.status eq '0' || (service.serviceId eq 'E01' || service.serviceId eq 'W01')}">
                                                <button type="button" name="action" class="btn btn-outline-warning disabled" value="RemoveService">Xóa</button>      
                                            </c:if> 
                                        </div>
                                    </td>
                                    </tr>
                                </form>

                            </c:forEach>                           
                            </tbody>
                        </table>
                    </div>
                </c:if>
            </c:if>
            <c:if test="${requestScope.LIST_SERVICE==null}">
                <c:if test="${empty requestScope.LIST_SERVICE}">
                    <i>-----Không tồn tại-----</i>
                </c:if>
            </c:if>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
    <script>
        $(document).ready(function () {
            $(".service").addClass("active");
        });
    </script>
</html>
