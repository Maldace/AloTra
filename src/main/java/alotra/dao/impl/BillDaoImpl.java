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
import alotra.models.DTOProductModel;

public class BillDaoImpl implements BillDao{

	@Override
	public void insert(BillDetailModel bill) {
			String sql = "INSERT INTO [Bill_details](productid, buyerid, quantity, date, time, price) VALUES (?,?,?,?,?,?)";
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
	
	@Override
	public int getTotalRevenueByMonth(int month, int year) {
	    String sql = "select sum(price) as total_sold from Bill_details where MONTH(date) = ? and YEAR(date) = ?";
	    try (
	        Connection conn = new DBConnect().getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql);
	    ) {
	        ps.setInt(1, month);
	        ps.setInt(2, year);
	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                return rs.getInt("total_sold");
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return 0;
	}
	
	@Override
	public BillDetailModel getSalesInMonthOfProduct(int productid, int month, int year) {
	    String sql = "select sum(price) as total_sold, sum(quantity) as total_quantity from Bill_details where productid=? and MONTH(date) =? and YEAR(date) = ?";
	    try (
	        Connection conn = new DBConnect().getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql);
	    ) {
	        ps.setInt(1, productid);
	        ps.setInt(2, month);
	        ps.setInt(3, year);
	        try (ResultSet rs = ps.executeQuery()) {
	        	while (rs.next()) {
	        		BillDetailModel bill = new BillDetailModel();
	    			bill.setPrice(rs.getInt("total_sold"));
	    			bill.setQuantity(rs.getInt("total_quantity"));
	    		return bill;}
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}
	
	@Override
	public BillDetailModel getSalesInMonthBySupplier(int supplierid, int month, int year) {
	    String sql = "select sum(b.price) as total_sold, sum(quantity) as total_quantity from Bill_details b inner join Products p on b.productid=p.id where p.supplierid=? and MONTH(date)=? and YEAR(date)=?";
	    try (
	        Connection conn = new DBConnect().getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql);
	    ) {
	        ps.setInt(1, supplierid);
	        ps.setInt(2, month);
	        ps.setInt(3, year);
	        try (ResultSet rs = ps.executeQuery()) {
	        	while (rs.next()) {
	        		BillDetailModel bill = new BillDetailModel();
	    			bill.setPrice(rs.getInt("total_sold"));
	    			bill.setQuantity(rs.getInt("total_quantity"));
	    		return bill;}
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}
	
	@Override
	public BillDetailModel getSalesInMonthByBuyer(int buyerid, int month, int year) {
	    String sql = "select sum(price) as total_sold, sum(quantity) as total_quantity from Bill_details where buyerid=? and MONTH(date)=? and YEAR(date)=?";
	    try (
	        Connection conn = new DBConnect().getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql);
	    ) {
	        ps.setInt(1, buyerid);
	        ps.setInt(2, month);
	        ps.setInt(3, year);
	        try (ResultSet rs = ps.executeQuery()) {
	        	while (rs.next()) {
	        		BillDetailModel bill = new BillDetailModel();
	    			bill.setPrice(rs.getInt("total_sold"));
	    			bill.setQuantity(rs.getInt("total_quantity"));
	    		return bill;}	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}
}
