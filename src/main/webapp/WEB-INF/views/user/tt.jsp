<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:if test="${not empty successMessage}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        ${successMessage} <!-- nội dung thông báo -->
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button> <!-- nút đóng -->
    </div>
</c:if>
<div class="container py-5">
    <div class="row">
        <div class="col-lg-7">
            <div class="card">
                <div class="card-header">
                    <span>Thông tin giao hàng</span>
                    <i class="fa-solid fa-chevron-down text-muted small"></i>
                </div>
                <div class="card-body px-4">
                    <div class="form-group-custom">
                        <i class="fa-solid fa-user"></i>
                        <input type="text" class="form-control-custom" placeholder="Tên người nhận">
                    </div>
                    <div class="form-group-custom">
                        <i class="fa-solid fa-phone"></i>
                        <input type="text" class="form-control-custom" placeholder="Số điện thoại người nhận">
                    </div>
                    <div class="text-muted small mt-4 mb-1">Giao đến</div>
                    <div class="form-group-custom">
                        <i class="fa-solid fa-location-dot"></i>
                        <input type="text" class="form-control-custom" placeholder="Địa chỉ người nhận">
                    </div>
                    <div class="form-group-custom">
                        <i class="fa-solid fa-pen-to-square"></i>
                        <input type="text" class="form-control-custom" placeholder="Ghi chú địa chỉ...">
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <span>Phương thức thanh toán</span>
                    <i class="fa-solid fa-chevron-down text-muted small"></i>
                </div>
                <div class="card-body px-4">
                    <div class="form-check d-flex align-items-center">
                        <input class="form-check-input me-3" type="radio" name="payment" id="cod" checked>
                        <label class="form-check-label" for="cod">Thanh toán khi nhận hàng</label>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-5">
            <div class="card">
                <div class="card-header">
                    <span>Thông tin đơn hàng</span>
                    <i class="fa-solid fa-chevron-down text-muted small"></i>
                </div>
                <div class="card-body px-4">
                    <div class="d-flex justify-content-between align-items-center mb-4 pb-2 border-bottom">
                        <span class="fw-medium"><i class="fa-solid fa-shop me-2 text-muted"></i> Cửa hàng Alo Tra</span>
                    </div>

                    <form action="buy" method="post">
                    <c:forEach items="${sessionScope.cart}" var="item">
                        <div class="d-flex mb-4">
                            <img src="${pageContext.request.contextPath}/img/products/${item.image}" 
                                 class="product-img me-3" alt="${item.productName}">
                            
                            <div class="flex-grow-1">
                                <h6 class="mb-1 fw-bold" style="font-size: 0.95rem;">${item.productName} (M)</h6>
                                <small class="text-muted d-block mb-1">100% đường, 100% đá</small>
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="fw-bold small">${item.price}đ x ${item.quantity}</span>
                                    <span class="fw-bold">${item.price * item.quantity}đ</span>
                                    <input type="hidden" name="productId" value="${item.productId}">
                                    <input type="hidden" name="quantity" value="${item.quantity}">
                                    <input type="hidden" name="price" value="${item.price}">
                                    <input type="hidden" name="productName" value="${item.productName}">
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <div class="d-flex justify-content-between align-items-center border-top border-bottom py-3 my-3">
                        <span class="small fw-medium"><i class="fa-solid fa-ticket me-2 text-muted"></i> Mã khuyến mãi</span>
                        <button class="btn promo-btn">Thêm khuyến mãi</button>
                    </div>

                    <div class="summary-details">
                        <div class="d-flex justify-content-between mb-2 small">
                            <span class="text-muted">Số lượng món: ${sessionScope.cart.size()}</span>
                            <span>Tổng: <strong>${sessionScope.totalPrice}đ</strong></span>
                        </div>
                        <div class="d-flex justify-content-between mb-2 small">
                            <span class="text-muted">Phí vận chuyển:</span>
                            <span>0đ</span>
                        </div>
                        <div class="d-flex justify-content-between mt-4 align-items-center">
                            <h5 class="fw-bold mb-0">Tổng cộng:</h5>
                            <h5 class="fw-bold mb-0 text-dark">${sessionScope.totalPrice}đ</h5>
                        </div>
                    </div>

                    <textarea class="form-control mt-4 bg-light border-0 small" rows="2" placeholder="Thêm ghi chú..." style="border-radius: 10px; resize: none;"></textarea>

                    <div class="d-grid mt-4">
                        <button class="btn btn-order text-uppercase">Đặt hàng</button>
                        </form>
                        <a href="home" class="btn btn-continue text-uppercase">Tiếp tục mua hàng</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>