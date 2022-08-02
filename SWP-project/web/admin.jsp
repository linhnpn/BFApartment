
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dto.ContractDTO"%>
<%@page import="dto.ApartmentDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <title>Admin Page</title>
        <link href="css/theme.css" rel="stylesheet" media="all">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="css/admin.css">

    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null or (sessionScope.LOGIN_USER.roleID ne 'AD')}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <jsp:include page="headerAdmin.jsp"></jsp:include>
            <div class="container">
                <div class="row" style="margin-top: 30px">
                    <div class="col-lg-12 col-md-12">
                        <h2 class="title-1 m-b-25">Overview</h2>
                    </div>                    
                </div>
                <div class="row m-t-25">
                    <div class="col-sm-6 col-lg-3">
                        <div class="overview-item overview-item--c1">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">
                                    <div class="icon">
                                        <i class="zmdi zmdi-account-o"></i>
                                    </div>
                                    <div class="text">
                                        <h2>
                                        <c:if test="${requestScope.RESIDENT != null}">
                                            ${requestScope.RESIDENT}
                                        </c:if>
                                        <c:if test="${requestScope.RESIDENT == null}">
                                            ${requestScope.RESIDENT}
                                        </c:if>
                                    </h2>
                                    <span>Dân cư đang sống</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="overview-item overview-item--c2">
                        <div class="overview__inner">
                            <div class="overview-box clearfix">
                                <div class="icon">
                                    <i class="zmdi zmdi-shopping-cart"></i>
                                </div>
                                <div class="text">
                                    <h2>
                                        <c:if test="${requestScope.ROOM_NOT_EMPTY != null}">
                                            ${requestScope.ROOM_NOT_EMPTY}
                                        </c:if>
                                        <c:if test="${requestScope.ROOM_EMPTY != null}">
                                            / ${requestScope.ROOM_EMPTY}
                                        </c:if>

                                    </h2>
                                    <span>Đã thuê / Trống</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="overview-item overview-item--c3">
                        <div class="overview__inner">
                            <div class="overview-box clearfix">
                                <div class="icon">
                                    <i class="zmdi zmdi-calendar-note"></i>
                                </div>
                                <div class="text">
                                    <h2>
                                        <c:if test="${requestScope.CONTRACT_AVAILABLE != null}">
                                            ${requestScope.CONTRACT_AVAILABLE}
                                        </c:if>  
                                    </h2>
                                    <span>Hợp đồng</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="overview-item overview-item--c4">
                        <div class="overview__inner">
                            <div class="overview-box clearfix">
                                <div class="icon">
                                    <i class="zmdi zmdi-money"></i>
                                </div>
                                <div class="text">
                                    <h2>
                                        <c:if test="${requestScope.MONEY != null}">
                                            ${requestScope.MONEY}
                                        </c:if>
                                    </h2>
                                    <span>Tổng thu</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>   
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="title-1 m-b-25">Doanh thu theo tháng</h2>
                    <div class="table-responsive table--no-card m-b-40">
                        <table class="table table-borderless table-striped table-earning">
                            <thead>
                                <tr>
                                    <th>date</th>
                                    <th>total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${requestScope.LIST_MONEY!=null}">
                                    <c:if test="${not empty requestScope.LIST_MONEY}">
                                        <c:forEach var="money" items="${requestScope.LIST_MONEY}" varStatus="count">
                                            <tr>
                                                <td>${money.date}</td>
                                                <td>$${money.total}</td>
                                            </tr>   
                                        </c:forEach>
                                    </c:if>
                                </c:if>

                            </tbody>
                        </table>
                    </div>
                </div>                           
            </div>
        </div>          
        <jsp:include page="footer.jsp"></jsp:include>
    </body>    
    <script>
        $(document).ready(function () {
            $(".home").addClass("active");
        });
    </script>
</html>
