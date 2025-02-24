<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Forgot Password - Game Store</title>
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
    <style>
        body {
            background: url('images/pixel-art-fantasy-art-mini-shrine-wallpaper.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Press Start 2P', cursive;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .forgot-password-container {
            background: rgba(0, 0, 0, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 4px 4px 0px #ffffff;
            text-align: left;
            max-width: 400px;
            width: 100%;
            color: white;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 10px;
        }

        .form-group input {
            width: 90%;
            padding: 10px;
            border: 2px solid #fff;
            border-radius: 5px;
            font-size: 16px;
            text-align: center;
            background: black;
            color: white;
        }

        .submit-btn {
            background-color: #ffcc00;
            color: black;
            padding: 10px;
            border: 2px solid white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            transition: all 0.3s ease;
            margin-bottom: 20px;
        }

        .submit-btn:hover {
            background-color: #ffaa00;
            box-shadow: 3px 3px 0px #fff;
        }

        .forgot-password-container a {
            font-size: 12px;
            text-decoration: none;
            text-align: center;
            color: #ffcc00;
        }

        .forgot-password-container span {
            font-size: 12px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="forgot-password-container">
        <h2>Forgot Password</h2>
        <form action="forgotPasswordServlet" method="post">
            <div class="form-group">
                <label for="email">Enter your email</label>
                <input type="email" id="email" name="email" required placeholder="Enter your email">
            </div>

            <button type="submit" class="submit-btn">Reset Password</button>

            <span>Remember your password? <a href="login.jsp">Log In</a></span>
        </form>
    </div>
</body>
</html>