<%-- 
    Document   : output
    Created on : Feb 10, 2025, 11:06:12 AM
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
        <%
        int n = (int)request.getAttribute("n");    
        %>
        
        <b> <span style="font-size: 20px ;color: blue" >   Bang cuu chuong </span> </b> <%= n%>  <br/>
        <%    for (int i = 1; i <= 10; i++) {
        %>

        <%=n%> * <%=i%> = <%=n * i%> <br/>  
        <%    }
            }%>
    </body>
</html>
