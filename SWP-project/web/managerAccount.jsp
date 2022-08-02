<%-- 
    Document   : managerAccount
    Created on : May 24, 2022, 1:00:24 PM
    Author     : Minh Hoàng
--%>

<%@page import="entity.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manager Account Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="stylesheet" href="css/stylePopup.css">
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null or (sessionScope.LOGIN_USER.roleID ne 'AD')}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            String autoPopup = "";
            if (userError == null) {
                autoPopup = "hide";
                userError = new UserError();
            }
        %>
        <button class="open-modal-btn">Đăng kí tài khoản</button>
        <div class="modal <%=autoPopup%> ">
            <div class="modal__inner">
                <div class="modal__header">
                    <p>Đăng Ký</p>
                    <i class="fa-solid fa-xmark"></i>
                </div>
                <div class="modal__body">
                    <div id="cd-signup"> 
                        <!-- sign up form -->
                        <form action="MainController" method="POST" class="cd-form ">
                            <p class="fieldset cd-username ">
                                <label class="image-replace " for="signup-username">Tên đăng nhập: 
                                </label>
                                <input class="full-width has-padding has-border " id="signup-username" name="userName" type="text" placeholder="Tên đăng nhập..." required>
                            <p class="full-width"><%=userError.getUserIDError()%></p>                       
                            </p>                          
                            <p class="fieldset">
                                <label class="image-replace cd-password" for="signup-password">Mật khẩu
                                </label>
                                <input class="full-width has-padding has-border" id="signup-password" name="password" type="password"  placeholder="Mật khẩu..." required>
                                <a href="#0" class="hide-password">Hide
                                </a>
                            </p>
                            <p class="fieldset">
                                <label class="image-replace cd-password" for="signup-password">Nhập lại mật khẩu
                                </label>
                                <input class="full-width has-padding has-border" id="signup-password" name="passwordConfirm" type="password"  placeholder="Nhập lại mật khẩu..." required>
                                <a href="#0" class="hide-password">Hide
                                </a>
                            <p class="full-width"><%=userError.getConfirmError()%></p> 
                            </p>
                            <p class="fieldset">
                                <input class="full-width has-padding" type="submit" name="action" value="createAccount" >
                            </p>
                            <p class="full-width"><%=userError.getMessageError()%></p> 
                        </form>
                        <!-- <a href="#0" class="cd-close-form">Close</a> -->
                    </div> 
                    <!-- cd-signup -->

                </div>
                <div class="modal__footer">
                    <button>Đóng</button>
                </div>
            </div>
        </div>
    </body>
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js">
</script>
<script src = "js/popup.js" ></script>

</html>