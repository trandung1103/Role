<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="css/login.css"> <!-- Kết nối file CSS -->
    </head>
    <body>
        <div class="login-container">
            <h2>Login</h2>
            <form action="login" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required><br>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required><br>

                <input type="submit" value="Login" class="login-button">
            </form>
            <div class="login-link">
                <span class="forgot-password-link">
                    <a href="forgot_password.jsp">Forgot Password?</a>
                </span>
                <br> <!-- Thêm dòng mới để cách ly khỏi liên kết đăng ký -->
                <a href="register.jsp" class="register-link">Register now</a>
            </div>
        </div>
    </body>
</html>
