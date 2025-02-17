<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign Up</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }

            body {
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .signup-container {
                background: white;
                padding: 2rem;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 400px;
            }

            .signup-container h2 {
                text-align: center;
                margin-bottom: 1rem;
            }

            .form-group {
                margin-bottom: 1rem;
            }

            .form-group label {
                font-weight: bold;
                display: block;
                margin-bottom: 0.5rem;
            }

            .form-group input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .submit-btn {
                width: 100%;
                padding: 10px;
                background: #3498db;
                border: none;
                color: white;
                font-size: 1rem;
                cursor: pointer;
                border-radius: 5px;
            }

            .submit-btn:hover {
                background: #2980b9;
            }

            .login-link {
                text-align: center;
                margin-top: 1rem;
            }

            .login-link a {
                color: #3498db;
                text-decoration: none;
            }

            .login-link a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div style="min-height: 500px; padding: 10px">
            <div class="signup-container">
                <h2>Sign Up</h2>
                <form action="registerServlet" method="post">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>

                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" required>
                    </div>

                    <button type="submit" class="submit-btn">Sign Up</button>

                    <div class="login-link">
                        Already have an account? <a href="login.jsp">Log In</a>
                    </div>
                </form>
            </div>
            <jsp:include page="footer.jsp"/>
    </body>
</html>
