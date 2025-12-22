package alotra.controllers;

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

@WebServlet(urlPatterns = {"/home"})
public class HomeController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Gọi DAO để lấy dữ liệu từ database
        ProductService productService = new ProductServiceImpl(); // tạo đối tượng DAO
        List<DTOProductModel> list = productService.displayAllProduct(); // lấy danh sách sản phẩm

        // Gửi dữ liệu sang JSP
		req.setAttribute("products", list); // lưu list vào request

        // Chuyển sang trang home.jsp
        req.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

}
