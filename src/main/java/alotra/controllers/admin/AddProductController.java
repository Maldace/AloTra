package alotra.controllers.admin;

import java.io.IOException;

import alotra.models.ProductModel;
import alotra.services.ProductService;
import alotra.services.impl.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/admin/addProduct"})
public class AddProductController extends HttpServlet{
	
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
		productService.addProduct(product);
		req.setAttribute("successMessage", "Đã thêm thành công"); // gửi thông báo sang JSP
        req.getRequestDispatcher("/WEB-INF/views/admin/addproduct.jsp").forward(req, resp); // quay lại trang
	}

}
