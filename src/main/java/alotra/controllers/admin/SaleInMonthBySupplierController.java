package alotra.controllers.admin;

import java.io.IOException;

import alotra.models.BillDetailModel;
import alotra.services.UserService;
import alotra.services.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SaleInMonthBySupplierController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int supplierId = Integer.parseInt(req.getParameter("supplierId"));
		int month = Integer.parseInt(req.getParameter("month"));
		int year = Integer.parseInt(req.getParameter("year"));
		UserService userService = new UserServiceImpl();
		BillDetailModel detail = userService.getSalesInMonthBySupplier(supplierId, month, year);
		int quantity = detail.getQuantity();
		double price = detail.getPrice();
	}
}
