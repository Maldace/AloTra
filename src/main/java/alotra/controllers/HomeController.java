package alotra.controllers;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import alotra.models.DTOProductModel;
import alotra.services.ProductService;
import alotra.services.impl.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/home"})
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        List<DTOProductModel> list = null;
        try {
            list = productService.displayAllProduct(); 
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (list == null) {
            list = Collections.emptyList();
        }
        HttpSession session = req.getSession();
        Double price = (Double) session.getAttribute("price");
        String name = (String) session.getAttribute("name");
        req.setAttribute("price", price);
        req.setAttribute("name", name);
        req.setAttribute("products", list);
        req.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.sendRedirect(req.getContextPath() + "/home");
    }
}