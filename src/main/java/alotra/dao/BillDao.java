package alotra.dao;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import alotra.models.BillDetailModel;
import alotra.models.DTOBillDetailModel;

public interface BillDao {

	void insert(List<BillDetailModel> billList);

	List<DTOBillDetailModel> getAllBIll(int buyerId, Date date, Time time);

}
