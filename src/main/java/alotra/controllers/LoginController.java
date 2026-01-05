package alotra.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import alotra.models.UserModel;
import alotra.services.UserService;
import alotra.services.impl.UserServiceImpl;

@WebServlet("/login")
public class LoginController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    req.getRequestDispatcher("/login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();

		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String alertMsg="";
        
        if(username.isEmpty() || password.isEmpty()){
			alertMsg = "Tài khoản hoặc mật khẩu không được rỗng";
			req.setAttribute("alert", alertMsg);
			req.getRequestDispatcher("/login.jsp").forward(req, resp);
			return;
			}
		UserService service = new UserServiceImpl();
		UserModel user = service.login(username, password);
		if(user!=null){
			HttpSession session = req.getSession(true);
			session.setAttribute("user", user);
			if(user.getRoleid()==1) {
	            resp.sendRedirect("admin/home?name=" + user.getUserName());
			}
			else if(user.getRoleid()==2) {
	            resp.sendRedirect("user/home?name=" + user.getUserName());
			}
		}else{
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            out.println("<font color=red>Password is wrong.</font>");
            rd.include(req, resp);
		}
		out.close();
	}

}
