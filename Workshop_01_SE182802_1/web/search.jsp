<%-- 
    Document   : search
    Created on : Feb 27, 2025, 11:31:10 PM
    Author     : as
--%>

<%@page import="model.StartupProjectsDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>search Page</title>
    </head>

    <body>
        <%
            if (session.getAttribute("user")!=null) { 
                    UserDTO user = (UserDTO)session.getAttribute("user");     
        %>
        <h1>Welcome <%=user.getName()%></h1>
        
        <form action="MainController">
            <input type="hidden" name="action" value="logout" />
            <input type="submit" value="Logout" />
        </form>
        
        
        <%}%> 
    </body>

</html>
