<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.User" %>
<%@ page import="java.util.ArrayList" %>
<%
    // Lấy danh sách user từ request attribute
    ArrayList<User> users = (ArrayList<User>) getServletContext().getAttribute("users");
    String message = (String) getServletContext().getAttribute("message");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin - User Management</title>
        <link rel="stylesheet" href="css/admin.css"> <!-- Kết nối file CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    </head>
    <body>
        <div class="container">
            <h1>User Management</h1>
            <%
                if (users != null && !users.isEmpty()) {
            %>
            <table>
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Display Name</th>
                        <th>Password</th>
                        <th>Role</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (User user : users) {
                    %>
                    <tr>
                        <td><%= user.getUsername() %></td>
                        <td><%= user.getDisplayName() %></td>
                        <td>
                            <div class="password-container">
                                <input style="border: none;" type="password" id="password_<%= user.getUsername() %>" name="password" value="<%= user.getPassword() %>" required>
                                <span class="eye-icon" onclick="togglePassword('<%= user.getUsername() %>', this)">
                                    <i class="fas fa-eye-slash"></i> <!-- Biểu tượng mắt ban đầu -->
                                </span>
                            </div>
                        </td>


                        <td><%= user.getRole() %></td>
                        <td>
                            <a href="admin_edit?username=<%= user.getUsername() %>" class="edit-btn"><i class="fa-solid fa-pen-to-square"></i></a>
                            <%
                            if (user.getRole().equalsIgnoreCase("user")) {
                            %>
                            <a href="delete?index=<%= user.getUsername() %>" class="delete-btn"><i class="fa-solid fa-user-minus"></i></a>
                            <% } %>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%
                } else {
                    if (message != null) {
            %>
            <p class="message"><%= message %></p>
            <%
                    }
                }
            %>
            <div class="button-container">
                <a href="admin_add.jsp" class="back-btn"><button ><i class="fa-solid fa-user-plus"></i>Add new user</button></a>
                <br>
                <a href="home.jsp" class="back-btn"><button >Back to Home</button></a>
            </div>
        </div>

    </body>
</html>

<script>
    function togglePassword(username, icon) {
        var passwordInput = document.getElementById("password_" + username);
        if (passwordInput.type === "password") {
            passwordInput.type = "text"; 
            icon.innerHTML = '<i class="fas fa-eye"></i>';
        } else {
            passwordInput.type = "password";
            icon.innerHTML = '<i class="fas fa-eye-slash"></i>';
        }
    }


</script>