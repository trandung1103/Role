package listener;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import model.User;
import java.util.ArrayList;
import model.Product;

@WebListener
public class AppContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Lấy ServletContext
        ServletContext context = sce.getServletContext();

        // Khởi tạo danh sách người dùng
        ArrayList<User> users = new ArrayList<>();

        // Lấy các giá trị init parameters từ web.xml
        String u = context.getInitParameter("username");
        String p = context.getInitParameter("password");
        String r = context.getInitParameter("role");
        String d = context.getInitParameter("displayname");

        if (u != null && p != null && r != null && d != null) {
            users.add(new User(u, p, r, d));
        }

        // Lưu danh sách người dùng vào ServletContext
        context.setAttribute("users", users);

        ArrayList<Product> products = (ArrayList<Product>) context.getAttribute("products");

        if (products == null) {
            products = new ArrayList<>();
        }
        products.add(new Product("1", "Lego", 22.99, 10, "Good for kids"));
        products.add(new Product("2", "Robot Toy", 15.50, 20, "Interactive robot toy"));
        products.add(new Product("3", "Doll", 12.99, 15, "Cute and soft doll"));
        products.add(new Product("4", "Building Blocks", 18.75, 12, "Creative building blocks"));
        products.add(new Product("5", "Action Figure", 25.00, 8, "Superhero action figure"));
        products.add(new Product("6", "Puzzle", 10.50, 25, "Fun and educational puzzle"));
        products.add(new Product("7", "Toy Car", 9.99, 30, "Fast toy car for racing"));
        products.add(new Product("8", "Stuffed Animal", 14.99, 18, "Soft and cuddly stuffed animal"));
        products.add(new Product("9", "Musical Instrument Toy", 19.99, 10, "Fun musical instrument for kids"));
        products.add(new Product("10", "Art Supplies", 11.50, 22, "Colorful art supplies for kids"));
        products.add(new Product("11", "Kite", 7.50, 14, "Colorful kite for outdoor fun"));
        products.add(new Product("12", "Board Game", 29.99, 5, "Family board game for fun nights"));
        context.setAttribute("products", products);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Xử lý khi ứng dụng bị dừng
    }
}
