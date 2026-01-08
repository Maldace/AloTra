package alotra.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import alotra.services.UserService;
import alotra.services.impl.UserServiceImpl;

@WebServlet("/forgot")
public class ForgotPasswordController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserService userService = new UserServiceImpl();

    // Hiển thị quên mật khẩu
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

    	req.getRequestDispatcher("/WEB-INF/views/forgot.jsp")
               .forward(req, resp);
    }

    // Xử lý quên mật khẩu
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        UserService userService = new UserServiceImpl();
        boolean changePassword = userService.forgotPassword(username, email, phone, password);
        if(changePassword==true) {
        	req.setAttribute("successMessage", "Đổi mật khẩu thành công. Vui lòng đăng nhập"); // gửi thông báo sang JSP
	        req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp); // quay lại trang
	        return;
        }
        else {
        	req.setAttribute("successMessage", "Đổi mật khẩu thất bại. Vui lòng thử lại"); // gửi thông báo sang JSP
	        req.getRequestDispatcher("/WEB-INF/views/forgot.jsp").forward(req, resp); // quay lại trang
	        return;
        }
    }
}
