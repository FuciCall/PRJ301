<%-- 
    Document   : search
    Created on : Feb 13, 2025, 11:27:20 AM
    Author     : tungi
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
                <style>
            body {
                text-align: center;
                background-color: #1a1a1a;
                color: white;
            }
            .error-container {
                margin-top: 50px;
                font-size: 26px;
                font-weight: bold;
                color: red;
            }
            .retry-link {
                font-size: 18px;
                color: purple;
                text-decoration: none;
                display: block;
                margin-top: 10px;
            }
            .image-container {
                margin: 40px 0;
            }
            .footer-container {
                position: fixed;
                bottom: 0;
                width: 100%;
            }
        </style>
    </head>
    <body> 
        <%@include file="header.jsp" %>
        <%
            UserDTO user = (UserDTO)request.getAttribute("user");
        %>
        <h1> Welcome <%=user.getFullName()%> </h1>
        
        <form action="#">
            Search Value: <input type="submit" name="txtSearchValue"/><br/>
            <input type="submit" name="Search"/>
        </form> <h1>Hello World!</h1>
        <jsp:include page="footer.jsp"/>
    </body>
</html>