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
