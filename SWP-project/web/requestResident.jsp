<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yêu cầu khách hàng</title>
    </head>
    <link rel="stylesheet" href="css/addResident.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null or (sessionScope.LOGIN_USER.roleID ne 'EM')}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <jsp:include page="headerEmp.jsp"></jsp:include>      
            <!--NEW-->
            <div class="container">
                <h1 class="text-center">Yêu cầu khách hàng</h1>

            <c:if test="${requestScope.LIST_RESIDENT_REQ != null}">
                <c:if test="${not empty requestScope.LIST_RESIDENT_REQ}">
                    <c:forEach var="request" items="${requestScope.LIST_RESIDENT_REQ}" varStatus="counter" >
                        <div class="eachElement">
                            <div class="header-request">
                                <div class="form-row">
                                    <div class="col-md-3 mb-3">
                                        <label>Mã yêu cầu: </label>
                                        <input type="text" class="form-control" value="${request.requestId}" readonly="">
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label>Hành động: </label>
                                        <c:if test="${request.todo eq 'add'}">
                                            <input type="text" class="form-control" value="Thêm" readonly="">
                                        </c:if>
                                        <c:if test="${request.todo eq 'delete'}">
                                            <input type="text" class="form-control" value="Xóa" readonly="">
                                        </c:if>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label>Họ và tên: </label>
                                        <input type="text" class="form-control" value="${request.fullName}" readonly="">
                                    </div>

                                </div>
                                <div class="form-row">
                                    <div class="col-md-12">                                            
                                        <form action="MainController" class="float-right">
                                            <input type="hidden" name="requestId" value="${request.requestId}"/>
                                            <input type="hidden" name="todo" value="${request.todo}"/>
                                            <button type="submit" name="action" value="AcceptRequest" class="btn btn-outline-secondary float-right btn-form">Chấp nhận</button>
                                        </form>
                                        <form action="MainController">
                                            <input type="hidden" name="requestId" value="${request.requestId}"/>
                                            <button class="btn-form btn btn-form float-right btn-outline-secondary" type="submit" name="action" value="RejectRequest">Từ chối</button>
                                        </form>
                                        <button class="btn-form btn btn-detail float-right btn-outline-secondary">Chi tiết</button>
                                    </div>
                                </div>                       
                            </div>
                            <div class="content" style="display: none; width: 100%">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Tên</th>
                                            <th scope="col">Giới tính</th>
                                            <th scope="col">Ngày sinh</th>
                                            <th scope="col">Nghề nghiệp</th>
                                            <th scope="col">Số điện thoại</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="resident" items="${request.listRes}" varStatus="counter2" >
                                            <tr>                                                
                                                <td>${resident.name}</td>
                                                <td>
                                                    <c:if test="${resident.gender}">
                                                        Nam
                                                    </c:if>
                                                    <c:if test="${!resident.gender}">
                                                        Nữ
                                                    </c:if>
                                                </td>
                                                <td>
                                                    ${resident.dob}
                                                </td>
                                                <td>
                                                    ${resident.job}
                                                </td>
                                                <td>${resident.phone}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </c:if>
        </div>
        <!--END-NEW-->
        <c:if test="${requestScope.LIST_RESIDENT_REQ == null}">
            <i class="text-center mx-auto">-----Danh sách yêu cầu hiện đang trống-----</i>
            <a href="employee.jsp"><button class="btn btn-form btn-light float-right">Quay về trang chủ</button></a>
        </c:if>        
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
    <script>
        $(document).ready(function () {
            $(".btn-detail").live("click", function () {
                $(this).parent().parent().parent().parent().children(".content").slideToggle();
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $(".request").addClass("active");
        });
    </script>   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
</html>
