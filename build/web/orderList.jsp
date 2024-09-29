<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Đơn Hàng</title>
</head>
<body>
    <h1>Danh Sách Đơn Hàng</h1>

    <%
        ArrayList<String> orders = (ArrayList<String>) request.getServletContext().getAttribute("orders");
        if (orders == null || orders.isEmpty()) {
    %>
        <p>Chưa có đơn hàng nào.</p>
    <%
        } else {
    %>
    <table border="1">
        <thead>
            <tr>
                <th>Tên người mua</th>
                <th>Số điện thoại</th>
                <th>Địa chỉ</th>
                <th>Tên sản phẩm</th>
                <th>Số lượng</th>
                <th>Tổng tiền</th>
                <th>Giờ thanh toán</th>
                <th>Ngày thanh toán</th>
                
            </tr>
        </thead>
        <tbody>
            <%
                for (String order : orders) {
                    String[] orderDetails = order.split(",");
                    if (!orderDetails[0].equalsIgnoreCase("null")){
            %>
            <tr>
                <td><%= orderDetails[0] %></td>
                <td><%= orderDetails[1] %></td>
                <td><%= orderDetails[2] %></td>
                <td><%= orderDetails[3] %></td>
                <td><%= orderDetails[4] %></td>
                <td>$<%= orderDetails[5] %></td>
                <td><%= orderDetails[6] %></td>
                <td><%= orderDetails[7] %></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
    <%
        }
    %>

    <a href="home.jsp">Trở về trang chủ</a>
</body>
</html>
