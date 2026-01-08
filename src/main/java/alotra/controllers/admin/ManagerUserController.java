package alotra.controllers.admin;

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

@WebServlet("/admin/userManager")
public class ManagerUserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserService userService = new UserServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<UserModel> users = userService.getAllUser();

        req.setAttribute("users", users);
        req.getRequestDispatcher("/WEB-INF/views/admin/customerlist.jsp")
           .forward(req, resp);
    }
}
