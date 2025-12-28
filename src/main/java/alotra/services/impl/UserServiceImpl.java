package alotra.services.impl;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import alotra.dao.BillDao;
import alotra.dao.ProductDao;
import alotra.dao.UserDao;
import alotra.dao.impl.BillDaoImpl;
import alotra.dao.impl.ProductDaoImpl;
import alotra.dao.impl.UserDaoImpl;
import alotra.models.BillDetailModel;
import alotra.models.DTOBillDetailModel;
import alotra.models.DTOProductModel;
import alotra.models.ProductModel;
import alotra.models.UserModel;
import alotra.services.UserService;

public class UserServiceImpl implements UserService {

	UserDao userDao = new UserDaoImpl();
	BillDao billDao = new BillDaoImpl();
	ProductDao productDao = new ProductDaoImpl();
	
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
	public boolean addUser(UserModel user) {
		if(!userDao.checkExistUsername(user.getUserName()) && !userDao.checkExistEmail(user.getEmail()) && !userDao.checkExistPhone(user.getPhone())) {
			userDao.insert(user);
			return true;
		}
		else {
			return false;
		}
	}
	
	@Override
	public boolean updateUser(UserModel user) {
		if(userDao.checkExistUsername(user.getUserName())) {
			userDao.update(user);
			return true;
		}
		else {
			return false;
		}
	}
	@Override
	public boolean deleteUser(UserModel user) {
		if(userDao.checkExistUsername(user.getUserName())) {
			userDao.delete(user.getUserName());
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
	public boolean buy(List<BillDetailModel> billList, List<String> productName) {
		for (int i = 0; i<billList.size(); i++) {
			DTOProductModel product = productDao.getAProduct(productName.get(i));
			if(billList.get(i).getQuantity()>product.getInventory()) {
				return false;
			}
		}
		for (int i = 0; i<billList.size(); i++) {
			DTOProductModel product = productDao.getAProduct(productName.get(i));
			billDao.insert(billList.get(i));
			ProductModel product2 = new ProductModel();
			product2.setId(billList.get(i).getProductId());
			product2.setName(productName.get(i));
			product2.setPrice(product.getPrice());
			product2.setInventory(product.getInventory()-billList.get(i).getQuantity());
			product2.setCategoryId(product.getCategoryId());
			product2.setSupplierId(product.getSupplierId());
			product2.setImage(product.getImage());
			productDao.update(product2);
			}
		return true;
	}
	
	@Override
	public List<DTOBillDetailModel> billManager(int userID, Date date, Time time) {

		return billDao.getAllBIll(userID, date, time);

	}

}
