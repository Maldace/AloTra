package alotra.services.impl;

import alotra.dao.UserDao;
import alotra.dao.impl.UserDaoImpl;
import alotra.models.UserModel;
import alotra.services.UserService;

public class UserServiceImpl implements UserService {

	UserDao userDao = new UserDaoImpl();
	
	@Override
	public UserModel findByUserName(String username) {
		
		return userDao.findByUserName(username);
	}

	@Override
	public UserModel login(String username, String password) {
		UserModel user = this.findByUserName(username);
		if (user != null && password.equals(user.getPassWord())) {
		return user;

	}
		return null;
	}

}