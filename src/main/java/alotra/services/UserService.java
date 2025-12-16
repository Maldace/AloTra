package alotra.services;

import java.sql.Date;
import java.sql.Time;

import alotra.models.UserModel;

public interface UserService {

	UserModel login(String username, String password);
	
	UserModel findByUserName(String username);
	
	boolean register(UserModel user);
	
	String forgotPassword(String username, String email, String phone, String password);

	void billManager(int userId, Date date, Time time);
}
