package alotra.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import alotra.models.CartItemDTO;
import alotra.models.DTOProductModel;
import alotra.services.ProductService;
import alotra.services.impl.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/add-cart"})
public class AddCartController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productName = req.getParameter("name");
        String quantityStr = req.getParameter("quantity");
        int quantity = (quantityStr != null && !quantityStr.isEmpty()) ? Integer.parseInt(quantityStr) : 1;

        ProductService productService = new ProductServiceImpl();
        DTOProductModel productDetail = productService.getProductDetail(productName);

        if (productDetail != null) {
            HttpSession session = req.getSession();
            List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
            }

            boolean isExist = false;
            for (CartItemDTO item : cart) {
                if (item.getProductId() == productDetail.getId()) {
                    item.setQuantity(item.getQuantity() + quantity);
                    isExist = true;
                    break;
                }
            }

            if (!isExist) {
                // TRUYỀN THÊM productDetail.getImage() VÀO ĐÂY
                cart.add(new CartItemDTO(
                    productDetail.getId(), 
                    productDetail.getName(), 
                    productDetail.getPrice(), 
                    quantity,
                    productDetail.getImage() 
                ));
            }

            double totalCartPrice = 0;
            for (CartItemDTO item : cart) {
                totalCartPrice += item.getPrice() * item.getQuantity();
            }

            session.setAttribute("cart", cart);
            session.setAttribute("totalPrice", totalCartPrice);
        }
        resp.sendRedirect(req.getContextPath() + "/home");
    }
}