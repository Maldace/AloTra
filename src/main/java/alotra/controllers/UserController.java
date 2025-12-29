package alotra.controllers;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import alotra.models.BillDetailModel;
import alotra.models.UserModel;
import alotra.services.UserService;
import alotra.services.impl.UserServiceImpl;

@WebServlet("/user")
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService = new UserServiceImpl();

    // GET: profile, findByUserName, billManager
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("profile".equalsIgnoreCase(action) || "find".equalsIgnoreCase(action)) {
            String username = req.getParameter("userName");
            if (username == null || username.isEmpty()) {
                resp.sendRedirect(req.getContextPath() + "/error.jsp");
                return;
            }
            UserModel user = userService.findByUserName(username);
            req.setAttribute("user", user);
            req.getRequestDispatcher("/WEB-INF/views/user/profile.jsp").forward(req, resp);
            return;
        }

        if ("billManager".equalsIgnoreCase(action)) {
            try {
                int userId = Integer.parseInt(req.getParameter("userId"));
                Date date = Date.valueOf(req.getParameter("date")); 
                Time time = Time.valueOf(req.getParameter("time")); 
                List<?> bills = userService.billManager(userId, date, time);
                req.setAttribute("bills", bills);
                req.getRequestDispatcher("/WEB-INF/views/bill/list.jsp").forward(req, resp);
            } catch (Exception e) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameters for billManager");
            }
            return;
        }

        resp.sendRedirect(req.getContextPath() + "/");
    }

    // POST: login, addUser(register), forgotPassword, update, delete, buy
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        // LOGIN
        if ("login".equalsIgnoreCase(action)) {
            String username = req.getParameter("userName");
            String password = req.getParameter("passWord");
            UserModel user = userService.login(username, password);
            if (user != null) {
                HttpSession session = req.getSession(true);
                session.setAttribute("user", user);
                resp.sendRedirect(req.getContextPath() + "/home.jsp"); 
            } else {
                req.setAttribute("msg", "Tên đăng nhập hoặc mật khẩu không đúng");
                req.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(req, resp);
            }
            return;
        }

        // REGISTER / ADD USER
        if ("addUser".equalsIgnoreCase(action) || "register".equalsIgnoreCase(action)) {
            UserModel user = new UserModel();
            String idStr = req.getParameter("id");
            if (idStr != null && !idStr.isEmpty()) {
                try { user.setId(Integer.parseInt(idStr)); } catch (NumberFormatException e) {}
            }
            user.setEmail(req.getParameter("email"));
            user.setUserName(req.getParameter("userName"));
            user.setFullName(req.getParameter("fullName"));
            user.setPassWord(req.getParameter("passWord"));
            user.setAvatar(req.getParameter("avatar"));
            String roleid = req.getParameter("roleid");
            if (roleid != null && !roleid.isEmpty()) {
                try { user.setRoleid(Integer.parseInt(roleid)); } catch (NumberFormatException e) {}
            }
            user.setPhone(req.getParameter("phone"));
            boolean created = userService.addUser(user);
            if (created) resp.sendRedirect(req.getContextPath() + "/auth/login.jsp");
            else {
                req.setAttribute("msg", "Tài khoản/Email/SĐT đã tồn tại");
                req.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(req, resp);
            }
            return;
        }

        // FORGOT PASSWORD
        if ("forgotPassword".equalsIgnoreCase(action)) {
            String username = req.getParameter("userName");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String newPassword = req.getParameter("newPassword");
            String result = userService.forgotPassword(username, email, phone, newPassword);
            req.setAttribute("msg", result);
            req.getRequestDispatcher("/WEB-INF/views/auth/forgotResult.jsp").forward(req, resp);
            return;
        }

        // UPDATE USER
        if ("update".equalsIgnoreCase(action)) {
            UserModel user = new UserModel();
            String idStr = req.getParameter("id");
            if (idStr != null && !idStr.isEmpty()) {
                try { user.setId(Integer.parseInt(idStr)); } catch (NumberFormatException e) {}
            }
            user.setEmail(req.getParameter("email"));
            user.setUserName(req.getParameter("userName"));
            user.setFullName(req.getParameter("fullName"));
            String pwd = req.getParameter("passWord");
            if (pwd != null && !pwd.isEmpty()) user.setPassWord(pwd);
            user.setAvatar(req.getParameter("avatar"));
            String roleid = req.getParameter("roleid");
            if (roleid != null && !roleid.isEmpty()) {
                try { user.setRoleid(Integer.parseInt(roleid)); } catch (NumberFormatException e) {}
            }
            user.setPhone(req.getParameter("phone"));

            boolean ok = userService.updateUser(user);
            if (ok) resp.sendRedirect(req.getContextPath() + "/user?action=profile&userName=" + user.getUserName());
            else resp.sendRedirect(req.getContextPath() + "/error.jsp");
            return;
        }

        // DELETE USER
        if ("delete".equalsIgnoreCase(action)) {
            String username = req.getParameter("userName");
            if (username == null || username.isEmpty()) {
                resp.sendRedirect(req.getContextPath() + "/error.jsp");
                return;
            }
            UserModel user = userService.findByUserName(username);
            if (user != null && userService.deleteUser(user)) {
                HttpSession s = req.getSession(false);
                if (s != null) {
                    UserModel su = (UserModel) s.getAttribute("user");
                    if (su != null && su.getUserName().equals(username)) s.invalidate();
                }
                resp.sendRedirect(req.getContextPath() + "/goodbye.jsp");
            } else {
                resp.sendRedirect(req.getContextPath() + "/error.jsp");
            }
            return;
        }

        // BUY
        if ("buy".equalsIgnoreCase(action)) {
            String[] productIds = req.getParameterValues("productId");
            String[] productNames = req.getParameterValues("productName");
            String[] qtys = req.getParameterValues("qty");
            String[] prices = req.getParameterValues("price");

            List<BillDetailModel> billList = new ArrayList<>();
            List<String> productNameList = new ArrayList<>();

            int buyerId = 0;
            HttpSession session = req.getSession(false);
            if (session != null) {
                UserModel sessUser = (UserModel) session.getAttribute("user");
                if (sessUser != null) buyerId = sessUser.getId();
            }
            if (buyerId == 0) { // fallback param
                String b = req.getParameter("buyerId");
                if (b != null && !b.isEmpty()) {
                    try { buyerId = Integer.parseInt(b); } catch (NumberFormatException e) {}
                }
            }

            Date currentDate = new Date(System.currentTimeMillis());
            Time currentTime = new Time(System.currentTimeMillis());

            if (productNames != null) {
                for (int i = 0; i < productNames.length; i++) {
                    BillDetailModel bd = new BillDetailModel();
                    if (productIds != null && productIds.length > i) {
                        try { bd.setProductId(Integer.parseInt(productIds[i])); } catch (NumberFormatException e) {}
                    }
                    bd.setBuyerId(buyerId);
                    if (qtys != null && qtys.length > i) {
                        try { bd.setQuantity(Integer.parseInt(qtys[i])); } catch (NumberFormatException e) { bd.setQuantity(1); }
                    } else bd.setQuantity(1);

                    if (prices != null && prices.length > i) {
                        try { bd.setPrice(Integer.parseInt(prices[i])); } catch (NumberFormatException e) { bd.setPrice(0); }
                    }

                    bd.setDate(currentDate);
                    bd.setTime(currentTime);

                    billList.add(bd);
                    productNameList.add(productNames[i]);
                }
            }

            boolean ok = userService.buy(billList, productNameList);
            if (ok) resp.sendRedirect(req.getContextPath() + "/orderSuccess.jsp");
            else resp.sendRedirect(req.getContextPath() + "/orderFail.jsp");
            return;
        }

        // default
        resp.sendRedirect(req.getContextPath() + "/");
    }
}