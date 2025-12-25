package alotra.services.impl;

import java.util.List;

import alotra.dao.SupplierDao;
import alotra.dao.impl.SupplierDaoImpl;
import alotra.models.ProductModel;
import alotra.models.SupplierModel;
import alotra.services.SupplierService;

public class SupplierServiceImpl implements SupplierService {

	SupplierDao supplierDao = new SupplierDaoImpl();
	
	@Override
	public List<SupplierModel> supplierList() {
		
		return supplierDao.getAllSuppliers();
	}
	
	@Override
	public SupplierModel supplierDetail(String supplierName) {
		
		return supplierDao.getASupplier(supplierName);
	}
	
	@Override
	public boolean addSupplier(SupplierModel supplier) {
		
		if(!supplierDao.checkExistSupplier(supplier.getName())){
			supplierDao.insert(supplier);
			return true;
		}
		else {
			return false;
		}
	}
	
	@Override
	public boolean updateSupplier(SupplierModel supplier) {
		
		if(supplierDao.checkExistSupplier(supplier.getName())){
			supplierDao.update(supplier);
			return true;
		}
		else {
			return false;
		}
	}
	@Override
	public boolean deleteProduct(SupplierModel supplier) {
		
		if(supplierDao.checkExistSupplier(supplier.getName())){
			supplierDao.delete(supplier.getName());
			return true;
		}
		else {
			return false;
		}
	}
}
