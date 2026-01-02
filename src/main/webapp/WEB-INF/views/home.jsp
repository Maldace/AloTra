<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang Chủ Alo Tra</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home-style.css">
    
    <style>
        /* FIX 2: Ép các nút cộng trừ phải hiện rõ ràng */
        .cart-control-btn {
            color: #8fa7d5 !important;
            font-size: 1.5rem !important;
            text-decoration: none !important;
            display: inline-block !important;
            line-height: 1;
        }
        .cart-control-btn:hover {
            color: #7a96c9 !important;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg sticky-top" style="background-color: #f7f7f7; border-bottom: 1px solid #eee;">
    <div class="container-fluid container-lg">
        <a class="navbar-brand me-5" href="home">
            <img src="${pageContext.request.contextPath}/img/HOME/LOGO.png" height="35" alt="Logo">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar" 
                aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mainNavbar">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item me-3"><a class="nav-link active" href="#" style="color: #654d3c; font-weight: 600;">TRANG CHỦ</a></li>
                <li class="nav-item dropdown me-3">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" style="color: #654d3c; font-weight: 600;">SẢN PHẨM</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Sữa Tươi</a></li>
                        <li><a class="dropdown-item" href="#">Sữa Bột</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Sữa Chua & Váng Sữa</a></li>
                    </ul>
                </li>
                <li class="nav-item me-3"><a class="nav-link" href="#" style="color: #654d3c; font-weight: 600;">TIN KHUYẾN MÃI</a></li>
                <li class="nav-item me-3"><a class="nav-link" href="#" style="color: #654d3c; font-weight: 600;">VỀ CHÚNG TÔI</a></li>
                <li class="nav-item me-3"><a class="nav-link" href="contact.jsp" style="color: #654d3c; font-weight: 600;">LIÊN HỆ</a></li>
                <li class="nav-item me-3"><a class="nav-link" href="login.jsp" style="color: #654d3c; font-weight: 600;">ĐĂNG NHẬP</a></li>
                <li class="nav-item me-3"><a class="nav-link" href="register.jsp" style="color: #654d3c; font-weight: 600;">ĐĂNG KÍ</a></li>
            </ul>
        </div>
    </div>
</nav>

<header class="p-5 text-center bg-light" style="background-color: #fcf4e6 !important;">
    <div class="container">
        <h1 class="display-4" style="color: #654d3c; font-weight: 800;">CHÀO MỪNG ĐẾN VỚI HỆ THỐNG ALOTRA</h1>
        <p class="lead text-secondary fs-5">Sản phẩm tươi mới mỗi ngày, đảm bảo chất lượng tuyệt vời.</p>
    </div>
</header>

<div class="container-lg my-5">
    <div class="row">
        <div class="col-lg-3">
            <div class="category-sidebar border rounded shadow-sm">
                <p class="category-header">DANH MỤC</p>
                <div class="list-group list-group-flush">
                    <div class="list-group-item d-flex justify-content-between active-category">Món Nổi Bật <span class="badge text-bg-light">68</span></div>
                    <div class="list-group-item d-flex justify-content-between">Trà Sữa <span class="badge text-bg-light">38</span></div>
                </div>
            </div>
        </div>
        
        <div class="col-lg-6">
            <div class="row row-cols-2 row-cols-md-3 g-3">
                <c:forEach items="${products}" var="i" varStatus="st">
                    <div class="col">
                        <div class="card h-100 product-card shadow-sm border-0 text-center" data-bs-toggle="modal" data-bs-target="#modalProd${st.index}">
                            <img src="${pageContext.request.contextPath}/img/products/${i.image}" class="card-img-top p-2" style="height: 150px; object-fit: contain;">
                            <div class="card-body">
                                <h6 class="card-title fw-bold">${i.name}</h6>
                                <p class="text-danger fw-bold">${i.price}đ</p>
                                <button class="btn btn-sm" style="background-color: #f7f7f7; color: #8c5d33; border: 1px solid #ddd; border-radius: 50%;"><i class="fa-solid fa-plus"></i></button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="modal fade" id="modalProd${st.index}" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered modal-lg">
                            <div class="modal-content text-start">
                                <div class="modal-body p-4">
                                    <div class="row">
                                        <div class="col-md-5"><img src="${pageContext.request.contextPath}/img/products/${i.image}" class="img-fluid rounded border"></div>
                                        <div class="col-md-7">
                                            <h3 class="fw-bold">${i.name}</h3>
                                            <h4 class="text-danger fw-bold">${i.price}₫</h4>
                                            <form action="product" method="post">
                                                <div class="d-flex align-items-center gap-2 mb-4">
                                                    <input type="number" class="form-control w-25" name="quantity" value="1" min="1">
                                                    <input type="hidden" name="name" value="${i.name}">
                                                    <button type="submit" class="btn w-100 fw-bold" style="background-color: #e6c89c;">+ THÊM VÀO GIỎ</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        
        <div class="col-lg-3">
            <div class="cart-sidebar border rounded shadow-sm p-3 bg-white" style="position: sticky; top: 90px;">
                <div class="d-flex justify-content-between align-items-center mb-3">
    <h5 class="mb-0 fw-bold" style="color: #654d3c; font-size: 1.1rem;">GIỎ HÀNG CỦA TÔI</h5>
    <c:if test="${not empty sessionScope.cart}">
        <a href="${pageContext.request.contextPath}/update-cart?action=clearAll" class="text-secondary small text-decoration-none">
    Xóa tất cả
</a>
    </c:if>
</div>
                
                <div class="cart-content">
                    <c:choose>
                        <c:when test="${not empty sessionScope.cart}">
                            <div class="list-cart-items" style="max-height: 400px; overflow-y: auto;">
                                <c:forEach items="${sessionScope.cart}" var="item">
                                    <div class="item mb-3 pb-3 border-bottom d-flex justify-content-between align-items-center">
                                        <div style="flex: 1;">
                                            <p class="mb-0 fw-bold" style="color: #333; font-size: 0.9rem;">${item.productName}</p>
                                           
                                            <small class="text-muted">${item.price}đ x ${item.quantity} = <strong>${item.price * item.quantity}đ</strong></small>
                                        </div>
                                        
                                        <div class="d-flex align-items-center gap-2 ms-2">
                                            <a href="update-cart?id=${item.productId}&action=decrease" class="cart-control-btn">
                                                <i class="fa-solid fa-circle-minus"></i>
                                            </a>
                                            
                                            <span class="fw-bold" style="min-width: 15px; text-align: center;">${item.quantity}</span>
                                            
                                            <a href="update-cart?id=${item.productId}&action=increase" class="cart-control-btn">
                                                <i class="fa-solid fa-circle-plus"></i>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <div class="total-section mt-3">
                                <div class="d-flex align-items-center mb-3">
                                     <i class="fa-solid fa-mug-hot me-2 text-secondary" style="font-size: 1.3rem;"></i>
                                     <span class="fw-bold">x ${sessionScope.cart.size()} món = <span class="text-danger">${sessionScope.totalPrice}đ</span></span>
                                </div>
                                <form action="payment" method="post">
                                    <button type="submit" class="btn w-100 fw-bold py-2 shadow-sm" style="background-color: #dcb06b; color: white; border-radius: 20px; border: none;">
                                        THANH TOÁN NGAY
                                    </button>
                                </form>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="text-center py-5">
                                <i class="fa-solid fa-cart-shopping mb-2 text-muted" style="font-size: 2rem;"></i>
                                <p class="text-muted small">Giỏ hàng đang trống</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>