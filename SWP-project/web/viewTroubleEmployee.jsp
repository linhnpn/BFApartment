<%-- 
    Document   : viewTroubleEmployee
    Created on : May 26, 2022, 9:38:32 PM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trouble Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/viewTrouble.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null or (sessionScope.LOGIN_USER.roleID ne 'EM')}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <jsp:include page="headerEmp.jsp"></jsp:include>            
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="text-center">
                            Sự cố
                        </h2>
                    </div>
                <c:if test="${requestScope.LIST_TROUBLE != null}">
                    <c:if test="${not empty requestScope.LIST_TROUBLE }">
                        <div class="table-responsive" id="no-more-tables">
                            <table class="table col-sm-12 table-bordered table-striped table-condensed cf">
                                <thead class="cf">
                                    <tr>
                                        <th>Sự cố số</th>
                                        <th>Căn hộ số</th>
                                        <th>Chủ hộ</th>
                                        <th>Ngày báo cáo</th>
                                        <th>Loại sự cố</th>
                                        <th>Chi tiết</th>
                                        <th>Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="trouble" items="${requestScope.LIST_TROUBLE}" varStatus="counter">
                                        <tr>
                                            <td data-title="Sự cố số: " >${trouble.troubleId}                                

                                            </td>
                                            <td  data-title="Căn hộ số: " >
                                                ${trouble.apartment}
                                            </td>
                                            <td data-title="Chủ hộ: " >
                                                ${trouble.ownerName}
                                            </td>
                                            <td  data-title="Ngày báo cáo: " >
                                                ${trouble.date}
                                            </td>
                                            <td data-title="Loại sự cố: " >${trouble.typeName}</td>
                                            <td  data-title="Chi tiết: " >${trouble.detail}</td>
                                            <td  data-title="Trạng thái: " >
                                                <div>
                                                    <c:if test ="${!trouble.status}">
                                                        <input type="checkbox" data-toggle="toggle" data-on="Done" class="checkbox-input" data-off="Not Yet" data-onstyle="success" data-offstyle="danger">

                                                    </c:if>
                                                    <c:if test ="${trouble.status}">
                                                        <input type="checkbox" checked data-toggle="toggle" data-on="Done" class="checkbox-input" data-off="Not Yet" data-onstyle="success" data-offstyle="danger">

                                                    </c:if>
                                                    <input type="hidden" class="tag" name="index" value="${param.tag}"> 
                                                    <input type="hidden" class="troubleId" name="troubleId" value="${trouble.troubleId}">
                                                </div>
                                            </td>

                                        </tr>
                                    </c:forEach>                           
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </c:if>
            </div>
        </div>
        <!--End-->
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <c:if test="${tag-1==0}">
                    <li class="page-item disabled">
                        <a class="page-link" href="MainController?action=ViewTrouble&index=${tag-1}">Previous</a>
                    </li>
                </c:if>
                <c:if test="${tag-1!=0}">
                    <li class="page-item">
                        <a class="page-link" href="MainController?action=ViewTrouble&index=${tag-1}">Previous</a>
                    </li>
                </c:if>
                <c:forEach begin="1" end="${endP}" var="i">
                    <li class="page-item ${tag==i?"active":""}"><a class="page-link" href="MainController?action=ViewTrouble&index=${i}">${i}</a></li>
                    </c:forEach>
                    <c:if test="${tag==endP}">
                    <li class="page-item disabled">
                        <a class="page-link" href="MainController?action=ViewTrouble&index=${tag+1}">Next</a>
                    </li>
                </c:if>
                <c:if test="${tag!=endP}">
                    <li class="page-item">
                        <a class="page-link" href="MainController?action=ViewTrouble&index=${tag+1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </nav>


        <jsp:include page="footer.jsp"></jsp:include>
    </body>
    <script>
        $(document).ready(function () {
            $(".checkbox-input").change(function () {
                var troubleId = $(this).parent().children(".troubleId").val();
                $.ajax({
                    url: '/ApartmentManagement/MainController',
                    type: 'POST',
                    data: {
                        action: 'UpdateTrouble',
                        status: $(this).prop('checked'),
                        troubleId: troubleId
                    },
                    success: function (data) {
                        //do some thing
                    }
                });
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $(".trouble").addClass("active");
        });
    </script>
</html>
