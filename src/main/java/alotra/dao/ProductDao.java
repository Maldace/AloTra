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

	List<DTOProductModel> findByCategory(String categoryName);

	List<DTOProductModel> findBySupplier(String supplierName);

	List<DTOProductModel> searchProduct(String searchString);

	boolean checkExistProduct(String name);

	List<DTOProductModel> getProductsPerPage(int pageIndex, int pageSize);
	int countAll();
	
}
