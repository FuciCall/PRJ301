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
                <p class="pixel-text">Thank you for visiting!</p>
            </div>
            <p>&copy; 2025 Game Store. All rights reserved.</p>
            <nav class="footer-menu">
                <a href="#">About Us</a>
                <a href="#">Privacy Policy</a>
                <a href="#">Terms of Use</a>
                <a href="#">Support</a>
            </nav>
        </div>
    </footer>
</body>
