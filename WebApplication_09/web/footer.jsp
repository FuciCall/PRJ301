<%-- 
    Document   : footer
    Created on : Feb 17, 2025, 11:13:08 AM
    Author     : LAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    .footer {
        background-color: #20232a;
        padding: 20px 0;
        color: white;
        text-align: center;
    }

    .footer-menu {
        display: flex;
        justify-content: center;
        gap: 2rem;
        list-style: none;
        margin-top: 10px;
    }

    .footer-menu a {
        color: white;
        text-decoration: none;
    }

    .footer-menu a:hover {
        color: #ff5722;
    }
</style>

<body>
    <footer class="footer">
        <div>
            <div class="pixel-border">
                <p class="pixel-text">Cảm ơn bạn đã ghé thăm!</p>
            </div>
            <p>&copy; 2025 Game Store. All rights reserved.</p>
            <nav class="footer-menu">
                <a href="#">Về chúng tôi</a>
                <a href="#">Chính sách bảo mật</a>
                <a href="#">Điều khoản sử dụng</a>
                <a href="#">Hỗ trợ</a>
            </nav>
        </div>
    </footer>
</body>
