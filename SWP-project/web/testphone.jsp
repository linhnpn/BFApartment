<%-- 
    Document   : testphone
    Created on : Jul 23, 2022, 10:40:37 AM
    Author     : Nhat Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        Phone number:
        <form>
            <input type="text" id="number" placeholder="+923********">
            <div id="recaptcha-container"></div>
            <button type="button" onclick="phoneAuth();">SendCode</button>
        </form><br>
        <h1>Enter Verification code</h1>
        <form>
            <input type="text" id="verificationCode" placeholder="Enter verification code">
            <button type="button" onclick="codeverify();">Verify code</button>

        </form>

        
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
