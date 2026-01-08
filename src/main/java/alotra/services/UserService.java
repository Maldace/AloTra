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
	
	void addUser(UserModel user);
	
	boolean forgotPassword(String username, String email, String phone, String password);

	List<DTOBillDetailModel> billManager();

	void updateUser(UserModel user);

	void deleteUser(String username);

	int getTotalRevenue(int month, int year);

	BillDetailModel getSalesInMonthOfProduct(int productid, int month, int year);

	BillDetailModel getSalesInMonthBySupplier(int supplierid, int month, int year);

	BillDetailModel getSalesInMonthByBuyer(int buyerid, int month, int year);

	boolean buy(BillDetailModel bill, String productName);

	List<UserModel> getAllUser();

	List<Integer> getAllSoldYear();
}
