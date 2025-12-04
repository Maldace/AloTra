package alotra.models;

import java.io.Serializable;

public class ProductModel implements Serializable {
    private int id;
    private String name;
    private double price;
    private int inventory;
    private int categoryId;
    private int supplierId;

    public ProductModel() {}

    public ProductModel(int id, String name, double price, int inventory, int categoryId, int supplierId) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.inventory = inventory;
        this.categoryId = categoryId;
        this.supplierId = supplierId;
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

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }
}