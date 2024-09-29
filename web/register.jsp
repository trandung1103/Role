<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="css/register.css"> <!-- Kết nối file CSS -->
    </head>
    <body>
        <div class="register-container">
            <h2>Register</h2>
            <form action="register" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>

                <label for="displayname">Display Name:</label>
                <input type="text" id="displayname" name="displayname" required>
                
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>     

                <input type="submit" class="register-button" value="Register">

                <!-- Thêm một div để căn giữa -->
                <div class="login-link">
                    <a href="login.jsp">Login now</a>
                </div>
            </form>
        </div>
    </body>
</html>
