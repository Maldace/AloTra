package alotra.services;

import alotra.models.UserModel;

public interface UserService {

	UserModel login(String username, String password);
	
	UserModel findByUserName(String username);
	
	String register(String email, String username, String fullname, String password, String avatar, String phone);
	
	String forgotPassword(String username, String email, String phone, String password);
	
	void accountManager(UserModel user);
}
