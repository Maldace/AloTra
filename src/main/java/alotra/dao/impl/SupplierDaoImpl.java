package alotra.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import alotra.configs.DBConnect;
import alotra.dao.SupplierDao;
import alotra.models.SupplierModel;

public class SupplierDaoImpl implements SupplierDao {

	@Override
	public List<SupplierModel> getAllSuppliers() {
		String sql = "select * from Suppliers";
		try (
			Connection conn = new DBConnect().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();){
			List<SupplierModel> listSupplier = new ArrayList<SupplierModel>();
			while (rs.next()) {
				SupplierModel supplier = new SupplierModel();
				supplier.setId(rs.getInt("id"));
				supplier.setName(rs.getString("name"));
				supplier.setPhone(rs.getString("phone"));
				supplier.setAddress(rs.getString("address"));
				listSupplier.add(supplier);
			}
			return listSupplier;
			} catch (Exception e) {e.printStackTrace();}
			return null;
	}
	
	@Override
	public void insert(SupplierModel supplier) {
		String sql = "INSERT INTO [Suppliers](name, phone, address) VALUES (?,?,?)";
				try (
				Connection conn = new DBConnect().getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);){
				ps.setString(1, supplier.getName());
				ps.setString(2, supplier.getPhone());
				ps.setString(3, supplier.getAddress());
				ps.executeUpdate();
				} catch (Exception e) {e.printStackTrace();}
		
	}
	
	@Override
	public void update(SupplierModel supplier) {
		String sql = "update Suppliers set name=?, phone=?, address=? where id =?";
		try (
			Connection conn = new DBConnect().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);){
			ps.setString(1, supplier.getName());
			ps.setString(2, supplier.getPhone());
			ps.setString(3, supplier.getAddress());
			ps.setInt(4, supplier.getId());
			ps.executeUpdate();
		} catch (Exception e) {e.printStackTrace();}
	}
	
	@Override
	public void delete(String supplierName) {
		String sql = "DELETE FROM Suppliers WHERE name=?";
		try (
			Connection conn = new DBConnect().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);){
			ps.setString(1, supplierName);
			ps.executeUpdate();
		} catch (Exception e) {e.printStackTrace();}
	}
	
	@Override
	public SupplierModel getASupplier(String supplierName) {
		String sql = "SELECT * FROM [Suppliers] WHERE name = ? ";
		try (
		Connection conn = new DBConnect().getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);){
		ps.setString(1, supplierName);
		try(ResultSet rs = ps.executeQuery()){
		while (rs.next()) {
		SupplierModel supplier = new SupplierModel();
		supplier.setId(rs.getInt("id"));
		supplier.setName(rs.getString("name"));
		supplier.setPhone(rs.getString("phone"));
		supplier.setAddress(rs.getString("address"));
		return supplier;}}
		} catch (Exception e) {e.printStackTrace();}
		return null;
	}
}
