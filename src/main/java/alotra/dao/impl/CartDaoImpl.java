package alotra.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import alotra.configs.DBConnect;
import alotra.dao.CartDao;
import alotra.models.CartModel;
import alotra.models.DTOBillDetailModel;

public class CartDaoImpl implements CartDao{

	@Override
	public List<CartModel> getUserCart(int userid) {
		String sql = "select * from Cart where userid=?";
		try (
			Connection conn = new DBConnect().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);){
			ps.setInt(1, userid);
			try(ResultSet rs = ps.executeQuery()){
			List<CartModel> cartList = new ArrayList<CartModel>();
			while (rs.next()) {
				CartModel cart = new CartModel();
				cart.setProductid(rs.getInt("productid"));
				cart.setUserid(rs.getInt("userid"));
				cart.setQuantity(rs.getInt("quantity"));
				cart.setDate(rs.getDate("date"));
				cartList.add(cart);
			}
			return cartList;}
			} catch (Exception e) {e.printStackTrace();}
			return null;
	}
	
	@Override
	public void insert(CartModel cart) {
		String sql = "INSERT INTO [Cart](productid, userid, quantity, date) VALUES (?,?,?,?)";
				try (
				Connection conn = new DBConnect().getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);){
				ps.setInt(1, cart.getProductid());
				ps.setInt(2, cart.getUserid());
				ps.setInt(3, cart.getQuantity());
				ps.setDate(4, cart.getDate());
				ps.executeUpdate();
				} catch (Exception e) {e.printStackTrace();}
		
	}
	
	@Override
	public void update(CartModel cart) {
		String sql = "update Cart set quantity=?, date=? where productid=? and userid=?";
		try (
			Connection conn = new DBConnect().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);){
			ps.setInt(1, cart.getQuantity());
			ps.setDate(2, cart.getDate());
			ps.setInt(3, cart.getProductid());
			ps.setInt(4, cart.getUserid());
			ps.executeUpdate();
		} catch (Exception e) {e.printStackTrace();}
	}
	
	@Override
	public void delete(int productId, int userId) {
		String sql = "DELETE FROM Cart WHERE productid=? and userid=?";
		try (
			Connection conn = new DBConnect().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);){
			ps.setInt(1, productId);
			ps.setInt(1, userId);
			ps.executeUpdate();
		} catch (Exception e) {e.printStackTrace();}
	}
	
	@Override
	public boolean checkExistCart(int productId, int userId) {
		boolean duplicate = false;
		String query = "select * from [Cart] where productId = ? and userid=?";
		try (
			Connection conn = new DBConnect().getConnection();
			PreparedStatement ps = conn.prepareStatement(query);){
			ps.setInt(1, productId);
			ps.setInt(2, userId);
			try(ResultSet rs = ps.executeQuery()){
		if (rs.next()) {
		duplicate = true;
		}
		}} catch (Exception ex) {}
		return duplicate;

	}
}
