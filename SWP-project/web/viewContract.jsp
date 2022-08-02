<%-- 
    Document   : viewContract
    Created on : Jun 12, 2022, 3:44:02 PM
    Author     : Trieu Do
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="dto.ContractDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contract Page</title>
        <link rel="stylesheet" href="css/viewTrouble.css"/>
        <link rel="stylesheet" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null or (sessionScope.LOGIN_USER.roleID ne 'AD')}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <!--NEW-->
        <jsp:include page="headerAdmin.jsp"></jsp:include>
            <div class="container">
                <h1 class="text-center">Thông tin hợp đồng</h1>
                <form action="MainController" method="POST">
                    <div class="input-group mb-3 btn-search">
                        <input type="text" class="form-control" placeholder="Mã hợp đồng hoặc người đứng tên..." name="searchContract" value="${param.searchContract}"/>
                    <div class="input-group-append">                        
                        <button class="btn" type="submit" name="action" value="SearchContract">
                            <span class="input-group-text">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </span>
                        </button>
                    </div>
                </div>
            </form>
            <c:if test="${requestScope.LIST_CONTRACT!=null}">
                <c:if test="${not empty requestScope.LIST_CONTRACT}">
                    <div class="table-responsive" id="no-more-tables">
                        <table class="table col-sm-12 table-bordered table-striped table-condensed cf">
                            <thead class="cf">
                                <tr>
                                    <th>STT</th>
                                    <th>Hợp đồng số</th>
                                    <th>Căn hộ số: </th>
                                    <th>Tên chủ hộ</th>
                                    <th>Ngày ký</th>
                                    <th>Ngày kết thúc</th>
                                    <th>Trạng thái</th>
                                    <th>Sửa</th>
                                    <th>Xóa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="contract" items="${requestScope.LIST_CONTRACT}" varStatus="counter">
                                <form action="MainController" method="POST">
                                    <tr>
                                        <td data-title="STT: " >${counter.count}                                
                                        </td>
                                        <td  data-title="Hợp đồng số: " >
                                            <input type="hidden" name="contractId" value="${contract.contractId}" readonly=""/>
                                            ${contract.contractId}
                                        </td>
                                        <td  data-title="Căn hộ số: " >
                                            <input type="hidden" name="apartmentId" value="${contract.apartmentId}" readonly=""/>
                                            ${contract.apartmentId}
                                        </td>
                                        <td data-title="Tên chủ hộ: " >
                                            <input type="hidden" name="fullName" value="${contract.ownerId}" readonly=""/>
                                            ${contract.ownerId}
                                        </td>
                                        <td  data-title="Ngày ký: " >
                                            <input type="date" name="startDate" value="${contract.startDate}" required>
                                        </td>
                                        <td data-title="Ngày kết thúc: " >
                                            <input type="date" name="endDate" value="${contract.endDate}"/>
                                        </td>
                                        <td  data-title="Trạng thái: " >
                                            <input type="hidden" name="status" value="${contract.status}" readonly=""/>

                                            <c:if test="${contract.status eq '1'}">
                                                Tồn tại
                                            </c:if>
                                            <c:if test="${contract.status eq '0'}">
                                                Đã hủy
                                            </c:if>
                                        </td>
                                        <td  data-title="Sửa: " >
                                            <div>
                                                <c:if test="${contract.status eq '1'}">
                                                    <button type="submit" name="action" class="btn btn-outline-secondary" value="UpdateContract">Cập nhật</button>
                                                </c:if>
                                                <c:if test="${contract.status eq '0'}">
                                                    <button type="button" name="action" class="btn btn-outline-secondary disabled" value="UpdateContract">Cập nhật</button>
                                                </c:if>                                          
                                            </div>
                                        </td>
                                        <td  data-title="Xóa: " >
                                            <div>
                                                <c:if test="${contract.status eq '1'}">
                                                    <button type="submit" name="action" class="btn btn-outline-warning" value="DeleteContract">Hủy</button>             
                                                </c:if>
                                                <c:if test="${contract.status eq '0'}">
                                                    <button type="button" name="action" class="btn btn-outline-warning disabled" value="DeleteContract">Hủy</button>      
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
            <c:if test="${requestScope.LIST_CONTRACT==null}">
                <c:if test="${empty requestScope.LIST_CONTRACT}">
                    <i>-----Không tồn tại-----</i>
                </c:if>
            </c:if>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
            <!--END NEW-->
        </body>
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
    <script>
        $(document).ready(function () {
            $(".contract").addClass("active");
        });
    </script>
</html>
