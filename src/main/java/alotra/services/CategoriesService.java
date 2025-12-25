package alotra.services;

import java.util.List;

import alotra.models.CategoriesModel;

public interface CategoriesService {

	List<CategoriesModel> categoryList();

	boolean addCategory(CategoriesModel category);

	boolean updateCategory(CategoriesModel category);

	boolean deleteProduct(CategoriesModel category);

}
