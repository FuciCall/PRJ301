<%-- 
    Document   : login
    Created on : 10/06/2023, 12:44:45 PM
    Author     : Truong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h5 style="color: red">${requestScope.ERROR}<h5/> 
        <form action="MainController" method="POST">       
            UserId <input type="text" name="txtUserId" value="" > <br/>
            Password <input type="password" name="txtPassword" value=""> <br/>
            <input type="submit" name="action" value="Login">  
            
        </form>
    </body>
</html>
