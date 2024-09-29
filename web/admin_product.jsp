<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <style>
        * {
            box-sizing: border-box; /* Include padding and border in element's total width and height */
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Ensure the body takes full height */
        }
        header {
            text-align: center;
            margin-bottom: 20px;
        }
        h1 {
            color: #4CAF50; /* Green */
        }
        main {
            flex: 1; /* Allow main content to grow */
            padding: 20px;
        }
        table {
            width: 50%;
            margin: auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #4CAF50; /* Green */
            color: white;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="number"], textarea {
            width: calc(100% - 20px); /* Adjust for padding */
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            padding: 10px 15px;
            background-color: #4CAF50; /* Green */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%; /* Make button fill the width */
        }
        button:hover {
            background-color: #45a049; /* Darker Green */
        }
        footer {
            background-color: #4CAF50; /* Green background */
            color: white;
            text-align: center;
            padding: 10px 0;
            position: relative; /* Keep footer in flow */
        }
    </style>
</head>
<body>
    <header>
        <h1>Edit Product</h1>
    </header>

    <main>
        <%
            String productId = request.getParameter("productId");
            ArrayList<Product> products = (ArrayList<Product>) getServletContext().getAttribute("products");
            Product productToEdit = null;

            if (products != null) {
                for (Product product : products) {
                    if (product.getProduct_id().equals(productId)) {
                        productToEdit = product;
                        break;
                    }
                }
            }

            if (productToEdit != null) {
        %>
            <form action="UpdateProductServlet" method="post">
                <input type="hidden" name="productId" value="<%= productToEdit.getProduct_id() %>">
                <table>
                    <tr>
                        <th>Field</th>
                        <th>Value</th>
                    </tr>
                    <tr>
                        <td><label for="name">Product Name:</label></td>
                        <td><input type="text" name="name" value="<%= productToEdit.getProduct_name() %>" required></td>
                    </tr>
                    <tr>
                        <td><label for="price">Price:</label></td>
                        <td><input type="number" name="price" value="<%= productToEdit.getProduct_price() %>" required></td>
                    </tr>
                    <tr>
                        <td><label for="description">Description:</label></td>
                        <td><textarea name="description" required><%= productToEdit.getProduct_description() %></textarea></td>
                    </tr>
                    <tr>
                        <td><label for="quantity">Quantity:</label></td>
                        <td><input type="number" name="quantity" value="<%= productToEdit.getProduct_quantity() %>" required></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center;">
                            <button type="submit">Update Product</button>
                        </td>
                    </tr>
                </table>
            </form>
        <%
            } else {
        %>
            <p style="color: red; text-align: center;">Product not found!</p>
        <%
            }
        %>
    </main>

    <footer>
        <p>&copy; 2024 Shop DDT. All rights reserved.</p>
    </footer>
</body>
</html>
