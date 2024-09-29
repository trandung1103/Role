package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.User;
import java.util.ArrayList;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = getServletContext();
        ArrayList<User> users = (ArrayList<User>) context.getAttribute("users");

        if (users == null) {
            users = new ArrayList<>();
        }

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String displayName = request.getParameter("displayname");

        User newUser = new User(username, password, "user", displayName);

        // Thêm user vào danh sách và lưu vào context
        users.add(newUser);
        context.setAttribute("users", users);

        response.sendRedirect("login.jsp");
    }
}
