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
	public void addUser(UserModel user) {
//		if(!userDao.checkExistUsername(user.getUserName()) && !userDao.checkExistEmail(user.getEmail()) && !userDao.checkExistPhone(user.getPhone())) {
//			userDao.insert(user);
//			return true;
//		}
//		else {
//			return false;
//		}
		userDao.insert(user);
	}
	
	@Override
	public void updateUser(UserModel user) {
//		if(userDao.checkExistUsername(user.getUserName())) {
//			userDao.update(user);
//			return true;
//		}
//		else {
//			return false;
//		}
		userDao.update(user);
	}
	@Override
	public void deleteUser(String username) {
//		if(userDao.checkExistUsername(username)) {
//			userDao.delete(username);
//			return true;
//		}
//		else {
//			return false;
//		}
		userDao.delete(username);
	}
	
	@Override
	public boolean forgotPassword(String username, String email, String phone, String password) {
		
		UserModel user = this.findByUserName(username);
		if(user!=null) {
			if(user.getEmail().equals(email) && user.getPhone().equals(phone)) {
				userDao.changePassword(user, password);
				return true;
			}
			else {
				return false;
			}
		}
		else {
			return false;
		}
	}
	
	@Override
	public boolean buy(BillDetailModel bill, String productName) {
	
			DTOProductModel product = productDao.getAProduct(productName);
			if(bill.getQuantity()>product.getInventory()) {
				return false;
			}
			billDao.insert(bill);
			ProductModel product2 = new ProductModel();
			product2.setId(bill.getProductId());
			product2.setName(productName);
			product2.setPrice(product.getPrice());
			product2.setInventory(product.getInventory()-bill.getQuantity());
			product2.setCategoryId(product.getCategoryId());
			product2.setSupplierId(product.getSupplierId());
			product2.setImage(product.getImage());
			productDao.update(product2);
		return true;
	}
	
	@Override
	public List<DTOBillDetailModel> billManager() {

		return billDao.getAllBIll();
	}

	@Override
	public List<UserModel> getAllUser() {

		return userDao.getAllUser();
	}
	
	@Override
	public int getTotalRevenue(int month, int year) {
		return billDao.getTotalRevenueByMonth(month, year);
	}
	
	@Override
	public BillDetailModel getSalesInMonthOfProduct(int productid, int month, int year) {
		return billDao.getSalesInMonthOfProduct(productid, month, year);
	}
	
	@Override
	public BillDetailModel getSalesInMonthBySupplier(int supplierid, int month, int year) {
		return billDao.getSalesInMonthBySupplier(supplierid, month, year);
	}
	
	@Override
	public BillDetailModel getSalesInMonthByBuyer(int buyerid, int month, int year) {
		return billDao.getSalesInMonthByBuyer(buyerid, month, year);
	}
	
	@Override
	public List<Integer> getAllSoldYear() {
		return billDao.getAllSoldYear();
	}
}
