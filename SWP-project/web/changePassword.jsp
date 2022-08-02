<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/changePassword.css">
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER.roleID == 'EM'}">
            <jsp:include page="headerEmp.jsp"></jsp:include>
        </c:if>
        <c:if test="${sessionScope.LOGIN_USER.roleID == 'US'}">
            <jsp:include page="headerUser.jsp"></jsp:include>
        </c:if>
        <c:if test="${sessionScope.LOGIN_USER.roleID == 'AD'}">
            <jsp:include page="headerAdmin.jsp"></jsp:include>
        </c:if>
        <!--NEW-->
        <div class="card login-form">
            <div class="card-body">
                <h3 class="card-title text-center">Đổi mật khẩu</h3>
                <div class="card-text">
                    <form class="form-password" action="MainController" method="POST">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Mật khẩu cũ</label>
                            <input type="password" name="oldPassword" value="" class="form-control form-control-sm">
                            ${requestScope.PASSWORD_ERROR.oldPassError}
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Mật khẩu mới</label>
                            <input type="password" name="newPassword" value="" class="form-control form-control-sm">
                            ${requestScope.PASSWORD_ERROR.newPassError}
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Nhập lại mật khẩu mới</label>
                            <input type="password" name="reNewPassword" value="" class="form-control form-control-sm">
                            ${requestScope.PASSWORD_ERROR.reNewPassError}
                        </div>
                        <button type="submit" name="action" value="ChangePassword" class="btn btn-confirm btn-primary btn-block submit-btn">Xác nhận</button>
                    </form>
                </div>
            </div>
        </div>
        <!--END-NEW-->

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".password").addClass("active");
        });
    </script>
    <script src="js/js.js" ></script>

</html>
