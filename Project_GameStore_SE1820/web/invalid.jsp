<%-- 
    Document   : invalid.jsp
    Created on : Feb 15, 2025, 9:32:00 PM
    Author     : fuci
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Invalid Login</title>
        <style>
            body {
                text-align: center;
                background-color: #1a1a1a;
                color: white;
            }
            .error-container {
                margin-top: 50px;
                font-size: 26px;
                font-weight: bold;
                color: red;
            }
            .retry-link {
                font-size: 18px;
                color: purple;
                text-decoration: none;
                display: block;
                margin-top: 10px;
            }
            .image-container {
                margin: 40px 0;
            }
            .footer-container {
                position: fixed;
                bottom: 0;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <div class="error-container">
            Invalid username or password!
        </div>
        <a href="login.jsp" style="text-decoration: underline;">Click here to try again</a>
        <div class="image-container">
            <img src="https://th.bing.com/th/id/OIP.ZV4g-gPqgkIxJF8QGoQHYQHaHa?w=161&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7" alt="Animated Image">
        </div>

        <div class="footer-container">
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
