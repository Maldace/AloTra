package alotra.controllers.admin;

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

@WebServlet(urlPatterns = {"/admin/home"})
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	ProductService productService = new ProductServiceImpl();
        List<DTOProductModel> allProduct = productService.displayAllProduct();
        req.setAttribute("listProdut", allProduct);
        req.getRequestDispatcher("/WEB-INF/views/admin/home.jsp").forward(req, resp);
    }
}