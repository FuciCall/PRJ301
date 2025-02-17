<%-- 
    Document   : example03
    Created on : Feb 10, 2025, 10:21:28 AM
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
        <%! int a = 111;%>
        <%
            if (a % 2 == 0) {%>
        <b>    <%=a%> la so chan </b>
        <%} else {%>
        <b><%=a%> la so le</b>        
        <%}%>

    </body>
</html>
