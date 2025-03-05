<%-- 
    Document   : bookForm
    Created on : Feb 27, 2025, 8:16:21 AM
    Author     : tungi
--%>
<%@page import="dto.ProjectDTO"%>
<%@page import="java.awt.print.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Book Management</title>
        <style>
            * {
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            
            body {
                background-color: #f5f5f5;
                margin: 0;
                padding: 20px;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }
            
            .container {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                padding: 30px;
                width: 100%;
                max-width: 600px;
            }
            
            h1 {
                color: #2c3e50;
                margin-top: 0;
                margin-bottom: 20px;
                text-align: center;
            }
            
            .form-group {
                margin-bottom: 15px;
            }
            
            label {
                display: block;
                margin-bottom: 5px;
                font-weight: 600;
                color: #333;
            }
            
            input[type="text"],
            input[type="number"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
                transition: border-color 0.3s;
            }
            
            input[type="text"]:focus,
            input[type="number"]:focus {
                border-color: #3498db;
                outline: none;
                box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
            }
            
            .error-message {
                color: #e74c3c;
                font-size: 14px;
                margin-top: 5px;
            }
            
            .button-group {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }
            
            button, input[type="submit"], input[type="reset"] {
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            
            input[type="submit"] {
                background-color: #2ecc71;
                color: white;
                flex: 1;
                margin-right: 10px;
            }
            
            input[type="submit"]:hover {
                background-color: #27ae60;
            }
            
            input[type="reset"] {
                background-color: #e74c3c;
                color: white;
                flex: 1;
                margin-left: 10px;
            }
            
            input[type="reset"]:hover {
                background-color: #c0392b;
            }
        </style>
    </head>
    <body>
        <%
            ProjectDTO book = new ProjectDTO();
            try {
                book = (ProjectDTO) request.getAttribute("book");
            } catch (Exception e) {
                book = new ProjectDTO();
            }
            if (book == null) {
                book = new ProjectDTO();
            }
            // get error information
            String txtproject_id = request.getAttribute("txtproject_id") + "";
            txtproject_id = txtproject_id.equals("null") ? "" : txtproject_id;
            String txtproject_name = request.getAttribute("txtproject_name") + "";
            txtproject_name = txtproject_name.equals("null") ? "" : txtproject_name;
        %>
        <div class="container">
            <h1>Book Information</h1>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="add"/>
                
                <div class="form-group">
                    <label for="txtproject_id">Book ID:</label>
                    <input type="text" id="txtproject_id" name="txtproject_id" value="<%=book.getProject_id()%>"/>
                    <% if (!txtproject_id.isEmpty()) { %>
                        <div class="error-message"><%=txtproject_id%></div>
                    <% } %>
                </div>
                
                <div class="form-group">
                    <label for="txtproject_name">Title:</label>
                    <input type="text" id="txtTitle" name="txtproject_name" value="<%=book.getProject_name()%>"/>
                    <% if (!txtproject_name.isEmpty()) { %>
                        <div class="error-message"><%=txtproject_name%></div>
                    <% } %>
                </div>
                
                <div class="form-group">
                    <label for="txtDescription">Author:</label>
                    <input type="text" id="txtDescription" name="txtDescription" value="<%=book.getDescription()%>"/>
                </div>
                
                <div class="form-group">
                    <label for="txtStatus">Publish Year:</label>
                    <input type="text" id="txtStatus" name="txtStatus" value="<%=book.getStatus()%>"/>
                </div>
                
                <div class="form-group">
                    <label for="txtestimated_launch">Price:</label>
                    <input type="number" id="txtestimated_launch" name="txtestimated_launch" value="<%=book.getEstimated_launch()%>"/>
                </div>
                
                <div class="button-group">
                    <input type="submit" value="Save" />
                    <input type="reset" value="Reset"/>
                </div>
            </form>
        </div>
    </body>
</html>