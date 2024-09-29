package controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.User;

public class admin_edit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        ServletContext context = getServletContext();
        ArrayList<User> users = (ArrayList<User>) context.getAttribute("users");
        User userToEdit = null;

        // Tìm người dùng theo username
        for (User user : users) {
            if (user.getUsername().equalsIgnoreCase(username)) {
                userToEdit = user;
                break;
            }
        }

        if (userToEdit != null) {
            request.setAttribute("userToEdit", userToEdit);
            request.getRequestDispatcher("edit_admin.jsp").forward(request, response);
        } else {
            response.sendRedirect("admin.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext context = getServletContext();
        ArrayList<User> users = (ArrayList<User>) context.getAttribute("users");

        // Nếu không có danh sách người dùng, khởi tạo mới
        if (users == null) {
            users = new ArrayList<>();
            context.setAttribute("users", users);
        }

        // Lấy dữ liệu từ form
        String username = request.getParameter("username"); // Giữ tên người dùng
        String password = request.getParameter("password");
        String displayname = request.getParameter("displayname");
        String role = request.getParameter("role");

        // Cập nhật thông tin người dùng
        for (User user : users) {
            if (user.getUsername().equalsIgnoreCase(username)) {
                user.setPassword(password); // Cập nhật mật khẩu
                user.setDisplayName(displayname); // Cập nhật tên hiển thị
                user.setRole(role); // Cập nhật vai trò
                break;
            }
        }

        // Lưu danh sách người dùng vào ServletContext
        context.setAttribute("users", users);
        response.sendRedirect("admin.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
