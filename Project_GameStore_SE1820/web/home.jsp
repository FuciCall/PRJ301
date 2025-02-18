<%@ page session="true" %>
<%
    Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
    if (isLoggedIn == null || !isLoggedIn) {
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Home - Game Store</title>
        <style>
            html, body {
                height: 100%;
                margin: 0;
                display: flex;
                flex-direction: column;
            }

            .container {
                flex: 1;
                text-align: center;
                margin-top: 50px;
            }

            h1 {
                color: #333;
            }

            .logout-btn {
                background-color: #d9534f;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                text-decoration: none;
                font-size: 16px;
            }

            .logout-btn:hover {
                background-color: #c9302c;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <h1>Welcome to Game Store</h1>
            <p>You have successfully logged in!</p>
            <a href="MainController?action=logout" class="logout-btn">Logout</a>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
