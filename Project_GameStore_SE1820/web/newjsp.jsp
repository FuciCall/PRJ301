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

            .game-gallery {
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 20px 0;
            }

            .main-image {
                width: 600px;
                height: 350px;
                object-fit: cover;
                border-radius: 10px;
                transition: opacity 0.3s;
            }

            .thumbnail-container {
                display: flex;
                justify-content: center;
                gap: 10px;
                margin-top: 10px;
            }

            .thumbnail {
                width: 120px;
                height: 80px;
                object-fit: cover;
                border-radius: 5px;
                cursor: pointer;
                transition: transform 0.2s;
            }

            .thumbnail:hover {
                transform: scale(1.1);
            }

            .nav-buttons {
                display: flex;
                justify-content: space-between;
                width: 650px;
                margin: auto;
            }

            .nav-buttons button {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px 15px;
                cursor: pointer;
                border-radius: 5px;
                font-size: 16px;
            }

            .nav-buttons button:hover {
                background-color: #0056b3;
            }
        </style>
        <script>
            function changeMainImage(imageSrc) {
                document.getElementById("mainImage").src = imageSrc;
            }
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <h1>Welcome to Game Store</h1>
            <p>You have successfully logged in!</p>
            
            <div class="game-gallery">
                <button onclick="prevGame()">&#9665;</button>
                <img id="mainImage" class="main-image" src="https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1245620/header.jpg?t=1738690346" alt="Main Game Image">
                <button onclick="nextGame()">&#9655;</button>
            </div>
            
            <div class="thumbnail-container">
                <img class="thumbnail" src="https://th.bing.com/th/id/OIP.wQrbFMCbvmYW8yxTlrLzsAHaEK?w=283&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7" alt="Game Thumbnail 1" onmouseover="changeMainImage(this.src)">
                <img class="thumbnail" src="https://th.bing.com/th/id/OIP.iB-KKY6g1uGY3lwQm1Z2BgHaEK?w=320&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7" alt="Game Thumbnail 2" onmouseover="changeMainImage(this.src)">
                <img class="thumbnail" src="https://th.bing.com/th/id/OIP.eKRzFAXspt4Kz_YLt0iEKwHaEK?w=264&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7" alt="Game Thumbnail 3" onmouseover="changeMainImage(this.src)">
                <img class="thumbnail" src="https://i0.wp.com/1kgame.net/wp-content/uploads/2022/03/huong-dan-chon-class-nhan-vat-trong-elden-ring-3.jpg?resize=700%2C392&ssl=1" alt="Game Thumbnail 4" onmouseover="changeMainImage(this.src)">
            </div>
            
            <p>Price: 990.000$</p>
            <a href="MainController?action=logout" class="logout-btn">Logout</a>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
