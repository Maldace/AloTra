package alotra.controllers.admin;

import java.io.IOException;

import alotra.dao.BillDao;
import alotra.dao.impl.BillDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RevenueByMonthController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int month = Integer.parseInt(req.getParameter("month"));
		int year = Integer.parseInt(req.getParameter("year"));
		BillDao billDao = new BillDaoImpl();
		int revenue = billDao.getTotalRevenueByMonth(month, year);
		req.setAttribute("revenue", revenue);
	}
}
