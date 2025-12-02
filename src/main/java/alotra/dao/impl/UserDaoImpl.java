package alotra.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import alotra.configs.DBConnect;
import alotra.dao.UserDao;
import alotra.models.UserModel;
import alotra.controllers.users.User;

public class UserDaoImpl implements UserDao {

	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;

	
	@Override
	public UserModel findByUserName(String username) {
		String sql = "SELECT * FROM [Users] WHERE username = ? ";
		try {
		conn = new DBConnect().getConnection();
		ps = conn.prepareStatement(sql);
		ps.setString(1, username);
		rs = ps.executeQuery();
		while (rs.next()) {
		UserModel user = new UserModel();
		user.setId(rs.getInt("id"));
		user.setEmail(rs.getString("email"));
		user.setUserName(rs.getString("username"));
		user.setFullName(rs.getString("fullname"));
		user.setPassWord(rs.getString("password"));
		user.setAvatar(rs.getString("avatar"));
		user.setRoleid(Integer.parseInt(rs.getString("roleid")));
		user.setPhone(rs.getString("phone"));
		user.setCreatedDate(rs.getDate("createddate"));
		return user;}
		} catch (Exception e) {e.printStackTrace();}
		return null;
	}


	@Override
	public void insert(User user) {
		String sql = "INSERT INTO [Users](email, username, fullname, password, avatar, roleid, phone, createddate) VALUES (?,?,?,?,?,?,?,?)";
				try {
				conn = new DBConnect().getConnection();
				ps = conn.prepareStatement(sql);
				ps.setString(1, user.getEmail());
				ps.setString(2, user.getUserName());
				ps.setString(3, user.getFullName());
				ps.setString(4, user.getPassWord());
				ps.setString(5, user.getAvatar());
				ps.setInt(6,user.getRoleid());
				ps.setString(7,user.getPhone());
				ps.setDate(8, user.getCreatedDate());
				ps.executeUpdate();
				} catch (Exception e) {e.printStackTrace();}
		
	}


	@Override
	public boolean checkExistEmail(String email) {
		boolean duplicate = false;
		String query = "select * from [Users] where email = ?";
		try {
		conn = new DBConnect().getConnection();
		ps = conn.prepareStatement(query);
		ps.setString(1, email);
		rs = ps.executeQuery();
		if (rs.next()) {
		duplicate = true;
		}
		ps.close();
		conn.close();
		} catch (Exception ex) {}
		return duplicate;

	}


	@Override
	public boolean checkExistUsername(String username) {
		boolean duplicate = false;
		String query = "select * from [Users] where username = ?";
		try {
		conn = new DBConnect().getConnection();
		ps = conn.prepareStatement(query);
		ps.setString(1, username);
		rs = ps.executeQuery();
		if (rs.next()) {
		duplicate = true;
		}
		ps.close();
		conn.close();
		} catch (Exception ex) {}
		return duplicate;

	}


	@Override
	public boolean checkExistPhone(String phone) {
		boolean duplicate = false;
		String query = "select * from [Users] where phone = ?";
		try {
		conn = new DBConnect().getConnection();
		ps = conn.prepareStatement(query);
		ps.setString(1, phone);
		rs = ps.executeQuery();
		if (rs.next()) {
		duplicate = true;
		}
		ps.close();
		conn.close();
		} catch (Exception ex) {}
		return duplicate;
	}
	
	@Override
	public void changePassword(UserModel user, String password) {
		String sql = "update Users set password =? where username =?";
		try {
			conn = new DBConnect().getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, user.getUserName());
			ps.executeUpdate();
		} catch (Exception e) {e.printStackTrace();}
	}
	
	@Override
	public void accountManager(UserModel user) {
		String sql = "update Users set email=?, fullname=?, password =?, avatar=?, phone=? where username =?";
		try {
			conn = new DBConnect().getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getEmail());
			ps.setString(2, user.getFullName());
			ps.setString(3, user.getPassWord());
			ps.setString(4, user.getAvatar());
			ps.setString(5, user.getPhone());
			ps.setString(6, user.getUserName());
			ps.executeUpdate();
		} catch (Exception e) {e.printStackTrace();}
	}

}