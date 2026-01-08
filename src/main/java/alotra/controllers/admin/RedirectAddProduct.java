package alotra.controllers.admin;

import java.io.IOException;
import java.util.List;

import alotra.models.CategoriesModel;
import alotra.models.SupplierModel;
import alotra.services.CategoriesService;
import alotra.services.SupplierService;
import alotra.services.impl.CategoriesServiceImpl;
import alotra.services.impl.SupplierServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/admin/redirectAddProduct"})
public class RedirectAddProduct extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CategoriesService categoriesService = new CategoriesServiceImpl();
		SupplierService supplierService = new SupplierServiceImpl();
		List<CategoriesModel> listCategory = categoriesService.categoryList();
		List<SupplierModel> listSupplier = supplierService.supplierList();
		req.setAttribute("listCategory", listCategory);
		req.setAttribute("listSupplier", listSupplier);
		req.getRequestDispatcher("/WEB-INF/views/admin/addproduct.jsp").forward(req, resp);
	}
}
