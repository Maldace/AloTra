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

@WebServlet(urlPatterns = {"/admin/editProduct"})
public class EditProductController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String name = req.getParameter("productName");
		String price = req.getParameter("price");
		String inventory = req.getParameter("inventory");
		String categoryId = req.getParameter("categoryId");
		String supplierId = req.getParameter("supplierId");
		String img = req.getParameter("img");
		CategoriesService categoriesService = new CategoriesServiceImpl();
		SupplierService supplierService = new SupplierServiceImpl();
		List<CategoriesModel> listCategory = categoriesService.categoryList();
		List<SupplierModel> listSupplier = supplierService.supplierList();
		req.setAttribute("listCategory", listCategory);
		req.setAttribute("listSupplier", listSupplier);
		req.setAttribute("name", name);
		req.setAttribute("price", price);
		req.setAttribute("inventory", inventory);
		req.setAttribute("categoryId", categoryId);
		req.setAttribute("supplierId", supplierId);
		req.setAttribute("img", img);
		req.setAttribute("id", id);
		req.getRequestDispatcher("/WEB-INF/views/admin/editproduct.jsp").forward(req, resp);
	}
}
