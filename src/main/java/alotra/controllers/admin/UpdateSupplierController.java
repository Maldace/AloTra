package alotra.controllers.admin;

import java.io.IOException;

import alotra.models.SupplierModel;
import alotra.services.SupplierService;
import alotra.services.impl.SupplierServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateSupplierController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String supplierName = req.getParameter("supplierName");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		SupplierModel supplier = new SupplierModel();
		supplier.setName(supplierName);
		supplier.setPhone(phone);
		supplier.setAddress(address);
		SupplierService supplierService = new SupplierServiceImpl();
		supplierService.updateSupplier(supplier);
	}
}
