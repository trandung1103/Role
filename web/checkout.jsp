<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Cart" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" href="css/checkout.css">
</head>
<body>
    <h1>Thanh Toán</h1>

    <%
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getItems().isEmpty()) {
    %>
        <p>Giỏ hàng của bạn đang trống. <a href="home.jsp">Tiếp tục mua sắm</a>.</p>
    <%
        } else {
            double totalPrice = cart.getTotalPrice();
    %>
        <form action="CheckoutServlet" method="post">
            <label for="buyerName">Tên người mua:</label>
            <input type="text" name="buyerName" required>

            <label for="phoneNumber">Số điện thoại:</label>
            <input type="text" name="phoneNumber" required>

            <label for="address">Địa chỉ:</label>
            <input type="text" name="address" required>

            <p><strong>Tổng tiền: $<%= totalPrice %></strong></p>

            <input type="hidden" name="totalAmount" value="<%= totalPrice %>">
            <button type="submit" name="action" value="confirm">Thanh Toán</button>
        </form>

        <a href="home.jsp">Tiếp tục mua sắm</a>
    <%
        }
    %>
</body>
</html>
