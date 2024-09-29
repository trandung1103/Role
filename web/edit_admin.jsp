<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit User</title>
        <link rel="stylesheet" href="css/edit_admin.css"> <!-- Kết nối file CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    </head>
    <body>
        <div class="container">
            <h1>Edit User</h1>
            <%
                User userToEdit = (User) request.getAttribute("userToEdit");
                if (userToEdit != null) {
            %>
            <form action="admin_edit" method="post">
                <table>
                    <tr>
                        <td>UserName:</td>
                        <td><input type="text" name="username" value="<%= userToEdit.getUsername() %>" readonly></td>
                    </tr>
                    <tr>
                        <td>PassWord:</td>
                        <td>
                            <div class="password-container">
                                <input type="password" id="password_<%= userToEdit.getUsername() %>" name="password" value="<%= userToEdit.getPassword() %>" required>
                                <span class="eye-icon" onclick="togglePassword('<%= userToEdit.getUsername() %>', this)">
                                    <i class="fas fa-eye-slash"></i> <!-- Biểu tượng mắt ban đầu -->
                                </span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Display Name:</td>
                        <td><input type="text" name="displayname" value="<%= userToEdit.getDisplayName() %>" required></td>
                    </tr>
                    <tr>
                        <td>Role:</td>
                        <td>
                            <input type="radio" name="role" value="admin" <%= userToEdit.getRole().equals("admin") ? "checked" : "" %> required>Admin
                            <input type="radio" name="role" value="user" <%= userToEdit.getRole().equals("user") ? "checked" : "" %> required>User
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="submit">Update</button>
                        </td>
                    </tr>
                </table>
            </form>
            <%
                } else {
            %>
            <p class="error">User not found.</p>
            <%
                }
            %>
            <a href="admin.jsp" class="back-btn">Back to User Management</a>
        </div>
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
    </body>
</html>
