package alotra.models;

import java.io.Serializable;

public class CartItemDTO implements Serializable {
    private int productId;
    private String productName;
    private double price;
    private int quantity;
    private String image; // Thêm trường này để lưu tên file ảnh

    public CartItemDTO(int productId, String productName, double price, int quantity, String image) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
    }

    // Getter và Setter
    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }
    
    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }
    
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    
    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }
}