package alotra.controllers.admin;

import java.io.IOException;

import alotra.services.SupplierService;
import alotra.services.impl.SupplierServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DelectSupplierController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String supplierName = req.getParameter("supplierName");
		SupplierService supplierService = new SupplierServiceImpl();
		supplierService.deleteSupplier(supplierName);
	}
}
