package alotra.services;

import java.util.List;

import alotra.models.DTOProductModel;
import alotra.models.ProductModel;

public interface ProductService {

	List<DTOProductModel> sortByCategory(String categoryName);

	List<DTOProductModel> sortBySupplier(String supplierName);

	List<DTOProductModel> displayAllProduct();

	List<DTOProductModel> searchAProduct(String searchString);
	
	// Lấy danh sách sản phẩm theo trang
	List<DTOProductModel> getProductsPerPage(int pageIndex, int pageSize);

	// Lấy tổng số lượng sản phẩm để tính số trang
	int getTotalProductCount();

	DTOProductModel getProductDetail(String productName);

	void addProduct(ProductModel product);

	void updateProduct(ProductModel product);

	void deleteProduct(String productName);

}
