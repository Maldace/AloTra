package alotra.controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "BillController", urlPatterns = {"/bill"})
public class BillController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        switch (path) {
            case "/cart":
                req.getRequestDispatcher("/WEB-INF/views/cart.jsp").forward(req, resp);
                break;
            case "/bill":
                req.getRequestDispatcher("/WEB-INF/views/bills.jsp").forward(req, resp);
                break;
            case "/checkout":
                req.getRequestDispatcher("/WEB-INF/views/checkout.jsp").forward(req, resp);
                break;
            default:
                resp.sendRedirect(req.getContextPath() + "/home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath() + "/bill");
    }
}