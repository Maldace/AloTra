package alotra.models;

import java.io.Serializable;

public class DTOProductModel implements Serializable{

	private int id;
    private String name;
    private double price;
    private int inventory;
    private String categoryName;
    private String supplierName;
    
	public DTOProductModel() {
		super();
	}

	public DTOProductModel(int id, String name, double price, int inventory, String categoryName, String supplierName) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.inventory = inventory;
		this.categoryName = categoryName;
		this.supplierName = supplierName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getInventory() {
		return inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
    
    
}
