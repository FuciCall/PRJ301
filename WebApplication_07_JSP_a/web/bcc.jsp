<%-- 
    Document   : example02
    Created on : Feb 10, 2025, 10:13:52 AM
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
        <%  %>
        <% for (int a = 2; a <= 9; a++) {%> 
        <hr>
        <b> <span style="font-size: 20px ;color: blue" >   Bang cuu chuong </span> </b> <%= a%>  <br/>
        <%    for (int i = 1; i <= 10; i++) {
        %>

        <%=a%> * <%=i%> = <%=a * i%> <br/>  
        <%    }
            }%>
    </body>
</html>
