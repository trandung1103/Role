<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác Nhận Đơn Hàng</title>
</head>
<body>
    <h1>Xác Nhận Đơn Hàng</h1>
    
    <%
        String successMessage = (String) request.getAttribute("successMessage");
        if (successMessage != null) {
    %>
        <p><%= successMessage %></p>
    <%
        }
    %>
    
    <a href="home.jsp">Trở về trang chủ</a>
</body>
</html>
