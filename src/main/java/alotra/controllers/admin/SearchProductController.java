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

@WebServlet(urlPatterns = {"/admin/searchProduct"})
public class SearchProductController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nameStr = req.getParameter("nameStr");
		ProductService productService = new ProductServiceImpl();
		List<DTOProductModel> searchedProduct = productService.searchAProduct(nameStr);
		req.setAttribute("listProdut", searchedProduct);
        req.getRequestDispatcher("/WEB-INF/views/admin/home.jsp").forward(req, resp);
	}
}
