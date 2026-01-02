package alotra.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/loginRedirect", "/registerRedirect", "/contact"})
public class AuthController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath(); // Lấy đường dẫn URL người dùng truy cập

        if (path.equals("/loginRedirect")) {
            req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
            // Chuyển sang trang login.jsp
        } 
        else if (path.equals("/registerRedirect")) {
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
            // Chuyển sang trang register.jsp
        }
        else if (path.equals("/contact")) {
            req.getRequestDispatcher("/WEB-INF/views/contact.jsp").forward(req, resp);
            // Chuyển sang trang register.jsp
        }
	}
}
