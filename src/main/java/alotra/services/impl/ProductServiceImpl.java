package alotra.services.impl;

import java.util.List;

import alotra.dao.ProductDao;
import alotra.dao.impl.ProductDaoImpl;
import alotra.models.DTOProductModel;
import alotra.models.ProductModel;
import alotra.services.ProductService;

public class ProductServiceImpl implements ProductService {

	ProductDao productDao = new ProductDaoImpl();
	
	@Override
	public List<DTOProductModel> sortByCategory(String categoryName) {
		
		return productDao.findByCategory(categoryName);
	}
	
	@Override
	public List<DTOProductModel> sortBySupplier(String supplierName) {
		
		return productDao.findBySupplier(supplierName);
	}
	
	@Override
	public List<DTOProductModel> displayAllProduct() {
		
		return productDao.getAllProduct();
	}
	
	@Override
	public List<DTOProductModel> searchAProduct(String searchString) {
		
		return productDao.searchProduct(searchString);
	}
	
	@Override
	public DTOProductModel getProductDetail(String productName) {
		
		return productDao.getAProduct(productName);
	}
	
	@Override
	public boolean addProduct(ProductModel product) {
		
		if(!productDao.checkExistProduct(product.getName())){
			productDao.insert(product);
			return true;
		}
		else {
			return false;
		}
	}
	
	@Override
	public boolean updateProduct(ProductModel product) {
		
		if(productDao.checkExistProduct(product.getName())){
			productDao.update(product);
			return true;
		}
		else {
			return false;
		}
	}
	@Override
	public boolean deleteProduct(ProductModel product) {
		
		if(productDao.checkExistProduct(product.getName())){
			productDao.delete(product.getName());
			return true;
		}
		else {
			return false;
		}
	}
}
