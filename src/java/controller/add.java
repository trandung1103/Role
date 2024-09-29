package controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import model.User;

public class add extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        ServletContext context = getServletContext();
        
        // Lấy danh sách người dùng từ ServletContext, nếu chưa có thì khởi tạo
        ArrayList<User> users = (ArrayList<User>) context.getAttribute("users");
        if (users == null) {
            users = new ArrayList<>(); // Nếu chưa có danh sách, khởi tạo mới
//            users.add(new User("dung", "12345", "admin", "TD"));
//            context.setAttribute("users", users);
        }

        // Lấy thông tin từ form đăng ký
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String displayName = request.getParameter("displayname");
        String role = request.getParameter("role");
        // Kiểm tra xem username có tồn tại chưa
        boolean userExists = false;
        for (User user : users) {
            if (user.getUsername().equals(username)) {
                userExists = true;
                break;
            }
        }

        // Nếu username chưa tồn tại, tạo người dùng mới
        if (!userExists) {
            
            // Tạo đối tượng User mới với role "user"
            User newUser = new User(username, password, role, displayName);

            // Thêm người dùng mới vào danh sách
            users.add(newUser);

            // Lưu danh sách người dùng vào ServletContext
            context.setAttribute("users", users);

            // Chuyển hướng đến trang admin sau khi đăng ký thành công
            response.sendRedirect("admin.jsp");
        } else {
            // Nếu username đã tồn tại, thông báo lỗi và chuyển hướng lại trang đăng ký
            request.setAttribute("message", "Username already exists.");
            request.getRequestDispatcher("admin_add.jsp").forward(request, response);
        }
    }
}
