<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toán hóa đơn</title>
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null or (sessionScope.LOGIN_USER.roleID ne 'US')}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <jsp:include page="headerUser.jsp"></jsp:include>
            <div class="container py-5">
                <div class="row mb-4">
                    <div class="col-lg-8 mx-auto text-center">
                        <h1 class="display-6">Thanh toán</h1>
                    </div>
                </div> <!-- End -->
                <div class="row">
                    <div class="col-lg-6 mx-auto">
                        <div class="card ">
                            <div class="card-header">
                                <div class="tab-content">
                                    <!-- credit card info-->
                                    <div id="credit-card" class="tab-pane fade show active pt-3">
                                        <form action="MainController" method="POST">
                                            <div class="form-group "> <label>
                                                    <h6>Ngân hàng</h6>
                                                </label> <select name="bankName" type="checkbox" class="form-control">
                                                    <option value="" selected disabled>--Chọn ngân hàng--</option>
                                                    <option value="BANK01">VietcomBank</option>
                                                    <option value="BANK02">TienPhongBank</option>
                                                </select> </div>
                                            <div class="form-group"> <label>
                                                    <h6>Chủ Tài Khoản</h6>
                                                </label> <input type="text" name="name" required="" placeholder="Nguyễn Văn A..." class="form-control"> </div>
                                            <div class="form-group"> <label>
                                                    <h6>Số tài khoản</h6>
                                                </label>
                                                <div class="input-group"> <input type="number" name="bankNumber" required="" placeholder="4443234245" class="form-control">
                                                    <div class="input-group-append"> <span class="input-group-text text-muted"> <i class="fab fa-cc-visa mx-1"></i> <i class="fab fa-cc-mastercard mx-1"></i> <i class="fab fa-cc-amex mx-1"></i> </span> </div>
                                                </div>
                                            </div>
                                            <div class="form-group"> <label>
                                                    <h6>PIN</h6>
                                                </label> <input type="password" name="PIN" required="" placeholder="012345" class="form-control "> </div>
                                            <div class="form-group"> <label for="username">
                                                    <h6>Nội dung: </h6>
                                                </label> <input type="text" name="content" value="" placeholder="Chuyển tiền" class="form-control "> </div>
                                            ${requestScope.BANK_ERROR}
                                        <input type="hidden" name="total" value="${param.total}">
                                        <input type="hidden" name="billId" value="${param.billId}">
                                        <button type="submit" name="action" value="PayBill" class="subscribe btn btn-primary btn-block shadow-sm">Thanh toán ${param.total} VNĐ</button>
                                    </form>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
