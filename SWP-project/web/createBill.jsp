<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tạo mới hóa đơn</title>
        <link rel="stylesheet" href="css/viewTrouble.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null or (sessionScope.LOGIN_USER.roleID ne 'EM')}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <jsp:include page="headerEmp.jsp"></jsp:include>
            <!--NEW-->
            <div class="container">
                <h2 class="text-center" style="margin-top: 3%;">Thêm mới hóa đơn</h2>
                <form action="MainController" method="POST">
                    <div id="inputElement">                        
                        <div class="billElement">
                            <hr>
                            <div class="form-row">
                                <div class="col-md-4 mb-3">
                                    <label>Ngày ghi: </label>
                                    <input type="date" class="form-control" name="date" value=""id="time">

                                </div>
                                <div class="col-md-12 mb-3">
                                    <label>Hóa đơn cho: </label>
                                    <select class="service custom-select" id="contract" name="apartmentId">
                                        <option selected="" value="">-----Hóa đơn của-----</option>
                                    <c:forEach var="contract" items="${requestScope.LIST_CONTRACT}">
                                        <option value="${contract.apartmentId}">
                                            ${contract.contractId} - ${contract.apartmentId} - ${contract.ownerId} - ${contract.fullName} - ${contract.startDate}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-row" >
                            <div class="col-md-3 mb-3" >
                                <label>Chỉ số điện cũ: </label>
                                <input type="text" id="Elec" class="form-control" name="oldIndexElec" placeholder="123..">
                            </div>
                            <div class="col-md-3 mb-3" >
                                <label>Chỉ số điện mới: </label>
                                <input type="text" class="form-control" name="newIndexElec" placeholder="123..." value="">
                            </div>
                            <div class="col-md-3 mb-3" >
                                <label>Chỉ số nước cũ: </label>
                                <input type="text" id="Water" class="form-control" name="oldIndexWater" placeholder="123...">
                            </div>
                            <div class="col-md-3 mb-3" >
                                <label>Chỉ số nước mới: </label>
                                <input type="text" class="form-control" name="newIndexWater" placeholder="123..." value="">
                            </div>
                        </div>
                        <div class="form-row">
                            <div id="otherService" class="col-md-12 mb-3">   
                                <label>Dịch vụ khác: </label>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary btn-form float-right" name="action" value="CreateBill">Thêm mới hóa đơn</button>
            </form>
            ${requestScope.ERROR}
            <button class="btn-addService float-left btn btn-form btn-primary">Thêm dịch vụ khác</button>
            <a href="employee.jsp">
                <button class="btn btn-form float-right btn-light">Hủy</button>
            </a> 



            <div id="none" style="display:none">
                <c:forEach var="service" items="${requestScope.LIST_SERVICE}">
                    <option value="${service.serviceId}">
                        ${service.serviceId} - ${service.serviceName} - ${service.price}
                    </option>
                </c:forEach>
            </div>
            <div id="hidden-file">
            </div>
        </div>
        <!--END-NEW-->
        <jsp:include page="footer2.jsp"></jsp:include>
    </body>
    <script>
        $.newService = '<select class="service custom-select" style="margin-top: 30px;" name="serviceId">' + $("#none").html() + +'</select>';
        $(document).ready(function () {
            $(".btn-addService").live("click", function () {
                $($.newService).hide().appendTo($("#otherService")).show('normal');
            });
            $("#contract").live("change", function () {
                var apartmentId = $(this).val();
                $.ajax({
                    url: '/ApartmentManagement/MainController',
                    type: 'POST',
                    data: {
                        action: 'LoadIndex',
                        apartmentId: apartmentId
                    },
                    success: function (data) {
                        $("#hidden-file").empty();
                        var row = document.getElementById("hidden-file");
                        row.innerHTML += data;
                        $('#Water').val($('#electric-index').val());
                        $('#Elec').val($('#water-index').val());
                    }
                });
            });
        });
    </script>
    <script>

        function getDate() {
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1;
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
    <script>
        $(document).ready(function () {
            $(".createbill").addClass("active");
        });
    </script>
</html>
