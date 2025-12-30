package alotra.controllers;

import java.io.IOException;

import alotra.models.DTOProductModel;
import alotra.services.ProductService;
import alotra.services.impl.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/product"})
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String productName = req.getParameter("name");
    	String quantityStr = req.getParameter("quantity");
    	ProductService productService = new ProductServiceImpl();
    	DTOProductModel productDetail = productService.getProductDetail(productName);
    	int quantity = Integer.parseInt(quantityStr);
    	double itemTotal = productDetail.getPrice() * quantity;
    	HttpSession session = req.getSession();
    	Double totalPrice = (Double) session.getAttribute("price");
    	if (totalPrice == null) {
    		totalPrice = 0.0;
        }
    	totalPrice = totalPrice + itemTotal;
    	session.setAttribute("price", totalPrice);
    	session.setAttribute("name", productDetail.getName());
    	resp.sendRedirect("home");
    }

}