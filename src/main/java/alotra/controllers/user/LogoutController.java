package alotra.controllers.user;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/user/logout")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    resp.setContentType("text/html");
	    PrintWriter out = resp.getWriter();

	    // Lấy session hiện tại, không tạo session mới nếu không có
	    var session = req.getSession(false);
	    if (session != null) {
	        System.out.println("Session before invalidate: " + session);
	        session.invalidate();
	        System.out.println("Session after invalidate: " + req.getSession(false));
	        out.println("Thank you! You are successfully logged out.");
	    } else {
	        out.println("No session found. Please login first.");
	    }
	    out.close();
	}
}
