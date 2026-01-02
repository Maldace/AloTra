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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/views/auth/forgot.jsp")
               .forward(request, response);
    }

    // Xử lý quên mật khẩu
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("userName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");

        if (username == null || username.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || phone == null || phone.trim().isEmpty()
                || password == null || password.trim().isEmpty()) {

            req.setAttribute("msg", "Vui lòng nhập đầy đủ thông tin!");
            req.getRequestDispatcher("/WEB-INF/views/auth/forgot.jsp")
                   .forward(req, response);
            return;
        }

        String result;
        try {
            result = userService.forgotPassword(
                    username.trim(),
                    email.trim(),
                    phone.trim(),
                    password
            );
        } catch (Exception e) {
            result = "Lỗi hệ thống, vui lòng thử lại!";
        }

        req.setAttribute("msg", result);
        req.getRequestDispatcher("/WEB-INF/views/auth/forgotResult.jsp").forward(req, response);
    }
}
