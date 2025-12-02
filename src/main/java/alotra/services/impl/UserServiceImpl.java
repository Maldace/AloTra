package alotra.services.impl;

import java.sql.Date;

import alotra.dao.UserDao;
import alotra.dao.impl.UserDaoImpl;
import alotra.models.UserModel;
import alotra.services.UserService;
import alotra.controllers.users.User;

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
	public String register(String email, String username, String fullname, String password, String avatar, String phone) {
		if(!userDao.checkExistUsername(username) && !userDao.checkExistEmail(email) && !userDao.checkExistPhone(phone)) {
			User user = new User();
			user.setEmail(email);
			user.setUserName(username);
			user.setFullName(fullname);
			user.setPassWord(password);
			user.setAvatar(avatar);
			user.setRoleid(2);
			user.setPhone(phone);
			Date today = new Date(System.currentTimeMillis());
			user.setCreatedDate(today);
			userDao.insert(user);
			return "Đăng ký thành công!";
		}
		else {
			return "Đăng ký thất bại. Tên đăng nhập, email hoặc số điện thoại bị trùng với tài khoản có sẵn";
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
	public void accountManager(UserModel user) {
		userDao.accountManager(user);
	}

}