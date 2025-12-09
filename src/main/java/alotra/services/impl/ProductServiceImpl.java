package alotra.services.impl;

import alotra.dao.ProductDao;
import alotra.dao.impl.ProductDaoImpl;
import alotra.services.ProductService;

public class ProductServiceImpl implements ProductService {

	ProductDao productDao = new ProductDaoImpl();
}
