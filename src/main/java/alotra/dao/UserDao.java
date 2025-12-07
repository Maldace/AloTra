package alotra.dao;

import alotra.models.UserModel;

public interface UserDao {
	
	UserModel findByUserName(String username);
	
	void insert(UserModel user);
	boolean checkExistEmail(String email);
	boolean checkExistUsername(String username);
	boolean checkExistPhone(String phone);
	void changePassword(UserModel user, String password);

	void accountManager(UserModel user);
	

}