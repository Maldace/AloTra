package alotra.controllers;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import alotra.models.DTOBillDetailModel;
import alotra.services.UserService;
import alotra.services.impl.UserServiceImpl;

@WebServlet("/bills")
public class ManagerBillController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int userId = 1;
        Date date = null;
        Time time = null;

        List<DTOBillDetailModel> bills = userService.billManager(userId, date, time);

        req.setAttribute("bills", bills);

        req.getRequestDispatcher("/WEB-INF/views/manage-bill.jsp")
           .forward(req, resp);
    }
}
