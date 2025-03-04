<%-- 
    Document   : bookForm
    Created on : Feb 27, 2025, 8:16:21 AM
    Author     : tungi
--%>
<%@page import="dto.StartupProjectsDTO"%>
<%@page import="dto.StartupProjectsDTO"%>
<%@page import="java.awt.print.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>StartupProjects Management</title>
    </head>
    <body>
        <%
            StartupProjectsDTO sp = new StartupProjectsDTO();
            try {
                sp = (StartupProjectsDTO) request.getAttribute("sp");
            } catch (Exception e) {
                sp = new StartupProjectsDTO();
            }
            if (sp == null) {
                sp = new StartupProjectsDTO();
            }
            // get error information
            String txtProject_id_error = request.getAttribute("txtProject_id_error") + "";
            txtProject_id_error = txtProject_id_error.equals("null") ? "" : txtProject_id_error;
            String txtProject_name_error = request.getAttribute("txtProject_name_error") + "";
            txtProject_name_error = txtProject_name_error.equals("null") ? "" : txtProject_name_error;
            String txtEstimatedLaunch_error = request.getAttribute("txtEstimatedLaunch_error") + "";
            txtEstimatedLaunch_error = txtEstimatedLaunch_error.equals("null") ? "" : txtEstimatedLaunch_error;
        %>
        <div class="container">
            <h1>StartupProjects Information</h1>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="add"/>
                
                <div class="form-group">
                    <label for="txtProject_id">Book ID:</label>
                    <input type="number" id="txtBookID" name="txtProject_id" value="<%=sp.getProject_id()%>"/>
                    <% if (!txtProject_id_error.isEmpty()) { %>
                        <div class="error-message"><%=txtProject_id_error%></div>
                    <% } %>
                </div>
                
                <div class="form-group">
                    <label for="txtProject_name">Title:</label>
                    <input type="text" id="txtTitle" name="txtProject_name" value="<%=sp.getProject_name()%>"/>
                    <% if (!txtProject_name_error.isEmpty()) { %>
                        <div class="error-message"><%=txtProject_name_error%></div>
                    <% } %>
                </div>
                
                <div class="form-group">
                    <label for="txtDescription">Author:</label>
                    <input type="text" id="txtAuthor" name="txtDescription" value="<%=sp.getDescription()%>"/>
                </div>
                
                <div class="form-group">
                    <label for="txtStatus">Status:</label>
                    <input type="text" id="txtPublishYear" name="txtStatus" value="<%=sp.getStatus()%>"/>
                </div>
                
                <div class="form-group">
                    <label for="txtEstimatedLaunch">Date launch:</label>
                    <input type="number" id="txtQuantity" name="txtEstimatedLaunch" value="<%=sp.getEstimated_launch()%>"/>
                    <% if (!txtEstimatedLaunch_error.isEmpty()) { %>
                        <div class="error-message"><%=txtEstimatedLaunch_error%></div>
                    <% } %>
                </div>
                
                <div class="button-group">
                    <input type="submit" value="Save" />
                    <input type="reset" value="Reset"/>
                </div>
            </form>
        </div>
    </body>
</html>