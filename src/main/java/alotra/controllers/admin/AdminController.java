package alotra.controllers.admin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Mày thêm các đường dẫn ảo vào mảng urlPatterns này nhé
@WebServlet(urlPatterns = {"/admin/addproduct", "/admin/ordermanagement","/admin/editorder","/admin/customerlist","/admin/statistics", "/admin/editproduct"}) 
public class AdminController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String path = request.getServletPath();
        
        if (path.equals("/addproduct")) {
            // Mở trang Thêm sản phẩm
            request.getRequestDispatcher("/WEB-INF/views/admin/addproduct.jsp").forward(request, response);
        } 
        else if (path.equals("/ordermanagement")) {
            // Mở trang Quản lý đơn hàng
            request.getRequestDispatcher("/WEB-INF/views/admin/ordermanagement.jsp").forward(request, response);
        }
        else if (path.equals("/editorder")) {
            // Trang sửa hóa đơn (thường kèm theo ID)
            // String id = request.getParameter("id");
            request.getRequestDispatcher("/WEB-INF/views/admin/editorder.jsp").forward(request, response);
        }
        else if (path.equals("/customerlist")) {
            // Trang sửa hóa đơn (thường kèm theo ID)
            // String id = request.getParameter("id");
            request.getRequestDispatcher("/WEB-INF/views/admin/customerlist.jsp").forward(request, response);
        }
        else if (path.equals("/statistics")) {
            // Trang sửa hóa đơn (thường kèm theo ID)
            // String id = request.getParameter("id");
            request.getRequestDispatcher("/WEB-INF/views/admin/statistics.jsp").forward(request, response);
        }
        else if (path.equals("/editproduct")) {
	        request.getRequestDispatcher("/WEB-INF/views/admin/editproduct.jsp").forward(request, response);
	    }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Đây là nơi mày sẽ viết code xử lý khi nhấn nút "Lưu" hoặc "Xác nhận đơn hàng"
        // Hiện tại cứ để trống hoặc gọi doGet tùy ý
    }
}