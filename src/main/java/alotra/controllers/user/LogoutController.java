package alotra.controllers.user;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout") // Để /logout cho nó gọn và dễ gọi từ Header
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. Lấy session hiện tại
        HttpSession session = req.getSession(false);
        
        if (session != null) {
            // 2. Xóa sạch mọi dữ liệu trong session (account, user...)
            session.invalidate();
        }
        
        // 3. Quan trọng nhất: Đuổi nó về trang chủ để Header load lại trạng thái chưa đăng nhập
        resp.sendRedirect(req.getContextPath() + "/home");
    }
}