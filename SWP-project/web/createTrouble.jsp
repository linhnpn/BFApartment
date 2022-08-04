<%-- 
    Document   : createTrouble
    Created on : May 27, 2022, 10:36:10 AM
    Author     : Nhat Linh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Báo cáo sự cố</title>
        <link rel="stylesheet" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null or (sessionScope.LOGIN_USER.roleID ne 'US')}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <jsp:include page="headerUser.jsp"></jsp:include>
        <jsp:include page="slider.jsp"></jsp:include>
            <div class="container">
                <h1 class="text-center" style="margin-top: 3%">Báo cáo sự cố</h1>
                <form action="MainController" method="POST">
                    <div class="form-row" >
                        <div class="col-md-3 mb-3" >
                            <label>Căn hộ số: </label>
                            <input type="text" class="form-control" name="apartmentId" alt="" readonly="" value="${requestScope.APARTMENT_ID}"/>
                    </div>
                    <div class="col-md-3 mb-3" >
                        <label>Ngày: </label>
                        <input type="date" name="date" class="form-control" required id="time" readonly=""/>
                    </div>
                    <div class="col-md-6 mb-3" >
                        <label>Loại sự cố: </label>
                        <select class="custom-select" name="typeId">
                            <option selected="" value="">----Loại sự cố----</option>
                            <c:if test="${requestScope.LIST_TYPE_TROUBLE !=null}">
                                <c:if test="${not empty requestScope.LIST_TYPE_TROUBLE}">
                                    <c:forEach var="typeTrouble" items="${requestScope.LIST_TYPE_TROUBLE}" varStatus="counter">
                                        <option value="${typeTrouble.typeId}">${typeTrouble.detail}</option>
                                    </c:forEach>
                                </c:if>
                            </c:if>
                        </select>
                    </div>

                </div>
                <div class="form-row" >
                    <div class="col-md-12 mb-6">
                        <label>Nội dung chi tiết: </label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" name="detail" placeholder="Nội dung chi tiết ... " rows="3" required=""></textarea>                    
                    </div>
                </div>
                <c:if test="${requestScope.ERROR!=null}">
                    <p>
                        <i class="text-danger">${requestScope.ERROR}</i>
                    </p>                    
                </c:if>

                <button type="submit" style="padding: 0px 40px; margin: 10px 10px" class="btn btn-primary float-right" name="action" value="SendTrouble">Gửi</button>
            </form>
            <a href="user.jsp"><button style="padding: 0px 40px; margin: 10px 10px" class="btn btn-light float-right">Hủy</button></a>     
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
    <script src="js/js.js" ></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".trouble").addClass("active");
        });
    </script>
    <script>

        function getDate() {
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1; //January is 0!
            var yyyy = today.getFullYear();

            if (dd < 10) {
                dd = '0' + dd;
            }

            if (mm < 10) {
                mm = '0' + mm;
            }

            today = yyyy + '-' + mm + '-' + dd;
            document.getElementById("time").value = today;
        }


        window.onload = function () {
            getDate();
        };
    </script>
</html>
