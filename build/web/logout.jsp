<%-- 
    Document   : logout
    Created on : Sep 26, 2024, 2:55:58 PM
    Author     : DUNG TD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
    session.invalidate(); // Đăng xuất
    response.sendRedirect("home.jsp");
        %>
    </body>
</html>
