//package controller;
//
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import java.io.IOException;
//import model.Cart;
//import model.CartItem;
//import java.util.ArrayList;
//
//public class CheckoutServlet extends HttpServlet {
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String action = request.getParameter("action");
//        String buyerName = request.getParameter("buyerName");
//        String phoneNumber = request.getParameter("phoneNumber");
//        String address = request.getParameter("address");
//        String totalAmount = request.getParameter("totalAmount");
//
//        // Lấy giỏ hàng
//        Cart cart = (Cart) request.getSession().getAttribute("cart");
//        StringBuilder orderDetails = new StringBuilder();
//
//        if (cart != null) {
//            for (CartItem item : cart.getItems()) {
//                String productName = item.getProduct().getProduct_name();
//                int quantity = item.getQuantity();
//                orderDetails.append(productName).append(",").append(quantity);
//            }
//        }
//
//        // Lưu thông tin đơn hàng vào danh sách
//        String order = buyerName + "," + phoneNumber + "," + address + "," + orderDetails.toString() + "," + totalAmount ;
//        ArrayList<String> orders = (ArrayList<String>) getServletContext().getAttribute("orders");
//        if (orders == null) {
//            orders = new ArrayList<>();
//            getServletContext().setAttribute("orders", orders);
//        }
//        orders.add(order);
//
//        // Thông báo thanh toán thành công
//        request.setAttribute("successMessage", "Thanh toán thành công!");
//        if (action.equals("checkout")){
//            RequestDispatcher dispatcher = request.getRequestDispatcher("checkout.jsp");
//            dispatcher.forward(request, response);
//        }
//        else if (action.equals("confirm")){
//            request.getSession().removeAttribute("cart");
//            RequestDispatcher dispatcher = request.getRequestDispatcher("orderConfirmation.jsp");
//            dispatcher.forward(request, response);
//        }
//        
//    }
//}
package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.Cart;
import model.CartItem;
import java.util.ArrayList;
import java.time.LocalDateTime;  // Import LocalDateTime
import java.time.format.DateTimeFormatter; // Import DateTimeFormatter

public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String buyerName = request.getParameter("buyerName");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String totalAmount = request.getParameter("totalAmount");

        // Lấy giỏ hàng
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        StringBuilder orderDetails = new StringBuilder();

        if (cart != null) {
            for (CartItem item : cart.getItems()) {
                String productName = item.getProduct().getProduct_name();
                int quantity = item.getQuantity();
                orderDetails.append(productName).append(",").append(quantity); // Thêm dấu chấm phẩy để phân cách các mặt hàng
            }
        }

        // Lấy thời gian thanh toán hiện tại
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"); // Định dạng ngày giờ
        String formattedDateTime = now.format(formatter);
        String[] orderTime = formattedDateTime.split("\\s");

        // Lưu thông tin đơn hàng vào danh sách
        String order = buyerName + "," + phoneNumber + "," + address + "," + orderDetails.toString() + "," + totalAmount + "," + orderTime[1] + "," + orderTime[0]; // Thêm ngày giờ vào đơn hàng
        ArrayList<String> orders = (ArrayList<String>) getServletContext().getAttribute("orders");
        if (orders == null) {
            orders = new ArrayList<>();
            getServletContext().setAttribute("orders", orders);
        }
        orders.add(order);

        // Thông báo thanh toán thành công
        request.setAttribute("successMessage", "Thanh toán thành công!");
        if (action.equals("checkout")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("checkout.jsp");
            dispatcher.forward(request, response);
        } else if (action.equals("confirm")) {
            request.getSession().removeAttribute("cart");
            RequestDispatcher dispatcher = request.getRequestDispatcher("orderConfirmation.jsp");
            dispatcher.forward(request, response);
        }
    }
}
