package alotra.controllers;

import java.io.IOException;
import java.sql.Date;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import alotra.models.UserModel;
import alotra.services.UserService;
import alotra.services.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService = new UserServiceImpl();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Mở form đăng ký
        request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Thiết lập tiếng Việt cho dữ liệu từ form
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String phone = request.getParameter("phone");
        String avatar = request.getParameter("avatar");

        // 1. Kiểm tra password với confirmPassword
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu không khớp!");
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
            return;
        }

        // 2. Tạo đối tượng User
        UserModel user = new UserModel();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setUserName(username);
        user.setPassWord(password);
        user.setPhone(phone);
        user.setRoleid(2); // Mặc định role user = 2
        user.setCreatedDate(new Date(System.currentTimeMillis()));
        user.setAvatar(avatar);

        // 3. Thêm user vào database
        try {
            userService.addUser(user);
            // 4. QUAN TRỌNG: Đăng ký xong thì đuổi về trang Đăng nhập
            response.sendRedirect(request.getContextPath() + "/loginRedirect");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đăng ký thất bại: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
        }
    }
}