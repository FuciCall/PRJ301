<%-- 
    Document   : login.jsp
    Created on : Feb 15, 2025, 9:33:52 PM
    Author     : LAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập - Game Store</title>
        <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Link file CSS nếu có -->
            <style>
            .login-container {
                min-height: 500px;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #f5f5f5;
                padding: 20px;
            }

            .login-form {
                background: white;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 400px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                margin-bottom: 8px;
                font-weight: 500;
                color: #333;
            }

            .form-group input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
                transition: border-color 0.3s;
            }

            .form-group input:focus {
                border-color: #4CAF50;
                outline: none;
            }

            .submit-btn {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
                font-size: 16px;
                transition: background-color 0.3s;
            }

            .submit-btn:hover {
                background-color: #45a049;
            }

            .form-title {
                text-align: center;
                margin-bottom: 30px;
                color: #333;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="login-container">
            <form action="MainController" method="post" class="pixel-border">
                <input type="hidden" name="action" value="login" />
                <label>UserID</label>
                <input type="text" name="txtUserID" class="pixel-input"/><br/> 
                <label>Password</label>
                <input type="password" name="txtPassword" class="pixel-input"/><br/>
                <input type="submit" value="Login" class="pixel-button"/>
            </form>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>