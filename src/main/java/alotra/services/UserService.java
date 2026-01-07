package alotra.services;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import alotra.models.BillDetailModel;
import alotra.models.DTOBillDetailModel;
import alotra.models.UserModel;

public interface UserService {

	UserModel login(String username, String password);
	
	UserModel findByUserName(String username);
	
	boolean addUser(UserModel user);
	
	String forgotPassword(String username, String email, String phone, String password);

	List<DTOBillDetailModel> billManager(int userId, Date date, Time time);

	boolean updateUser(UserModel user);

	boolean deleteUser(String username);

	int getTotalRevenue(int month, int year);

	BillDetailModel getSalesInMonthOfProduct(int productid, int month, int year);

	BillDetailModel getSalesInMonthBySupplier(int supplierid, int month, int year);

	BillDetailModel getSalesInMonthByBuyer(int buyerid, int month, int year);

	boolean buy(BillDetailModel bill, String productName);

	List<UserModel> getAllUser();
}
