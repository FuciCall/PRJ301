<%--<%@page import="org.apache.catalina.User"%>
<%@page import="dto.ProjectDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project Dashboard</title>

        <style>
            .project-table {
                width: 100%;
                border-collapse: collapse;
                margin: 25px 0;
                font-size: 14px;
                font-family: Arial, sans-serif;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            }

            .project-table thead th {
                background-color: #009879;
                color: #ffffff;
                text-align: left;
                font-weight: bold;
                padding: 12px 15px;
            }

            .project-table tbody tr {
                border-bottom: 1px solid #dddddd;
            }

            .project-table tbody tr:nth-of-type(even) {
                background-color: #f3f3f3;
            }

            .project-table tbody tr:last-of-type {
                border-bottom: 2px solid #009879;
            }

            .project-table tbody td {
                padding: 12px 15px;
            }

            .project-table tbody tr:hover {
                background-color: #f5f5f5;
                transition: 0.3s ease;
            }

            /* Responsive design */
            @media screen and (max-width: 600px) {
                .project-table {
                    font-size: 12px;
                }

                .project-table thead th,
                .project-table tbody td {
                    padding: 8px 10px;
                }
            }
        </style> 
    </head>
    <body> 
        <%@include file="header.jsp" %>
        <div style="min-height: 500px; padding: 10px">
            <%                if (session.getAttribute("user") != null) {
                    UserDTO user = (UserDTO) session.getAttribute("user");
            %>
            <h1> Welcome <%= user.getName() %> </h1>
            <form action="MainController">
                <input type="hidden" name="action" value="logout"/>
                <input type="submit" value="Logout"/>
            </form>

            <br/>

            <%
                String searchTerm = request.getAttribute("searchTerm") != null ? request.getAttribute("searchTerm").toString() : "";
            %>
            <form action="MainController">
                <input type="hidden" name="action" value="search"/>
                Search Projects: <input type="text" name="searchTerm" value="<%= searchTerm %>"/>
                <input type="submit" value="Search"/>
            </form>

            <a href="projectForm.jsp">Add Project</a>

            <%
                if (request.getAttribute("books") != null) {
                    List<ProjectDTO> projects = (List<ProjectDTO>) request.getAttribute("books");
            %>
            <table class="project-table">
                <thead>
                    <tr>
                        <th>Project ID</th>
                        <th>Project Name</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Estimated Launch</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        for (ProjectDTO project : projects) {
                    %>
                    <tr>
                        <td><%= project.getProject_id() %></td>
                        <td><%= project.getProject_name() %></td>
                        <td><%= project.getDescription() %></td>
                        <td><%= project.getStatus() %></td>
                        <td><%= project.getEstimated_launch() %></td>
                        <td>
                            <a href="MainController?action=delete&id=<%= project.getProject_id() %>&searchTerm=<%= searchTerm %>">
                                <img src="assets/images/delete-icon.png" style="height: 25px"/>
                            </a>
                        </td>
                    </tr>
                    <% 
                        }
                    %>
                </tbody>
            </table>
            <% 
                } else {
                    out.println("<p>No projects found.</p>");
                }
            } else { 
            %>
            <p>You do not have permission to access this content.</p>
            <% 
            } 
            %>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>--%>

<%-- 
    Document   : search
    Created on : Feb 13, 2025, 11:27:20 AM
    Author     : tungi
--%>

<%@page import="dto.ProjectDTO"%>
<%@page import="java.awt.print.Book"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-16WWW">
        <title>JSP Page</title>

        <style>
            .book-table {
                width: 100%;
                border-collapse: collapse;
                margin: 25px 0;
                font-size: 14px;
                font-family: Arial, sans-serif;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            }

            .book-table thead th {
                background-color: #009879;
                color: #ffffff;
                text-align: left;
                font-weight: bold;
                padding: 12px 15px;
            }

            .book-table tbody tr {
                border-bottom: 1px solid #dddddd;
            }

            .book-table tbody tr:nth-of-type(even) {
                background-color: #f3f3f3;
            }

            .book-table tbody tr:last-of-type {
                border-bottom: 2px solid #009879;
            }

            .book-table tbody td {
                padding: 12px 15px;
            }

            .book-table tbody tr:hover {
                background-color: #f5f5f5;
                transition: 0.3s ease;
            }

            /* Responsive design */
            @media screen and (max-width: 600px) {
                .book-table {
                    font-size: 12px;
                }

                .book-table thead th,
                .book-table tbody td {
                    padding: 8px 10px;
                }
            }
        </style> 
    </head>
    <body> 
        <%@include file="header.jsp" %>
        <div style="min-height: 500px; padding: 10px">
            <%                if (session.getAttribute("user") != null) {
                    UserDTO user = (UserDTO) session.getAttribute("user");
            %>
            <h1> Welcome <%=user.getName()%> </h1>
            <form action="MainController">
                <input type="hidden" name="action" value="logout"/>
                <input type="submit" value="Logout"/>
            </form>

            <br/>
            
            <%
                String searchTerm = request.getAttribute("searchTerm")+"";
                searchTerm= searchTerm.equals("null")?"":searchTerm;
            %>
            <form action="MainController">
                <input type="hidden" name="action" value="search"/>
                Search Books: <input type="text" name="searchTerm" value="<%=searchTerm%>"/>
                <input type="submit" value="Search"/>
            </form>

            <%
                if (request.getAttribute("books") != null) {
                    List<ProjectDTO> books = (List<ProjectDTO>) request.getAttribute("books");

            %>
            <table class="book-table">
                <thead>
                    <tr>
                        <th>project_id</th>
                        <th>project_name</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>estimated_launch</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%            for (ProjectDTO b : books) {
                    %>
                    <tr>
                         <td>${project.project_id}</td>
                <td>${project.project_name}</td>
                <td>${project.description}</td>
                <td>${project.status}</td>
                <td>${project.estimated_launch}</td>
                <td>
                    <form action="MainController" method="post">
                        <input type="hidden" name="action" value="delete"/>
                        <input type="hidden" name="id" value="${project.project_id}"/>
                        <input type="submit" value="Delete"/>
                    </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%    }
            } else { %>
            You do not have permission to access this content.
            <%}%>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>                        
