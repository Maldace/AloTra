package alotra.services;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import alotra.models.BillDetailModel;
import alotra.models.UserModel;

public interface UserService {

	UserModel login(String username, String password);
	
	UserModel findByUserName(String username);
	
	boolean addUser(UserModel user);
	
	String forgotPassword(String username, String email, String phone, String password);

	void billManager(int userId, Date date, Time time);

	boolean updateUser(UserModel user);

	boolean deleteUser(UserModel user);

	boolean buy(List<BillDetailModel> billList, List<String> productName);
}
