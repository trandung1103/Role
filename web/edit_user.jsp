<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Profile</title>
        <link rel="stylesheet" href="css/edit_user.css"> <!-- Kết nối file CSS -->
    </head>
    <body>
        <div class="container">
            <h1>Edit Profile</h1>
            <%
                User user = (User) session.getAttribute("user");
            
                if (user != null) {
            %>
            <form action="update_profile" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="<%= user.getUsername() %>" readonly><br><br>

                <label for="displayName">Display Name:</label>
                <input type="text" id="displayName" name="displayName" value="<%= user.getDisplayName() %>"><br><br>

                <label for="password">Password:</label>
                <div class="password-container">
                    <input type="password" id="password" name="password" required>
                    <span class="eye-icon" onclick="togglePassword()">
                        👁️ <!-- Biểu tượng con mắt -->
                    </span>
                </div><br><br>

                <input type="submit" value="Update">
            </form>
            <%
                } else {
                    response.sendRedirect("login.jsp");
                }
            %>
        </div>

        <script>
            function togglePassword() {
                var passwordInput = document.getElementById("password");
                passwordInput.type = (passwordInput.type === "password") ? "text" : "password";
            }
        </script>
    </body>
</html>
