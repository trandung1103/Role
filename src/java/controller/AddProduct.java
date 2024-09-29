package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.Product;
import java.util.ArrayList;

public class AddProduct extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = getServletContext();
        ArrayList<Product> products = (ArrayList<Product>) context.getAttribute("products");

        if (products == null) {
            products = new ArrayList<>();
        }

        String id = request.getParameter("product_id");
        String name = request.getParameter("product_name");
        double price = Double.parseDouble(request.getParameter("product_price"));
        int quantity = Integer.parseInt(request.getParameter("product_quantity"));
        String description = request.getParameter("description");
        Product newPro = new Product(id, name, price,quantity, description);

        // Thêm user vào danh sách và lưu vào context
        products.add(newPro);
        context.setAttribute("products", products);

        response.sendRedirect("cart.jsp");
    }
}
