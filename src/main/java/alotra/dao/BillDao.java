package alotra.dao;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import alotra.models.BillDetailModel;
import alotra.models.DTOBillDetailModel;

public interface BillDao {

	void insert(BillDetailModel bill);

//	List<DTOBillDetailModel> getAllBIll(int buyerId, Date date, Time time);
	List<DTOBillDetailModel> getAllBIll();

	int getTotalRevenueByMonth(int month, int year);

	BillDetailModel getSalesInMonthOfProduct(int productid, int month, int year);

	BillDetailModel getSalesInMonthBySupplier(int supplierid, int month, int year);

	BillDetailModel getSalesInMonthByBuyer(int buyerid, int month, int year);

	List<Integer> getAllSoldYear();

	List<String> getAllDateByBuyer(int buyerId);

	List<String> getAllTimeByBuyer(int buyerId, String date);

}
