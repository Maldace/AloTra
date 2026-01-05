package alotra.controllers;

import java.io.IOException;

import alotra.models.ProductModel;
import alotra.services.ProductService;
import alotra.services.impl.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateProductController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String productName = req.getParameter("productName");
		double price = Double.parseDouble(req.getParameter("price"));
		int inventory = Integer.parseInt(req.getParameter("inventory"));
		int categoryId = Integer.parseInt(req.getParameter("categoryId"));
		int supplierId = Integer.parseInt(req.getParameter("supplierId"));
		String img = req.getParameter("img");
		ProductModel product = new ProductModel();
		product.setName(productName);
		product.setPrice(price);
		product.setInventory(inventory);
		product.setCategoryId(categoryId);
		product.setSupplierId(supplierId);
		product.setImage(img);
		ProductService productService = new ProductServiceImpl();
		productService.updateProduct(product);
	}

}
