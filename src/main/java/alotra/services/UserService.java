package alotra.services;

import java.sql.Date;

import alotra.models.UserModel;

public interface UserService {

	UserModel login(String username, String password);
	
	UserModel findByUserName(String username);
	
	boolean register(UserModel user);
	
	String forgotPassword(String username, String email, String phone, String password);
	
	void accountManager(UserModel user);

	void billManager(String username, Date date);
}
