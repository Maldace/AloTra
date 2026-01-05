package alotra.services;

import java.util.List;

import alotra.models.SupplierModel;

public interface SupplierService {

	List<SupplierModel> supplierList();

	SupplierModel supplierDetail(String supplierName);

	boolean addSupplier(SupplierModel supplier);

	boolean updateSupplier(SupplierModel supplier);

	boolean deleteSupplier(String supplierName);

}
