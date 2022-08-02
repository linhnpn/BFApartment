<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/changePassword.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100" style="background-image: url('images/bg-01.jpg');">
                <c:if test="${sessionScope.USER!=null}">
                    <c:if test="${not empty sessionScope.USER}">
                        <div class="card login-form">
                            <div class="card-body"  style="padding: 0.25rem !important;">
                                <h3 class="card-title text-center">FORGOT PASSWORD</h3>
                                <div class="card-text">
                                    <form class="form-password">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Số điện thoại: </label>
                                            <input type="text" id="number" placeholder="+84********" readonly="" value="${sessionScope.USER.phone}">
                                            <div id="recaptcha-container"></div>
                                            <button type="button" class="btn btn-confirm btn-light btn-block submit-btn" onclick="phoneAuth();">Send Code</button>
                                        </div>
                                    </form>
                                    <form class="form-password">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Mã xác thực: </label>
                                            <input type="text" id="verificationCode" placeholder="Enter verification code">
                                            <button type="button" onclick="codeverify();" class="btn btn-confirm btn-primary btn-block submit-btn">Xác nhận</button>
                                        </div>
                                    </form>                            
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:if>
            </div>
        </div>        
    </body>
    <script src="https://www.gstatic.com/firebasejs/6.0.2/firebase.js"></script>

    <!-- TODO: Add SDKs for Firebase products that you want to use
         https://firebase.google.com/docs/web/setup#config-web-app -->

    <script>
                                                // Your web app's Firebase configuration
                                                // For Firebase JS SDK v7.20.0 and later, measurementId is optional
                                                const firebaseConfig = {
                                                    apiKey: "AIzaSyAhdts0VWLL7rb8h1OWp04rvX8Eec5m_Jg",
                                                    authDomain: "vegetable-343209.firebaseapp.com",
                                                    projectId: "vegetable-343209",
                                                    storageBucket: "vegetable-343209.appspot.com",
                                                    messagingSenderId: "169117543686",
                                                    appId: "1:169117543686:web:3bbb62600bf14ef3934287",
                                                    measurementId: "G-X9BXL2QQKK"
                                                };
                                                // Initialize Firebase
                                                firebase.initializeApp(firebaseConfig);
    </script>
    <script src="NumberAuthentication.js" type="text/javascript"></script>
</html>
