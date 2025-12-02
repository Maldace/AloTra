package alotra.dao;

import alotra.models.UserModel;
import alotra.controllers.users.User;

public interface UserDao {
	
	UserModel findByUserName(String username);
	
	void insert(User user);
	boolean checkExistEmail(String email);
	boolean checkExistUsername(String username);
	boolean checkExistPhone(String phone);
	void changePassword(UserModel user, String password);

	void accountManager(UserModel user);
	

}