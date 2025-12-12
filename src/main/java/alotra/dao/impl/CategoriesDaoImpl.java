package alotra.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import alotra.configs.DBConnect;
import alotra.dao.CategoriesDao;
import alotra.models.CategoriesModel;
public class CategoriesDaoImpl  implements CategoriesDao{

	@Override
	public List<CategoriesModel> getAllCategories() {
		String sql = "select * from Categories";
		try (
			Connection conn = new DBConnect().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();){
			List<CategoriesModel> listCategory = new ArrayList<CategoriesModel>();
			while (rs.next()) {
				CategoriesModel category = new CategoriesModel();
				category.setId(rs.getInt("id"));
				category.setName(rs.getString("name"));
				listCategory.add(category);
			}
			return listCategory;
			} catch (Exception e) {e.printStackTrace();}
			return null;
	}
	
	@Override
	public void insert(CategoriesModel category) {
		String sql = "INSERT INTO [Categories](name) VALUES (?)";
				try (
				Connection conn = new DBConnect().getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);){
				ps.setString(1, category.getName());
				ps.executeUpdate();
				} catch (Exception e) {e.printStackTrace();}
		
	}
	
	@Override
	public void update(CategoriesModel category) {
		String sql = "update Categories set name=? where id =?";
		try (
			Connection conn = new DBConnect().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);){
			ps.setString(1, category.getName());
			ps.setInt(2, category.getId());
			ps.executeUpdate();
		} catch (Exception e) {e.printStackTrace();}
	}
	
	@Override
	public void delete(String categoryName) {
		String sql = "DELETE FROM Categories WHERE name=?";
		try (
			Connection conn = new DBConnect().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);){
			ps.setString(1, categoryName);
			ps.executeUpdate();
		} catch (Exception e) {e.printStackTrace();}
	}
	
	@Override
	public CategoriesModel getACategory(String categoryName) {
		String sql = "SELECT * FROM [Categories] WHERE name = ? ";
		try (
		Connection conn = new DBConnect().getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);){
		ps.setString(1, categoryName);
		try(ResultSet rs = ps.executeQuery()){
		while (rs.next()) {
		CategoriesModel category = new CategoriesModel();
		category.setId(rs.getInt("id"));
		category.setName(rs.getString("name"));
		return category;}}
		} catch (Exception e) {e.printStackTrace();}
		return null;
	}
}
