<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%@ page session="true" %>

<%
User user = (User) session.getAttribute("user");
if (user != null) {
    String productName = request.getParameter("productName");
    user.getCart().removeItem(productName); // Xóa sản phẩm khỏi giỏ hàng
    response.sendRedirect("cart.jsp"); // Chuyển hướng về trang giỏ hàng
} else {
    response.sendRedirect("login.jsp"); // Chuyển hướng đến trang login nếu người dùng chưa đăng nhập
}
%>
