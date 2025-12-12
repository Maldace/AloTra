package alotra.services.impl;

import alotra.dao.SupplierDao;
import alotra.dao.impl.SupplierDaoImpl;
import alotra.services.SupplierService;

public class SupplierServiceImpl implements SupplierService {

	SupplierDao supplierDao = new SupplierDaoImpl();
}
