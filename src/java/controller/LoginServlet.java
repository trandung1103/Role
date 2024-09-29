//package controller;
//
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import java.io.IOException;
//import model.User;
//import java.util.ArrayList;
//
//public class LoginServlet extends HttpServlet {
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//
//        //get servlet context init paras
//        ServletContext context = getServletContext();
//        ArrayList<User> users = (ArrayList<User>) context.getAttribute("users");
//
//        for (User user : users) {
//            // Kiểm tra điều kiện username và password
//
//            if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
//                HttpSession session = request.getSession();
//                session.setAttribute("user", user);
//                response.sendRedirect("home.jsp");
//                return;
//            }
//        }
//        request.setAttribute("error", "Invalid credentials");
//        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
//        dispatcher.forward(request, response);
//    }
//
//}


package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.User;
import java.util.ArrayList;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Lấy danh sách người dùng từ ServletContext
        ServletContext context = getServletContext();
        ArrayList<User> users = (ArrayList<User>) context.getAttribute("users");

        if (users != null) {
            for (User user : users) {
                // Kiểm tra username và password
                if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    response.sendRedirect("home.jsp");
                    return;
                }
            }
        }

        // Nếu thông tin không hợp lệ, chuyển về trang đăng nhập
        request.setAttribute("error", "Invalid credentials");
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }
}
