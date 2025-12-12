package alotra.dao;

import java.util.List;

import alotra.models.UserModel;

public interface UserDao {
	
	UserModel findByUserName(String username);
	
	void insert(UserModel user);
	boolean checkExistEmail(String email);
	boolean checkExistUsername(String username);
	boolean checkExistPhone(String phone);
	void changePassword(UserModel user, String password);
	void delete(String username);
	void update(UserModel user);
	List<UserModel> getAllUser();

}