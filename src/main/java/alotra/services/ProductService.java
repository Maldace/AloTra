package alotra.services;

import java.util.List;

import alotra.models.DTOProductModel;

public interface ProductService {

	List<DTOProductModel> sortByCategory(String categoryName);

	List<DTOProductModel> sortBySupplier(String supplierName);

	List<DTOProductModel> displayAllProduct();

	List<DTOProductModel> searchAProduct(String searchString);

	DTOProductModel getProductDetail(String productName);

}
