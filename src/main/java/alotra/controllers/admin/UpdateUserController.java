package alotra.controllers.admin;

import java.io.IOException;
import java.sql.Date;

import alotra.models.UserModel;
import alotra.services.UserService;
import alotra.services.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/admin/updateUser"})
public class UpdateUserController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String userName = req.getParameter("userName");
		String fullName = req.getParameter("fullName");
		String passWord = req.getParameter("passWord");
		String avatar = req.getParameter("avatar");
		int roleId = Integer.parseInt(req.getParameter("roleId"));
		String phone = req.getParameter("phone");
		Date createdDate = new Date(System.currentTimeMillis());
		UserModel user = new UserModel();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setUserName(userName);
        user.setPassWord(passWord);
        user.setPhone(phone);
        user.setRoleid(roleId);
        user.setCreatedDate(createdDate);
        user.setAvatar(avatar);
        UserService userService = new UserServiceImpl();
        userService.updateUser(user);
	}
}
