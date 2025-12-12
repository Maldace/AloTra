package alotra.services.impl;

import java.sql.Date;

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
	
	@Override
	public boolean register(UserModel user) {
		if(!userDao.checkExistUsername(user.getUserName()) && !userDao.checkExistEmail(user.getEmail()) && !userDao.checkExistPhone(user.getPhone())) {
			userDao.insert(user);
			return true;
		}
		else {
			return false;
		}
	}
	
	@Override
	public String forgotPassword(String username, String email, String phone, String password) {
		
		UserModel user = this.findByUserName(username);
		if(user==null) {
			return "Tên đăng nhập không đúng.";
		}
		else {
			if(user.getEmail()==email && user.getPhone()==phone) {
				userDao.changePassword(user, password);
				return "Mật khẩu đã thay đổi. Vui lòng đăng nhập lại!";
			}
			else {
				return "Email hoặc số điện thoại không trùng khớp với tài khoản đã đăng ký.";
			}
		}
	}
	
	
	@Override
	public void billManager(String username, Date date) {
		
	}

}