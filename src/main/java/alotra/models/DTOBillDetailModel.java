package alotra.models;

import java.sql.Date;
import java.sql.Time;

public class DTOBillDetailModel {

	private String productName;
    private String buyerName;
    private int quantity;
    private Date date;
    private Time time;
    private int price;
    
	public DTOBillDetailModel() {
		super();
	}

	public DTOBillDetailModel(String productName, String buyerName, int quantity, Date date, Time time, int price) {
		super();
		this.productName = productName;
		this.buyerName = buyerName;
		this.quantity = quantity;
		this.date = date;
		this.time = time;
		this.price = price;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
}
