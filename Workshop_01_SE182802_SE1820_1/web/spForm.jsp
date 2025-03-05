<%@page import="dto.UserDTO"%>
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
        <% if (session.getAttribute("user") != null) {
                UserDTO user = (UserDTO) session.getAttribute("user");
                if (user.getRole().equals("Founder")) {
        %>
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
            String txtProject_name_error = request.getAttribute("txtProject_name_error") + "";
            txtProject_name_error = txtProject_name_error.equals("null") ? "" : txtProject_name_error;
            String txtEstimatedLaunch_error = request.getAttribute("txtEstimatedLaunch_error") + "";
            txtEstimatedLaunch_error = txtEstimatedLaunch_error.equals("null") ? "" : txtEstimatedLaunch_error;
        %>
        <div class="container">
            <h1>StartupProjects Information</h1>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="add"/>

                <% String projectName = request.getAttribute("projectName") + "";
                    projectName = projectName.equals("null") ? "" : projectName;
                %>

                <div class="form-group">
                    <label for="txtProject_name">Project Name</label>
                    <input type="text" id="txtTitle" name="txtProject_name" value="<%=sp.getProject_name()%>"/>
                    <% if (!txtProject_name_error.isEmpty()) {%>
                    <div style="color: red"><%=txtProject_name_error%></div>
                    <% }%>
                </div>

                <% String description = request.getAttribute("description") + "";
                    description = description.equals("null") ? "" : description;
                %>

                <div class="form-group">
                    <label for="txtDescription">Description:</label>
                    <input type="text" id="txtAuthor" name="txtDescription" value="<%=sp.getDescription()%>"/>
                </div>
                <% String status = request.getAttribute("status") + "";
                    status = status.equals("null") ? "" : status;
                %>

                <div class="form-group">
                    <label for="txtStatus">Status:</label>
                    <input type="text" id="txtPublishYear" name="txtStatus" value="<%=sp.getStatus()%>"/>
                </div>

                <% String estimatedLaunch = request.getAttribute("txtEstimatedLaunch") + "";
                    estimatedLaunch = estimatedLaunch.equals("null") ? "" : estimatedLaunch;
                %>

                <div class="form-group">
                    <label for="txtEstimatedLaunch">Date launch:</label>
                    <input type="date" id="txtQuantity" name="txtEstimatedLaunch" value="<%=sp.getEstimated_launch()%>"/>
                    <% if (!txtEstimatedLaunch_error.isEmpty()) {%>
                    <div class="error-message"><%=txtEstimatedLaunch_error%></div>
                    <% }%>
                </div>
                <div class="button-group">
                    <input type="submit" value="Save" />
                    <button type="button" onclick="window.location.href = 'spForm.jsp'">Reset</button>
                </div>
            </form>
        </div>
    </body>
    <a href="MainController?action=search" class="back-link">Back to List</a>

    <%} else {%>

    <h1 style="color: red">403 Error</h1>
    <p>You do not have permission to access this content!</p>
    <a href="MainController?action=search" class="back-link">Back to List</a>

    <%}
        } else {%>

    <h1>Access Denied</h1>
    <p>Please log in to access this page.</p>
    <a href="login.jsp" class="back-link">Go to Login</a>
    <%}%>

</html>