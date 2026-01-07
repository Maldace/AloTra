package alotra.controllers.user;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;

import alotra.models.BillDetailModel;
import alotra.models.UserModel;
import alotra.services.UserService;
import alotra.services.impl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/buy"})
public class BuyController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserModel user = (UserModel) session.getAttribute("user");
		if(user==null) {
			return;
		}
		String[] productIds = req.getParameterValues("productId");
		String[] quantities = req.getParameterValues("quantity");
		String[] prices = req.getParameterValues("price");
		String[] productNames = req.getParameterValues("productName");
		int buyerId = user.getId();
		Date date = new Date(System.currentTimeMillis());
		Time time = new Time(System.currentTimeMillis()); 
		UserService userService = new UserServiceImpl();
		for (int i=0; i<productIds.length; i++) {
			BillDetailModel bill = new BillDetailModel();
			bill.setProductId(Integer.parseInt(productIds[i]));
			bill.setBuyerId(buyerId);
			bill.setQuantity(Integer.parseInt(quantities[i]));
			bill.setDate(date);
			bill.setTime(time);
			bill.setPrice(Integer.parseInt(quantities[i])*Double.parseDouble(prices[i]));
			userService.buy(bill, productNames[i]);
		}
	}
}
