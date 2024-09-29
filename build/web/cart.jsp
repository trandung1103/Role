<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Cart" %>
<%@ page import="model.CartItem" %>
<%@ page import="model.Product" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <link rel="stylesheet" href="css/cart.css?v=1.1"/>
</head>
<body>
    <h1>Your Shopping Cart</h1>

    <%
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.getItems().isEmpty()) {
    %>
        <p>Your cart is empty. <a href="home.jsp">Continue shopping</a>.</p>
    <%
        } else {
    %>
        <table>
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Total</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (CartItem item : cart.getItems()) {
                        Product product = item.getProduct();
                        int quantity = item.getQuantity();
                        double price = product.getProduct_price();
                        double totalItemPrice = quantity * price;
                %>
                    <tr>
                        <td><%= product.getProduct_name() %></td>
                        <td><%= product.getProduct_description() %></td>
                        <td>
                            <form action="CartServlet" method="post">
                                <input type="hidden" name="productId" value="<%= product.getProduct_id() %>">
                                <input type="number" name="quantity" value="<%= quantity %>" min="1">
                                <input type="hidden" name="action" value="update">
                                <button type="submit">Update</button>
                            </form>
                        </td>
                        <td>$<%= price %></td>
                        <td>$<%= totalItemPrice %></td>
                        <td>
                            <form action="CartServlet" method="post">
                                <input type="hidden" name="productId" value="<%= product.getProduct_id() %>">
                                <input type="hidden" name="action" value="remove">
                                <button type="submit">Remove</button>
                            </form>
                        </td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <p><strong>Total Price: $<%= cart.getTotalPrice() %></strong></p>
        <div style="display: flex; flex-flow: column; align-items: center;">
            <form action="CheckoutServlet" method="post">
                <button type="submit" name="action" value="checkout">Proceed to Checkout</button>
            </form>

            <a href="home.jsp"><button>Continue shopping</button></a>
        </div>
        
    <%
        }
    %>
</body>
</html>
