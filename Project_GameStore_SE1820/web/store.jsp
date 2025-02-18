<%@ page session="true" %>
<%
    Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
    if (isLoggedIn == null || !isLoggedIn) {
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Game Store</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <script src="js/script.js" defer></script>
</head>
<body>
    <%@include file="header.jsp" %>
    <div class="container">
        <h1>Welcome to Game Store</h1>
        <p>Explore and enjoy the best games!</p>

        <div class="game-container">
            <button class="arrow-button" onclick="prevGame()">&#9664;</button>
            <div class="game-info">
                <h2 id="gameTitle"></h2>
                <img id="mainImage" src="" alt="Game Image">
                <p><strong>Price:</strong> <span id="gamePrice"></span></p>
                <div class="thumbnails">
                    <img class="thumbnail" src="" alt="Thumbnail 1">
                    <img class="thumbnail" src="" alt="Thumbnail 2">
                    <img class="thumbnail" src="" alt="Thumbnail 3">
                    <img class="thumbnail" src="" alt="Thumbnail 4">
                </div>
            </div>
            <button class="arrow-button" onclick="nextGame()">&#9654;</button>
        </div>

        <a href="MainController?action=logout" class="logout-btn">Logout</a>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>
