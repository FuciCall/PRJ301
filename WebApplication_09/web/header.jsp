<%-- 
    Document   : header
    Created on : Feb 17, 2025, 11:01:38 AM
    Author     : LAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">

<style>
    body {
        background-color: #1a1a1a;
        color: white;
        font-family: Arial, sans-serif;
        image-rendering: pixelated;
    }

    .pixel-text {
        font-family: 'Press Start 2P', cursive;
        text-transform: uppercase;
    }

    .pixel-border {
        border: 4px solid black;
        background-color: #f4c400;
        box-shadow: 4px 4px 0 black;
        padding: 10px;
        display: inline-block;
    }

    .header {
        background-color: #20232a;
        padding: 15px 0;
        color: white;
        text-align: center;
    }

    .header-container {
        display: flex;
        align-items: center;
        justify-content: space-between;
        width: 80%;
        margin: auto;
    }

    .menu a {
        color: white;
        text-decoration: none;
        margin-right: 20px;
    }

    .menu a:hover {
        color: #ff5722;
    }

    .pixel-button {
        background-color: #0073e6;
        color: white;
        border: 4px solid black;
        padding: 8px 15px;
        border-radius: 5px;
        font-family: 'Press Start 2P', cursive;
        cursor: pointer;
        box-shadow: 4px 4px 0 black;
    }

    .pixel-button:hover {
        background-color: #ff5722;
    }
</style>

<body>
    <header class="header">
        <div class="header-container">
            <div>
                <div class="pixel-border">
                    <h1 class="pixel-text">Game Store</h1>
                </div>
                <nav class="menu">
                    <a href="#">Cửa hàng</a>
                    <a href="#">Thể loại</a>
                    <a href="#">Giảm giá</a>
                    <a href="#">Hỗ trợ</a>
                </nav>
            </div>
            <div>
                <button class="pixel-button">Tải Game Store</button>
                <a href="#" style="color: white; margin-left: 15px;">Đăng nhập</a> | 
                <a href="#" style="color: white; margin-left: 10px;">Ngôn ngữ ▼</a>
            </div>
        </div>
    </header>
</body>
