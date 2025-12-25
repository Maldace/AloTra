package alotra.services.impl;

import java.util.List;

import alotra.dao.CategoriesDao;
import alotra.dao.impl.CategoriesDaoImpl;
import alotra.models.CategoriesModel;
import alotra.services.CategoriesService;

public class CategoriesServiceImpl implements CategoriesService{

	CategoriesDao categoryDao = new CategoriesDaoImpl();
	
	@Override
	public List<CategoriesModel> categoryList() {
		
		return categoryDao.getAllCategories();
	}
	
	@Override
	public boolean addCategory(CategoriesModel category) {
		
		if(!categoryDao.checkExistCategory(category.getName())){
			categoryDao.insert(category);
			return true;
		}
		else {
			return false;
		}
	}
	
	@Override
	public boolean updateCategory(CategoriesModel category) {
		
		if(categoryDao.checkExistCategory(category.getName())){
			categoryDao.update(category);
			return true;
		}
		else {
			return false;
		}
	}
	@Override
	public boolean deleteProduct(CategoriesModel category) {
		
		if(categoryDao.checkExistCategory(category.getName())){
			categoryDao.delete(category.getName());
			return true;
		}
		else {
			return false;
		}
	}
}
