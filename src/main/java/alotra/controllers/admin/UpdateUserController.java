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
		String userName = req.getParameter("username");
		String fullName = req.getParameter("fullName");
		String passWord = req.getParameter("passWord");
		String avatar = req.getParameter("avatar");
		int roleId = Integer.parseInt(req.getParameter("roleid"));
		String phone = req.getParameter("phone");
		UserModel user = new UserModel();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setUserName(userName);
        user.setPassWord(passWord);
        user.setPhone(phone);
        user.setRoleid(roleId);
        user.setAvatar(avatar);
        UserService userService = new UserServiceImpl();
        userService.updateUser(user);
        req.setAttribute("successMessage", "Đã sửa thành công"); // gửi thông báo sang JSP
        req.getRequestDispatcher("/WEB-INF/views/admin/edituser.jsp").forward(req, resp); // quay lại trang
	}
}
