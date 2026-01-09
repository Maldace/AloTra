package alotra.controllers.admin;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/logout")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    // 1. Lấy session hiện tại
	    jakarta.servlet.http.HttpSession session = req.getSession(false);
	    
	    if (session != null) {
	        // 2. Xóa sạch dữ liệu session
	        session.invalidate();
	    }
	    
	    // 3. Chuyển hướng thẳng về trang chủ (localhost:8082/AloTra/)
	    // Không dùng PrintWriter out nữa nhé
	    resp.sendRedirect(req.getContextPath() + "/");
	}
}