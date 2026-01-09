package alotra.controllers.user;

import java.io.IOException;
import alotra.models.UserModel;
import alotra.services.UserService;
import alotra.services.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/accountManager"}) // Bỏ chữ /user/ để khớp với Header
public class AccountManagerController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. Lấy thông tin user từ Session thay vì parameter
        HttpSession session = req.getSession(false);
        UserModel userSession = (UserModel) session.getAttribute("account");

        if (userSession != null) {
            // 2. Tìm lại thông tin mới nhất từ DB (nếu cần)
            UserService userService = new UserServiceImpl();
            UserModel user = userService.findByUserName(userSession.getUserName());
            
            // 3. Đẩy dữ liệu ra view profile
            req.setAttribute("user", user);
            req.getRequestDispatcher("/WEB-INF/views/user/profile.jsp").forward(req, resp);
        } else {
            // Nếu chưa đăng nhập mà bấm vào đây thì đuổi về trang login
            resp.sendRedirect(req.getContextPath() + "/login");
        }
    }
    
    // Thêm hàm doGet để nếu user F5 trang profile vẫn không bị lỗi
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}