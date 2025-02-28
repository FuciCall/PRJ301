<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Painting Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: #f4f4f4;
                text-align: center;
            }
            .container {
                width: 60%;
                margin: 50px auto;
                background: white;
                padding: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                border-radius: 10px;
            }
            h1 {
                color: #333;
            }
            .search-box {
                margin: 20px 0;
            }
            input[type="text"] {
                width: 70%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
            }
            input[type="submit"] {
                background: #3498db;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }
            input[type="submit"]:hover {
                background: #2980b9;
            }
            table {
                width: 100%;
                margin-top: 20px;
                border-collapse: collapse;
                background: white;
                border-radius: 10px;
                overflow: hidden;
            }
            th, td {
                padding: 12px;
                border-bottom: 1px solid #ddd;
                text-align: center;
            }
            th {
                background: #2c3e50;
                color: white;
            }
            tr:nth-child(even) {
                background: #f2f2f2;
            }
            .logout {
                display: inline-block;
                margin-top: 10px;
                text-decoration: none;
                background: #e74c3c;
                color: white;
                padding: 8px 15px;
                border-radius: 5px;
                font-weight: bold;
            }
            .logout:hover {
                background: #c0392b;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Welcome ${sessionScope.account.fullName}!</h1>
            <a class="logout" href="MainController?action=Logout">Logout</a>

            <div class="search-box">
                <form action="MainController">
                    <input type="text" name="txtSearch" placeholder="Search for..." required />
                    <input type="submit" name="action" value="Search" />
                </form>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>ID</th>
                        <th>Description</th>
                        <th>Height</th>
                        <th>Width</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.LIST_RESULT}" var='p'>
                        <tr>
                            <td> ${p.id} </td>
                            <td> ${p.description} </td>
                            <td> ${p.height} </td>
                            <td> ${p.width} </td>
                            <td> ${p.price} </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
