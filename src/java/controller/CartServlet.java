package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.Cart;
import model.CartItem;
import model.Product;
import java.util.ArrayList;

public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        // Lấy giỏ hàng của user từ session
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        String productId = request.getParameter("productId");
        ArrayList<Product> products = (ArrayList<Product>) getServletContext().getAttribute("products");
        Product product = null;

        // Tìm sản phẩm từ danh sách sản phẩm có sẵn
        for (Product p : products) {
            if (p.getProduct_id().equals(productId)) {
                product = p;
                break;
            }
        }

        int pro=product.getProduct_quantity();
        
        if (action.equals("add")) {
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            CartItem cartItem = new CartItem(product, quantity);
            cart.addItem(cartItem);
            pro=product.getProduct_quantity();
            product.setProduct_quantity(product.getProduct_quantity()-quantity);
            
        } else if (action.equals("update")) {
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            // Tìm sản phẩm trong giỏ hàng và cập nhật số lượng
            for (CartItem item : cart.getItems()) {
                if (item.getProduct().getProduct_id().equals(productId)) {
                    item.setQuantity(quantity);
                    product.setProduct_quantity(pro-quantity);// Cập nhật số lượng
                    break;
                }
            }
        } else if (action.equals("remove")) {
            CartItem itemToRemove = null;
            for (CartItem item : cart.getItems()) {
                if (item.getProduct().getProduct_id().equals(productId)) {
                    itemToRemove = item;
                    break;
                }
            }
            if (itemToRemove != null) {
                cart.removeItem(itemToRemove);
                product.setProduct_quantity(pro);
            }
        }
        response.sendRedirect("cart.jsp");
    }
}
