package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

public class update_profile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public update_profile() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy session hiện tại
        HttpSession session = request.getSession();
        // Lấy đối tượng user từ session
        User user = (User) session.getAttribute("user");

        // Kiểm tra nếu user không null
        if (user != null) {
            // Lấy dữ liệu từ form edit_profile.jsp
            String displayName = request.getParameter("displayName");
            String password = request.getParameter("password");

            // Kiểm tra nếu displayName và password không null và không rỗng
            if (displayName != null && !displayName.trim().isEmpty() &&
                password != null && !password.trim().isEmpty()) {
                
                // Cập nhật thông tin người dùng
                user.setDisplayName(displayName);
                user.setPassword(password); // Thêm mã hóa mật khẩu nếu cần
                
                // Lưu thông tin người dùng đã cập nhật lại vào session
                session.setAttribute("user", user);
                
                // Chuyển hướng về trang user.jsp sau khi cập nhật thành công
                response.sendRedirect("user.jsp");
            } else {
                // Nếu dữ liệu không hợp lệ, chuyển hướng về trang edit_profile.jsp với thông báo lỗi
                response.sendRedirect("edit_user.jsp?error=invalidInput");
            }
        } else {
            // Nếu không có user trong session, chuyển hướng về trang đăng nhập
            response.sendRedirect("login.jsp");
        }
    }

    // Phương thức doGet để chuyển hướng về trang edit_profile.jsp nếu truy cập qua GET
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            response.sendRedirect("edit_user.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
