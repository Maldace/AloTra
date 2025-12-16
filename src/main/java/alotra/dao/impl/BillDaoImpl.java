package alotra.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import alotra.configs.DBConnect;
import alotra.dao.BillDao;
import alotra.models.BillDetailModel;
import alotra.models.DTOBillDetailModel;

public class BillDaoImpl implements BillDao{

	@Override
	public void insert(List<BillDetailModel> billList) {
		for (int i = 0; i<billList.size(); i++) {
			String sql = "INSERT INTO [Bill_details](productid, buyerid, quantity, date, time, price) VALUES (?,?,?,?,?,?)";
			BillDetailModel bill = billList.get(i);
			try (
			Connection conn = new DBConnect().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);){
			ps.setInt(1, bill.getProductId());
			ps.setInt(2, bill.getBuyerId());
			ps.setInt(3, bill.getQuantity());
			ps.setDate(4, bill.getDate());
			ps.setTime(5, bill.getTime());
			ps.setInt(6, bill.getPrice());
			ps.executeUpdate();
			} catch (Exception e) {e.printStackTrace();}
		}
	}
	
	@Override
	public List<DTOBillDetailModel> getAllBIll(int buyerId, Date date, Time time) {
		String sql = "select p.name as product_name, u.username as buyer, quantity, date, time, b.price as buy_price from Bill_details b inner join Users u on b.buyerid=u.id inner join Products p on b.productid = p.id where b.buyerid = ? and date = ? and time = ?";
		try (
			Connection conn = new DBConnect().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);){
			ps.setInt(1, buyerId);
			ps.setDate(2, date);
			ps.setTime(3, time);
			try(ResultSet rs = ps.executeQuery()){
			List<DTOBillDetailModel> billList = new ArrayList<DTOBillDetailModel>();
			while (rs.next()) {
				DTOBillDetailModel bill = new DTOBillDetailModel();
				bill.setProductName(rs.getString("product_name"));
				bill.setBuyerName(rs.getString("buyer"));
				bill.setQuantity(rs.getInt("quantity"));
				bill.setDate(rs.getDate("date"));
				bill.setTime(rs.getTime("time"));
				bill.setPrice(rs.getInt("buy_price"));
				billList.add(bill);
			}
			return billList;}
			} catch (Exception e) {e.printStackTrace();}
			return null;
	}
}
