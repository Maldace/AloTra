package alotra.controllers.admin;

import java.io.IOException;
import java.util.List;

import alotra.models.CategoriesModel;
import alotra.models.DTOProductModel;
import alotra.models.SupplierModel;
import alotra.services.CategoriesService;
import alotra.services.ProductService;
import alotra.services.SupplierService;
import alotra.services.impl.CategoriesServiceImpl;
import alotra.services.impl.ProductServiceImpl;
import alotra.services.impl.SupplierServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/categoryFilter"})
public class CategoryFilterController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String categoryName = req.getParameter("categoryName");
		ProductService productService = new ProductServiceImpl();
		CategoriesService categoriesService = new CategoriesServiceImpl();
		SupplierService supplierService = new SupplierServiceImpl();
		List<DTOProductModel> filtedProductList = productService.sortByCategory(categoryName);
        List<CategoriesModel> category = categoriesService.categoryList();
        List<SupplierModel> supplier = supplierService.supplierList(); 
		req.setAttribute("products", filtedProductList);
        req.setAttribute("category", category);
        req.setAttribute("supplier", supplier);
		req.getRequestDispatcher("/WEB-INF/views/user/home.jsp").forward(req, resp);
	}
}
