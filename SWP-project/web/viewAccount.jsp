<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lí tài khoản</title>
        <link rel="stylesheet" href="css/addResident.css">
        <link rel="stylesheet" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null or (sessionScope.LOGIN_USER.roleID ne 'AD')}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <jsp:include page="headerAdmin.jsp"></jsp:include>
            <div class="container">
                <h1 class="text-center">Quản lí tài khoản</h1>
                <form action="MainController" method="POST">
                    <div class="input-group mb-3 btn-search">
                        <input type="text" class="form-control" placeholder="" name="search" value="${param.search}"/>
                    <div class="input-group-append">                        
                        <button class="btn" type="submit" name="action" value="Search">
                            <span class="input-group-text">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </span>
                        </button>
                    </div>
                </div>
            </form>
            <c:if test="${requestScope.LIST_USER!=null}">
                <c:if test="${not empty requestScope.LIST_USER}">
                    <div class="content">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">No</th>
                                    <th scope="col">Tên đăng nhập</th>
                                    <th scope="col">Mật khẩu</th>
                                    <th scope="col">Chức vụ</th>
                                    <th scope="col">Xóa</th>
                                    <th scope="col">Thêm mới chủ sở hữu</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="account" items="${requestScope.LIST_USER}" varStatus="counter">
                                    <tr>                                                
                                        <td>${counter.count}</td>
                                        <td>${account.userID}</td>
                                        <td>
                                            ${account.password}
                                        </td>
                                        <td>
                                            ${account.roleID}
                                        </td>
                                        <td>
                                            <form action="MainController" method="POST">
                                                <input type="hidden" name="userID" value="${account.userID}">
                                                <c:if test="${sessionScope.LOGIN_USER.userID eq account.userID}">
                                                    <button type="button" name="action" value="Delete" class="btn disabled btn-form btn-warning">Xóa tài khoản</button>
                                                </c:if>
                                                <c:if test="${sessionScope.LOGIN_USER.userID ne account.userID}">
                                                    <c:if test="${account.ownerId eq ''}">
                                                        <button type="submit" name="action" value="Delete" class="btn btn-form btn-warning">Xóa tài khoản</button>
                                                    </c:if>
                                                    <c:if test="${account.ownerId ne ''}">
                                                        <button type="button" name="action" value="Delete" class="btn btn-form disabled btn-warning">Xóa tài khoản</button>
                                                    </c:if>
                                                </c:if>
                                            </form>
                                        </td>
                                        <td>
                                            <form action="addOwner.jsp" method="POST">
                                                <input type="hidden" name="userId" value="${account.userID}">
                                                <c:if test="${account.roleID eq 'US'}">
                                                    <c:if test="${account.ownerId eq ''}">
                                                        <button type="submit" class="btn btn-form btn-primary">Đăng kí chủ sở hữu</button>      
                                                    </c:if>
                                                    <c:if test="${account.ownerId ne ''}">
                                                        <button type="button" class="btn btn-form disabled btn-primary">Đăng kí chủ sở hữu</button>   
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${account.roleID ne 'US'}">
                                                    <button type="button" class="btn btn-form btn-primary disabled">Đăng kí chủ sở hữu</button>
                                                </c:if>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
            </c:if>
        </div>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".account").addClass("active");
        });
    </script>
</html>
