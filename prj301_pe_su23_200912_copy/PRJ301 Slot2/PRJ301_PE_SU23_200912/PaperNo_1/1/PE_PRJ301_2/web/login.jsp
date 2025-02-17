<%-- 
    Document   : login
    Created on : 10/06/2023, 12:44:45 PM
    Author     : Truong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style> 
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }

            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background: linear-gradient(135deg, #667eea, #764ba2);
            }

            .login-container {
                width: 400px;
                padding: 30px;
                background: white;
                border-radius: 12px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
                text-align: center;
                animation: fadeIn 0.8s ease-in-out;
            }

            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(-20px); }
                to { opacity: 1; transform: translateY(0); }
            }

            .title {
                font-size: 32px;
                font-weight: 800;
                color: #222;
                margin-bottom: 30px;
                letter-spacing: 1px;
            }

            .input-group {
                position: relative;
                margin-bottom: 20px;
            }

            .input-group input {
                width: 100%;
                padding: 14px;
                padding-left: 50px;
                font-size: 18px;
                border: 2px solid #ccc;
                border-radius: 8px;
                transition: 0.3s;
            }

            .input-group input:focus {
                border-color: #667eea;
                outline: none;
            }

            .input-group i {
                position: absolute;
                left: 15px;
                top: 50%;
                transform: translateY(-50%);
                font-size: 20px;
                color: #666;
            }

            .login-btn {
                width: 100%;
                padding: 14px;
                font-size: 20px;
                background: #667eea;
                color: white;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-weight: bold;
                transition: 0.3s;
            }

            .login-btn:hover {
                background: #5a67d8;
            }

            .forgot-password {
                margin-top: 20px;
                font-size: 16px;
                font-weight: bold;
                color: #444;
            }

            .forgot-password a {
                color: #667eea;
                font-weight: bold;
                text-decoration: none;
                font-size: 16px;
            }

            .forgot-password a:hover {
                text-decoration: underline;
            }


        </style>
    </head>
    <body>
        <div class="login-container">
            <h1 class="title">Login</h1>
            <form action="MainController" method="post">
                <div class="input-group">
                    <i class="fas fa-user"></i>
                    <input type="text" name="userId" placeholder="Enter your userID" required>
                </div>
                <div class="input-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="password" placeholder="Enter your password" required>
                </div>
                <div style="color: red">${error}</div>
                <button class="login-btn" type="submit">Login</button>
                <p class="forgot-password">Forgot password? <a href="#">Reset here</a></p>
            </form>
        </div>
    </body>
</html>
