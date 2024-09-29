<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="css/register.css">
    </head>
    <body>
        <div class="register-container">
            <h2>Add new user</h2>
            <form action="add" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>

                <label for="displayname">Display Name:</label>
                <input type="text" id="displayname" name="displayname" required>
                
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required> 
                
                <label for="role">Role:</label>
                <input type="radio" name="role" value="admin" id="admin" required>Admin
                <input type="radio" name="role" value="user" id="user"  required>User

                <input type="submit" class="register-button" value="Add">
            </form>
        </div>
    </body>
</html>
