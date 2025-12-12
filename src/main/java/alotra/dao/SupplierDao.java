package alotra.dao;

import java.util.List;

import alotra.models.SupplierModel;

public interface SupplierDao {

	List<SupplierModel> getAllSuppliers();

	void insert(SupplierModel supplier);

	void update(SupplierModel supplier);

	void delete(String supplierName);

	SupplierModel getASupplier(String supplierName);

}
