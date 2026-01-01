package alotra.dao;

import java.util.List;

import alotra.models.CartModel;

public interface CartDao {

	List<CartModel> getUserCart(int userid);

	void insert(CartModel cart);

	void update(CartModel cart);

	void delete(int productId, int userId);

	boolean checkExistCart(int productId, int userId);

}
