<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Support - Game Store</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #121212;
            color: #ffffff;
            text-align: center;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #1e1e1e;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.1);
        }
        h1 {
            color: #ffcc00;
        }
        .contact {
            margin-top: 20px;
            font-size: 18px;
        }
        .faq {
            text-align: left;
            margin-top: 30px;
        }
        .faq h2 {
            color: #ffcc00;
        }
        .faq p {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    <div class="container">
        <h1>📌 Support Center - Game Store</h1>
        <p>💬 We're here to assist you! If you have any issues, feel free to reach out to us through the following channels:</p>
        
        <div class="contact">
            <p><strong>📧 Support Email:</strong> <a href="mailto:support@gamestore.com">support@gamestore.com</a></p>
            <p><strong>📞 Hotline:</strong> 1900-123-456</p>
            <p><strong>⏰ Working Hours:</strong> 8:00 AM - 10:00 PM (Daily)</p>
        </div>
        
        <div class="faq">
            <h2>❓ Frequently Asked Questions (FAQ)</h2>
            <p><strong>🔹 Can I get a refund after purchasing a game?</strong><br>
               ✅ Yes, you can request a refund within <strong>14 days</strong> if you have not played for more than <strong>2 hours</strong>.</p>
            <p><strong>🔹 How can I contact customer support?</strong><br>
               📩 You can send an <strong>email</strong> or call our <strong>hotline</strong> for quick assistance.</p>
            <p><strong>🔹 I'm experiencing an error while downloading a game. What should I do?</strong><br>
               🔍 Please check your <strong>internet connection</strong> and try again. If the issue persists, contact us for support.</p>
            <p><strong>🔹 How do I update my payment details?</strong><br>
               💳 You can update your payment information in the <strong>Account Settings</strong> section.</p>
            <p><strong>🔹 Are there any special discounts for students?</strong><br>
               🎓 Yes! We offer special <strong>student discounts</strong>. Please verify your student status to avail the offer.</p>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
