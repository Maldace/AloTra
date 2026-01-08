package alotra.controllers.user;

import java.io.IOException;
import java.util.List;
import alotra.models.CartItemDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// PHẢI CÓ DÒNG NÀY THÌ MỚI HẾT LỖI 404
@WebServlet(urlPatterns = {"/user/updateCart"}) 
public class UpdateCartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String idParam = req.getParameter("id");
        HttpSession session = req.getSession();
        
        // Ép kiểu đúng để không bị lỗi đỏ
        List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");

        // 1. Xử lý xóa sạch giỏ hàng
        if ("clearAll".equals(action)) {
            session.removeAttribute("cart");
            session.setAttribute("totalPrice", 0.0);
        } 
        // 2. Xử lý tăng giảm món lẻ
        else if (cart != null && idParam != null) {
            try {
                int productId = Integer.parseInt(idParam);
                for (CartItemDTO item : cart) {
                    if (item.getProductId() == productId) {
                        if ("increase".equals(action)) {
                            item.setQuantity(item.getQuantity() + 1);
                        } else if ("decrease".equals(action)) {
                            item.setQuantity(item.getQuantity() - 1);
                        }
                        break;
                    }
                }
                
                // Xóa món nếu số lượng về 0
                cart.removeIf(item -> item.getQuantity() <= 0);

                // Tính lại tiền (Dùng Getter getPrice() và getQuantity() mới hết lỗi đỏ)
                double total = 0;
                for (CartItemDTO item : cart) {
                    total += item.getPrice() * item.getQuantity();
                }
                session.setAttribute("cart", cart);
                session.setAttribute("totalPrice", total);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        
        // Xử lý xong thì quay về trang chủ
        resp.sendRedirect("home");
    }
}