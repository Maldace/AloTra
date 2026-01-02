package alotra.controllers;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import alotra.models.UserModel;
import alotra.services.UserService;
import alotra.services.impl.UserServiceImpl;

@WebServlet("/user-manager")
public class ManagerUserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<UserModel> users = userService.getAllUser();

        req.setAttribute("users", users);
        req.getRequestDispatcher("/WEB-INF/views/user-manager.jsp")
           .forward(req, resp);
    }
}
