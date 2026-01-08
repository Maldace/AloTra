package alotra.controllers.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import alotra.models.CartItemDTO;
import alotra.models.DTOProductModel;
import alotra.services.ProductService;
import alotra.services.impl.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/user/watchedProduct"})
public class WatchedProductController extends HttpServlet{

	 @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 HttpSession session = req.getSession(); 
		// Lấy session hiện tại, nếu chưa có thì tạo mới

		List<Integer> viewedProducts = 
		    (List<Integer>) session.getAttribute("viewedProducts"); 
		// Lấy danh sách sản phẩm đã xem từ session

		if (viewedProducts == null) { 
		    // Nếu chưa có danh sách nào
		    viewedProducts = new ArrayList<>(); 
		    // Tạo mới danh sách
		}

		int productId = Integer.parseInt(req.getParameter("id")); 
		// Lấy id sản phẩm đang xem từ request

		viewedProducts.remove(Integer.valueOf(productId)); 
		// Xóa nếu sản phẩm đã tồn tại để tránh trùng

		viewedProducts.add(0, productId); 
		// Thêm sản phẩm mới vào đầu danh sách (xem gần nhất)

		if (viewedProducts.size() > 5) { 
		    // Nếu danh sách lớn hơn 5
		    viewedProducts.remove(viewedProducts.size() - 1); 
		    // Xóa sản phẩm cũ nhất
		}

		session.setAttribute("viewedProducts", viewedProducts); 
		// Lưu lại danh sách vào session

	    }
}
