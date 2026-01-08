package alotra.controllers.admin;

import java.io.IOException;
import java.util.List;

import alotra.models.DTOProductModel;
import alotra.services.ProductService;
import alotra.services.impl.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/admin/deleteProduct"})
public class DeleteProductController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String productName = req.getParameter("productName");
		ProductService productService = new ProductServiceImpl();
		productService.deleteProduct(productName);
        List<DTOProductModel> allProduct = productService.displayAllProduct();
        req.setAttribute("listProdut", allProduct);
        req.getRequestDispatcher("/WEB-INF/views/admin/home.jsp").forward(req, resp);
	}
}
