<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User, model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shop DDT - Home</title>
        <link rel="stylesheet" href="css/home.css?v=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        <header>

            <div class="header-container">
                <h1>Shop DDT</h1>
                <form action="search.jsp" method="get" class="search-form">
                    <input type="text" name="query" placeholder="Search products..." required>
                    <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
                <div class="auth-links">
                    <%
                    User user = (User) session.getAttribute("user");
                    if (user == null) {
                    %>
                    <a href="login.jsp">Login</a>
                    <a href="register.jsp">Register</a>
                    <%
                    } else { 
                    %>
                    <a href="user.jsp"><i class="fa-solid fa-user"></i><%= user.getDisplayName() %></a>
                    <a href="cart.jsp"><i class="fa-solid fa-shopping-cart"></i></a>
                    <a href="orderList.jsp"><i class="fa-solid fa-clipboard-list"></i></a>
                    <a href="logout.jsp"><i class="fa-solid fa-right-from-bracket"></i></a>                   
                        <% 
                        if ("admin".equals(user.getRole())) { 
                        %>
                    <br><a href="admin.jsp"><i class="fa-solid fa-sliders"></i></a>
                        <% 
                            }
                        } 
                        %>
                </div>
            </div>
        </header>




        <main>
            <h2>Products</h2>
            <%
                ArrayList<Product> products = (ArrayList<Product>) getServletContext().getAttribute("products");
                if (products != null && !products.isEmpty()) {
                    for (Product product : products) {
            %>
            <div class="product">
                <h3><%= product.getProduct_name() %></h3>
                <p>Price: $<%= product.getProduct_price() %></p>
                <p><%= product.getProduct_description() %></p>
                <%
                    if(product.getProduct_quantity()>0){
                %>
                <p>Available Stock:<%= product.getProduct_quantity() %></p>
                <%} else {%>
                <p style="color:red;">Out of stock!!!</p>
                <%}%>


                <form action="CartServlet" method="post">
                    <input type="hidden" name="productId" value="<%= product.getProduct_id() %>">

                    <input type="number" name="quantity" value="1" min="" max="<%=product.getProduct_quantity()%>">
                    <% if (user == null) {
                        if(product.getProduct_quantity()>0){
                    %>
                    <a href="login.jsp">Add</a>
                    <%  
                        }
                    } else { 
                        if(product.getProduct_quantity()>0){ %>
                    <button type="submit" name="action" value="add">
                        <i class="fa-solid fa-shopping-cart"></i>
                    </button>
                    <%}  if ("admin".equals(user.getRole())) { %>
                    <a href="admin_product.jsp?productId=<%= product.getProduct_id() %>">
                        <i class="fa-solid fa-pen-to-square"></i>
                    </a>
                    <% } %>

                    <% } %>
                </form>
            </div>
            <%
                    }
                }
            %>
        </main>




        <footer>
            <p>&copy; 2024 Shop DDT. All rights reserved.</p>
        </footer>
    </body>
</html>
