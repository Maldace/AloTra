package alotra.controllers;

import java.io.IOException;
import java.util.List;
import alotra.models.CartItemDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/delete-cart"})
public class DeleteCartController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        HttpSession session = req.getSession();
        List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");

        if (cart != null && idParam != null) {
            int productId = Integer.parseInt(idParam);
            // Xóa sản phẩm có ID tương ứng khỏi List trong Session
            cart.removeIf(item -> item.getProductId() == productId);

            // Tính lại tổng tiền sau khi xóa
            double total = 0;
            for (CartItemDTO item : cart) {
                total += item.getPrice() * item.getQuantity();
            }
            session.setAttribute("cart", cart);
            session.setAttribute("totalPrice", total);
        }
        // Quay lại trang người dùng vừa đứng (Trang chủ hoặc Thanh toán)
        resp.sendRedirect(req.getHeader("Referer"));
    }
}