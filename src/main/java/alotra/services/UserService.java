package alotra.services;

import alotra.models.UserModel;

public interface UserService {

	UserModel login(String username, String password);
	
	UserModel findByUserName(String username);
}
