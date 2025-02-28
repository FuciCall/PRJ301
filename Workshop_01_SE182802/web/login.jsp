<%-- 
    Document   : login
    Created on : Feb 27, 2025, 9:32:20 PM
    Author     : as
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Sign In</h1>
        <form action="MainController" method="POST">
            <input type="hidden" name="action" value="login" />
            UserName: <input type="text" name="txtUserName" value="" /> <br/>
            Password: <input type="password" name="txtPassword" value="" /> <br/>
            <input type="submit" name="action" value="Login" /> <br/>
            <%
                String error = request.getAttribute("error")+"";
            %>
            <%=error.equals("null")?"":error%>
        </form>
    </body>
</html>
