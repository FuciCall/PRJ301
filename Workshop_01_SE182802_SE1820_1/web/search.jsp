<%@page import="utils.AuthUtils"%>
<%@page import="dto.StartupProjectsDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
    </head>
    <body>

        <%                if (session.getAttribute("user") != null) {
                UserDTO user = (UserDTO) session.getAttribute("user");
        %>
        <h1>Welcome <%=user.getName()%> </h1> <br/>

        <!-- Logout Form -->
        <form action="MainController">
            <input type="hidden" name="action" value="logout" />
            <input type="submit" value="Logout" />
        </form>
        <!-- Xử lý searchTerm để tránh lỗi null -->
        <%
            String searchTerm = (request.getAttribute("searchTerm") != null) ? (String) request.getAttribute("searchTerm") : "";
        %>
        <!-- Chỉ hiển thị nút Add Project nếu user là Founder -->
        <%
            if (AuthUtils.isFounders(session)) {
        %>
        <!-- Search Form -->
        <form action="MainController">
            <input type="hidden" name="action" value="search" />
            Search Startup Projects: <input type="text" name="searchTerm" value="<%=searchTerm%>" />
            <input type="submit" value="Search" />
        </form>
        <br/>
        <form action="MainController">
            <input type="hidden" name="action" value="add" />
            <input type="submit" value="Add New Project" />
        </form>
        <%}%>

        <br/>

        <!-- Hiển thị danh sách dự án -->
        <%
            if (request.getAttribute("sp") != null) {
                List<StartupProjectsDTO> sp = (List<StartupProjectsDTO>) request.getAttribute("sp");

        %>
        <table border="1">
            <thead>
                <tr>
                    <th>Project ID</th>
                    <th>Project Name</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Estimated Launch</th>
                        <% if (AuthUtils.isFounders(session)) { %>
                    <th>Action</th>
                        <% } %>
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
                    <td>
                        <form action="update.jsp" method="post">
                            <input type="hidden" name="project_id" value="<%= s.getProject_id()%>"> 
                            <button type="submit" class="update-btn">
                                <img src="assets/images/Text-Edit-icon.png" style="height: 20px"> Update
                            </button>
                        </form>

                    </td>
                    <% } %>
                </tr>
                <% } %>  
            </tbody>
        </table>
            
        <% } else { %>
        <p>No projects found.</p>
        <% } %>

        <% } else { %>
        <h1>You do not have permission to access this content.</h1>
        <% }%>

    </body>
</html>
