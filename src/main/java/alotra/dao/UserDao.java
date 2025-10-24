package alotra.dao;

import alotra.models.UserModel;

public interface UserDao {

	  void insert(UserModel user);
	  boolean checkExistEmail(String email);
	  boolean checkExistUsername(String username);
	  boolean checkExistPhone(String phone);
	  UserModel findbyUserName(String username);
}
