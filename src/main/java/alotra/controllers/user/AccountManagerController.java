package alotra.controllers.user;

import java.io.IOException;

import alotra.models.UserModel;
import alotra.services.UserService;
import alotra.services.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/user/accountManager"})
public class AccountManagerController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("name");
		UserService userService = new UserServiceImpl();
		UserModel user = userService.findByUserName(username);
		req.setAttribute("user", user);
		req.getRequestDispatcher("/WEB-INF/views/user/profile.jsp").forward(req, resp);
	}
}
