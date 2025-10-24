package alotra.controllers.users.impl;

import alotra.controllers.users.User;
import alotra.controllers.users.UserService;
import alotra.dao.UserDao;
import alotra.dao.impl.UserDaoImpl;

public class UserServiceImpl implements UserService  {
	
	UserDao userDao = new UserDaoImpl();


	@Override
	public void insert(User user) {
		userDao.insert(user);
		
	}

	@Override
	public boolean register(String email, String password, String username, String fullname, String phone) {
		if (userDao.checkExistUsername(username)) {
			return false;
			}
			long millis=System.currentTimeMillis();
			java.sql.Date date=new java.sql.Date(millis);
			userDao.insert(new User(0, email, username, fullname,password, null,5,phone,date));
			return true;

	}

	@Override
	public boolean checkExistEmail(String email) {
		return userDao.checkExistEmail(email);
	}

	@Override
	public boolean checkExistUsername(String username) {
		return userDao.checkExistUsername(username);
	}

	@Override
	public boolean checkExistPhone(String phone) {
		return userDao.checkExistPhone(phone);

	}

}
