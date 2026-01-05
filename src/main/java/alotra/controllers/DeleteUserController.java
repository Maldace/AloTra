package alotra.controllers;

import java.io.IOException;

import alotra.services.UserService;
import alotra.services.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteUserController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName = req.getParameter("userName");
		UserService userService = new UserServiceImpl();
        userService.deleteUser(userName);
	}
}
