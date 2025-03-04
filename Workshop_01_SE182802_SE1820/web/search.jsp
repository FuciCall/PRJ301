<%-- 
    Document   : search
    Created on : Feb 27, 2025, 11:31:10 PM
    Author     : as
--%>

<%@page import="utils.AuthUtils"%>
<%@page import="dto.StartupProjectsDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%   if (session.getAttribute("user") != null) {
                UserDTO user = (UserDTO) session.getAttribute("user");
        %>
        <h1>Welcome  <%=user.getName()%>  </h1> <br/>

        <form action="MainController">
            <input type="hidden" name="action" value="logout" />
            <input type="submit" value="Logout" />
        </form>

        <%
            String searchTerm = request.getAttribute("searchTerm") + "";
            searchTerm = searchTerm.equals("null") ? "" : searchTerm;
        %>

        <form action="MainController">
            <input type="hidden" name="action" value="search" />
            Search Startup Projects<input type="text" name="searchTerm" value="<%=searchTerm%>" />
            <input type="submit" value="Search" />
        </form>
        <br/>
        <br/>

        <% if (AuthUtils.isFounders(session)) {
        %>
        <a href="StartupProjectsForm.jsp" class="add-btn">
            Add New Project    
        </a> 
        <%}%>

        <%
            if (request.getAttribute("sp") != null) {
                List<StartupProjectsDTO> sp = (List<StartupProjectsDTO>) request.getAttribute("sp");
        %>
        <table border="1">
            <thead>
                <tr>
                    <td>project_id</td>
                    <td>project_name</td>
                    <td>Description</td>
                    <td>Status</td>
                    <td>estimated_launch</td>
                    <% if (AuthUtils.isFounders(session)) {
                    %>
                    <th>Action</th>
                        <%}%>
                </tr>
            </thead>
            <tbody>
                <%
                    for (StartupProjectsDTO s : sp) {
                %>
                <tr>
                    <td><%=s.getProject_id()%></td>
                    <td><%=s.getProject_name()%></td>
                    <td><%=s.getDescription()%></td>
                    <td><%=s.getStatus()%></td>
                    <td><%=s.getEstimated_launch()%></td>
                    <%
                        if (AuthUtils.isFounders(session)) {
                    %>
                    <td><a href="MainController?action=delete&id=<%=s.getProject_id()%>&searchTerm=<%=searchTerm%>">
                            <img src="images/delete-icon.png" style="height: 20px">
                        </a></td>
                </tr>
                <%}%>
            </tbody>
        </table>
        <%}
        } else { %>
        You do not have permission to access this content.
        <%}%>

    </body>
</html>
