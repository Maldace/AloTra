package alotra.controllers.admin;

import java.io.IOException;
import java.util.List;

import alotra.models.BillDetailModel;
import alotra.models.DTOProductModel;
import alotra.models.SupplierModel;
import alotra.models.UserModel;
import alotra.services.ProductService;
import alotra.services.SupplierService;
import alotra.services.UserService;
import alotra.services.impl.ProductServiceImpl;
import alotra.services.impl.SupplierServiceImpl;
import alotra.services.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/admin/salesOfProduct"})
public class SalesInMonthOfProductController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int productId = Integer.parseInt(req.getParameter("product"));
		int month = Integer.parseInt(req.getParameter("month"));
		int year = Integer.parseInt(req.getParameter("year"));
		UserService userService = new UserServiceImpl();
		BillDetailModel detail = userService.getSalesInMonthOfProduct(productId, month, year);
		int quantity = detail.getQuantity();
		double price = detail.getPrice();
		ProductService productService = new ProductServiceImpl();
		SupplierService supplierService = new SupplierServiceImpl();
		List<Integer> years = userService.getAllSoldYear();
		List<DTOProductModel> products= productService.displayAllProduct();
		List<SupplierModel> suppliers = supplierService.supplierList();
		List<UserModel> buyers = userService.getAllUser();
		req.setAttribute("products", products);
		req.setAttribute("years", years);
		req.setAttribute("suppliers", suppliers);
		req.setAttribute("buyers", buyers);
		req.setAttribute("quantity", quantity);
		req.setAttribute("price", price);
		req.getRequestDispatcher("/WEB-INF/views/admin/statistics.jsp").forward(req, resp); 
	}
}
