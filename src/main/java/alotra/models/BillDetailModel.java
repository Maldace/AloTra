package alotra.models;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

public class BillDetailModel implements Serializable {
    private int productId;
    private int buyerId;
    private int quantity;
    private Date date;
    private Time time;
    private double price;

    public BillDetailModel() {}

    public BillDetailModel(int productId, int buyerId, int quantity, Date date, Time time, double price) {
        this.productId = productId;
        this.buyerId = buyerId;
        this.quantity = quantity;
        this.date = date;
        this.time = time;
        this.price = price;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(int buyerId) {
        this.buyerId = buyerId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
    
    
}