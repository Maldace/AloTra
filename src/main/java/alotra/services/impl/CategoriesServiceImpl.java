package alotra.services.impl;

import alotra.dao.CategoriesDao;
import alotra.dao.impl.CategoriesDaoImpl;
import alotra.services.CategoriesService;

public class CategoriesServiceImpl implements CategoriesService{

	CategoriesDao categoryDao = new CategoriesDaoImpl();
}
