package alotra.controllers;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import alotra.models.DTOProductModel;
import alotra.services.ProductService;
import alotra.services.impl.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/home"})
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        // --- BẮT ĐẦU CODE PHÂN TRANG ---
        int pageSize = 6; // Số sản phẩm trên 1 trang
        String pageParam = req.getParameter("page");
        int currentPage = 1;

        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                currentPage = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                currentPage = 1;
            }
        }

        List<DTOProductModel> list = null;
        int totalPages = 0;

        try {
            // Thay vì dùng displayAllProduct(), ta dùng hàm lấy theo phân trang
            list = productService.getProductsPerPage(currentPage, pageSize);
            
            // Tính tổng số trang
            int totalProducts = productService.getTotalProductCount();
            totalPages = (int) Math.ceil((double) totalProducts / pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // --- KẾT THÚC CODE PHÂN TRANG ---

        if (list == null) {
            list = Collections.emptyList();
        }

        HttpSession session = req.getSession();
        Double price = (Double) session.getAttribute("price");
        String name = (String) session.getAttribute("name");

        req.setAttribute("price", price);
        req.setAttribute("name", name);
        req.setAttribute("products", list);
        
        // Gửi thêm thông tin phân trang sang JSP
        req.setAttribute("currentPage", currentPage);
        req.setAttribute("totalPages", totalPages);

        req.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Giữ nguyên như cũ
    }
}