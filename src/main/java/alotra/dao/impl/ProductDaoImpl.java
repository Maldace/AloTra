package alotra.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import alotra.configs.DBConnect;
import alotra.dao.ProductDao;
import alotra.models.DTOProductModel;
import alotra.models.ProductModel;

public class ProductDaoImpl implements ProductDao {
	@Override
    public List<DTOProductModel> getProductsPerPage(int pageIndex, int pageSize) {
        // Tính toán số hàng cần bỏ qua
        int offset = (pageIndex - 1) * pageSize;
        
        // SQL Server: Phân trang dùng OFFSET và FETCH
        String sql = "select p.id as id, p.name as product_name, p.price, p.inventory, c.name as category_name, s.name as supplier_name, p.image " +
                     "from Products p " +
                     "inner join Categories c on p.categoryid=c.id " +
                     "inner join Suppliers s on p.supplierid=s.id " +
                     "order by p.id " + // Bắt buộc phải có ORDER BY khi dùng OFFSET
                     "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        
        List<DTOProductModel> listProduct = new ArrayList<>();
        try (
            Connection conn = new DBConnect().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
        ) {
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    DTOProductModel product = new DTOProductModel();
                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("product_name"));
                    product.setPrice(rs.getInt("price"));
                    product.setInventory(rs.getInt("inventory"));
                    product.setCategoryName(rs.getString("category_name"));
                    product.setSupplierName(rs.getString("supplier_name"));
                    product.setImage(rs.getString("image"));
                    listProduct.add(product);
                }
            }
            return listProduct;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listProduct;
    }
	
	@Override
	public List<DTOProductModel> getAllProduct() {
		String sql = "select p.id as id, p.name as product_name, p.price, p.inventory, c.name as category_name, s.name as supplier_name, p.image from Products p inner join Categories c on p.categoryid=c.id inner join Suppliers s on p.supplierid=s.id ";
		try (
			Connection conn = new DBConnect().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();){
			List<DTOProductModel> listProduct = new ArrayList<DTOProductModel>();
			while (rs.next()) {
				DTOProductModel product = new DTOProductModel();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("product_name"));
				product.setPrice(rs.getInt("price"));
				product.setInventory(rs.getInt("inventory"));
				product.setCategoryName(rs.getString("category_name"));
				product.setSupplierName(rs.getString("supplier_name"));
				product.setImage(rs.getString("image"));
				listProduct.add(product);
			}
			return listProduct;
			} catch (Exception e) {e.printStackTrace();}
			return null;
	}
	
	@Override
	public void insert(ProductModel product) {
		String sql = "INSERT INTO [Products](name, price, inventory, categoryid, supplierid, image) VALUES (?,?,?,?,?,?)";
				try (
				Connection conn = new DBConnect().getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);){
				ps.setString(1, product.getName());
				ps.setDouble(2, product.getPrice());
				ps.setInt(3, product.getInventory());
				ps.setInt(4, product.getCategoryId());
				ps.setInt(5, product.getSupplierId());
				ps.setString(6, product.getImage());
				ps.executeUpdate();
				} catch (Exception e) {e.printStackTrace();}
		
	}
	
	@Override
	public void update(ProductModel product) {
		String sql = "update Products set name=?, price=?, inventory =?, categoryid=?, supplierid=?, image=? where id =?";
		try (
			Connection conn = new DBConnect().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);){
			ps.setString(1, product.getName());
			ps.setDouble(2, product.getPrice());
			ps.setInt(3, product.getInventory());
			ps.setInt(4, product.getCategoryId());
			ps.setInt(5, product.getSupplierId());
			ps.setString(6, product.getImage());
			ps.setInt(7, product.getId());
			ps.executeUpdate();
		} catch (Exception e) {e.printStackTrace();}
	}
	
	@Override
	public void delete(String productName) {
		String sql = "DELETE FROM Products WHERE name=?";
		try (
			Connection conn = new DBConnect().getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);){
			ps.setString(1, productName);
			ps.executeUpdate();
		} catch (Exception e) {e.printStackTrace();}
	}
	
	@Override
	public DTOProductModel getAProduct(String productName) {
		String sql = "select p.id as id, p.name as product_name, p.price, p.inventory, p.categoryid, c.name as category_name, p.supplierid, s.name as supplier_name,  p.image from Products p inner join Categories c on p.categoryid=c.id inner join Suppliers s on p.supplierid=s.id WHERE p.name = ? ";
		try (
		Connection conn = new DBConnect().getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);){
		ps.setString(1, productName);
		try(ResultSet rs = ps.executeQuery()){
		while (rs.next()) {
			DTOProductModel product = new DTOProductModel();
			product.setId(rs.getInt("id"));
			product.setName(rs.getString("product_name"));
			product.setPrice(rs.getInt("price"));
			product.setInventory(rs.getInt("inventory"));
			product.setCategoryName(rs.getString("category_name"));
			product.setSupplierName(rs.getString("supplier_name"));
			product.setImage(rs.getString("image"));
			product.setCategoryId(rs.getInt("categoryid"));
			product.setSupplierId(rs.getInt("supplierid"));
		return product;}}
		} catch (Exception e) {e.printStackTrace();}
		return null;
	}
	
	@Override
	public List<DTOProductModel> findByCategory(String categoryName) {
		String sql = "select p.id as id, p.name as product_name, p.price, p.inventory, c.name as category_name, s.name as supplier_name, p.image from Products p inner join Categories c on p.categoryid=c.id inner join Suppliers s on p.supplierid=s.id WHERE c.name = ? ";
		try (
		Connection conn = new DBConnect().getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);){
		ps.setString(1, categoryName);
		List<DTOProductModel> listProduct = new ArrayList<DTOProductModel>();
		try(ResultSet rs = ps.executeQuery()){
		while (rs.next()) {
			DTOProductModel product = new DTOProductModel();
			product.setId(rs.getInt("id"));
			product.setName(rs.getString("product_name"));
			product.setPrice(rs.getInt("price"));
			product.setInventory(rs.getInt("inventory"));
			product.setCategoryName(rs.getString("category_name"));
			product.setSupplierName(rs.getString("supplier_name"));
			product.setImage(rs.getString("image"));
			listProduct.add(product);}
		return listProduct;}
		} catch (Exception e) {e.printStackTrace();}
		return null;
	}
	
	@Override
	public List<DTOProductModel> findBySupplier(String supplierName) {
		String sql = "select p.id as id, p.name as product_name, p.price, p.inventory, c.name as category_name, s.name as supplier_name, p.image from Products p inner join Categories c on p.categoryid=c.id inner join Suppliers s on p.supplierid=s.id WHERE s.name = ? ";
		try (
		Connection conn = new DBConnect().getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);){
		ps.setString(1, supplierName);
		List<DTOProductModel> listProduct = new ArrayList<DTOProductModel>();
		try(ResultSet rs = ps.executeQuery()){
		while (rs.next()) {
			DTOProductModel product = new DTOProductModel();
			product.setId(rs.getInt("id"));
			product.setName(rs.getString("product_name"));
			product.setPrice(rs.getInt("price"));
			product.setInventory(rs.getInt("inventory"));
			product.setCategoryName(rs.getString("category_name"));
			product.setSupplierName(rs.getString("supplier_name"));
			product.setImage(rs.getString("image"));
			listProduct.add(product);}
		return listProduct;}
		} catch (Exception e) {e.printStackTrace();}
		return null;
	}
	
	@Override
	public List<DTOProductModel> searchProduct(String searchString) {
		String sql = "select p.id as id, p.name as product_name, p.price, p.inventory, c.name as category_name, s.name as supplier_name, p.image from Products p inner join Categories c on p.categoryid=c.id inner join Suppliers s on p.supplierid=s.id WHERE p.name like ? ";
		try (
		Connection conn = new DBConnect().getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);){
		ps.setString(1, "%"+ searchString+ "%");
		List<DTOProductModel> listProduct = new ArrayList<DTOProductModel>();
		try(ResultSet rs = ps.executeQuery()){
		while (rs.next()) {
			DTOProductModel product = new DTOProductModel();
			product.setId(rs.getInt("id"));
			product.setName(rs.getString("product_name"));
			product.setPrice(rs.getInt("price"));
			product.setInventory(rs.getInt("inventory"));
			product.setCategoryName(rs.getString("category_name"));
			product.setSupplierName(rs.getString("supplier_name"));
			product.setImage(rs.getString("image"));
			listProduct.add(product);}
		return listProduct;}
		} catch (Exception e) {e.printStackTrace();}
		return null;
	}
	
	@Override
	public boolean checkExistProduct(String name) {
		boolean duplicate = false;
		String query = "select * from [Products] where name = ?";
		try (
			Connection conn = new DBConnect().getConnection();
			PreparedStatement ps = conn.prepareStatement(query);){
			ps.setString(1, name);
			try(ResultSet rs = ps.executeQuery()){
		if (rs.next()) {
		duplicate = true;
		}
		}} catch (Exception ex) {}
		return duplicate;

	}

	@Override
	public int countAll() {
		// TODO Auto-generated method stub
		return 0;
	}

}
