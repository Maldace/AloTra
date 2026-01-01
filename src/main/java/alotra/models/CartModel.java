package alotra.models;

import java.sql.Date;

public class CartModel {

	private int productid;
    private int userid;
    private int quantity;
    private Date date;
    
	public CartModel() {
		super();
	}

	public CartModel(int productid, int userid, int quantity, Date date) {
		super();
		this.productid = productid;
		this.userid = userid;
		this.quantity = quantity;
		this.date = date;
	}

	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
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

    
}
