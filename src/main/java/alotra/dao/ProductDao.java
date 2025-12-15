package alotra.dao;

import java.util.List;

import alotra.models.DTOProductModel;
import alotra.models.ProductModel;

public interface ProductDao {

	List<DTOProductModel> getAllProduct();

	void insert(ProductModel product);

	void update(ProductModel product);

	void delete(String productName);

	DTOProductModel getAProduct(String productName);

	DTOProductModel findByCategory(String categoryName);

	DTOProductModel findBySupplier(String supplierName);
	
}
