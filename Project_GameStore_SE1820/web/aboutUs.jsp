<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us - Game Store</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #1e1e1e;
            color: white;
            text-align: center;
        }
        .container {
            max-width: 900px;
            margin: 50px auto;
            padding: 20px;
            background: #282c34;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.2);
        }
        h1 {
            color: white; /* Đồng bộ màu chữ */
        }
        .founders {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }
        .founder {
            text-align: center;
        }
        .founder img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 3px solid #ffcc00;
        }
        .story {
            margin-top: 30px;
            font-size: 18px;
            line-height: 1.6;
            text-align: justify;
        }
        footer {
            margin-top: 50px;
            padding: 20px;
            background: #20232a;
        }
    </style>
</head>
<body>
    <%@include file="header.jsp" %>
    <div class="container">
        <h1>About Us</h1>
        <p>Welcome to Game Store! We are passionate gamers and developers from FPT University Ho Chi Minh, VietNam.</p>
        
        <div class="founders">
            <div class="founder">
                <img src="images/solo_1.jpg" alt="Le Hoang Long">
                <p>Le Hoang Long (K18)</p>
            </div>
            <div class="founder">
                <img src="images/solo_3.jpg" alt="Dang Hoang Phuc"/>
                <p>Dang Hoang Phuc (K18)</p>
            </div>
            <div class="founder">
                <img src="images/solo_2.jpg" alt="Le Nguyen Diep Huy">
                <p>Le Nguyen Diep Huy (K18)</p>
            </div>
        </div>
        
        <div class="story">
            <h2>Our Story</h2>
            <p>It all started in a small dorm room at FPT University, where three passionate gamers had a vision: to create a game store that truly understands the needs of players. 
            We spent countless nights brainstorming, coding, and testing, fueled by instant noodles and an unstoppable passion for gaming. 
            Today, Game Store is more than just a platform—it’s a community where gamers can find, explore, and enjoy the best games the world has to offer.</p>
            <p>Join us on this journey and let's make gaming even better together!</p>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
