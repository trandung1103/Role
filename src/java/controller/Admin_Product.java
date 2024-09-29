package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import model.Product;

public class Admin_Product extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Product newProduct = new Product("newId", name, price, quantity, description); // Generate a new ID as needed
        ArrayList<Product> products = (ArrayList<Product>) getServletContext().getAttribute("products");
        if (products == null) {
            products = new ArrayList<>();
        }
        products.add(newProduct);
        getServletContext().setAttribute("products", products);

        response.sendRedirect("admin_product.jsp");
    }
}
