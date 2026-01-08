package alotra.controllers.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/admin/redirectEditUser"})
public class RedirectEditUser extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String fullName = req.getParameter("fullName");
		String passWord = req.getParameter("passWord");
		String avatar = req.getParameter("avatar");
		String roleid = req.getParameter("roleid");
		String phone = req.getParameter("phone");
		req.setAttribute("username", username);
		req.setAttribute("email", email);
		req.setAttribute("fullName", fullName);
		req.setAttribute("passWord", passWord);
		req.setAttribute("avatar", avatar);
		req.setAttribute("roleid", roleid);
		req.setAttribute("phone", phone);
		req.getRequestDispatcher("/WEB-INF/views/admin/edituser.jsp").forward(req, resp); // quay lại trang
	}
}
