<%-- 
    Document   : user
    Created on : Sep 26, 2024, 1:52:35 PM
    Author     : DUNG TD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>User Profile</title>
        <link rel="stylesheet" href="css/user.css"> <!-- Kết nối file CSS -->
    </head>
    <body>
        <div class="profile-container">
            <h1>User Information</h1>
            <%
                // Lấy thông tin người dùng từ session
                User user = (User) session.getAttribute("user");
                
                // Kiểm tra nếu người dùng không null
                if (user != null) {
            %>
            <table>
                <tr>
                    <th>Username:</th>
                    <td><%= user.getUsername() %></td>
                </tr>
                <tr>
                    <th>Display Name</th>
                    <td><%= user.getDisplayName() %></td>
                </tr>
                <tr>
                    <th>Password</th>
                    <td><%= user.getPassword() %></td>
                </tr>
                <tr>
                    <th>Edit information:</th>
                    <td><a href="edit_user.jsp">Edit Profile</a></td>
                </tr>
            </table>
            <div class="action-links">
                <a href="logout.jsp">Logout</a>
                <a href="home.jsp">Back home</a>
            </div>
            <%
                } else {
                    // Nếu không có thông tin người dùng, chuyển hướng về trang login
                    response.sendRedirect("login.jsp");
                }
            %>
        </div>
    </body>
</html>
