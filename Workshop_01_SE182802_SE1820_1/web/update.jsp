<%@page import="java.util.Enumeration"%>
<%@page import="dao.StartupProjectsDAO"%>
<%@page import="dto.StartupProjectsDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("project_id");
    System.out.println("DEBUG: project_id = " + id);
    StartupProjectsDAO sp = new StartupProjectsDAO();
    StartupProjectsDTO project = sp.readById(id);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Project</title>
    </head>
    <body>
        <h2>Update Project</h2>
        
        <% if (project != null) {%>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="project_id" value="<%= id != null ? id : ""%>">
            Status:
            <select name="Status">
                <option value="Ideation" <%= "Ideation".equals(project.getStatus()) ? "selected" : ""%>>Ideation</option>
                <option value="Development" <%= "Development".equals(project.getStatus()) ? "selected" : ""%>>Development</option>
                <option value="Launch" <%= "Launch".equals(project.getStatus()) ? "selected" : ""%>>Launch</option>
                <option value="Scaling" <%= "Scaling".equals(project.getStatus()) ? "selected" : ""%>>Scaling</option>
            </select>
            <br/>
            <input type="submit" value="Save">
        </form>
        <% } else { %>
        <p style="color: red;">Project not found!</p>
        <% }%>
    </body>
</html>
