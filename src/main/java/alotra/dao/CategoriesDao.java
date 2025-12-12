package alotra.dao;

import java.util.List;

import alotra.models.CategoriesModel;

public interface CategoriesDao {

	List<CategoriesModel> getAllCategories();

	void insert(CategoriesModel category);

	void update(CategoriesModel category);

	void delete(String categoryName);

	CategoriesModel getACategory(String categoryName);

}
