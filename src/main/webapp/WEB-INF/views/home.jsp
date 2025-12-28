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
    <link rel="stylesheet" 
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" 
          integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLMDJc5fN9z1b44k8yU6h5E9Jz5p+1W8c+1gV4aN6vB4h4k4wP4x8zY5t4i4z4wZg==" 
          crossorigin="anonymous" referrerpolicy="no-referrer" />
          
    <style>
        .category-sidebar .list-group-item {
            cursor: pointer;
            border: none;
            padding: 10px 15px;
            font-size: 14px;
            color: #555;
            transition: background-color 0.2s;
        }

        .category-sidebar .list-group-item:hover {
            background-color: #f8f9fa;
            color: #333;
        }

        .category-sidebar .list-group-item.active-category {
            font-weight: bold;
            color: #8c5d33;
            background-color: #fff8f0;
            border-left: 3px solid #8c5d33;
        }

        .category-header {
            font-size: 16px;
            font-weight: bold;
            color: #654d3c;
            padding: 15px 15px 10px 15px;
            border-bottom: 2px solid #eee;
            margin-bottom: 0;
        }
        
        .product-card .card-body {
            padding-top: 5px;
            padding-bottom: 15px;
        }
        
        .cart-sidebar {
            background-color: #f8f8f8;
            padding: 20px;
        }
        /* Chỉ thêm con trỏ chuột cho thẻ card */
        .product-card { cursor: pointer; }
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
                <li class="nav-item me-3">
                    <a class="nav-link active" aria-current="page" href="#" style="color: #654d3c; font-weight: 600;">TRANG CHỦ</a>
                </li>
                
                <li class="nav-item dropdown me-3">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
                       data-bs-toggle="dropdown" aria-expanded="false" style="color: #654d3c; font-weight: 600;">
                        SẢN PHẨM
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Sữa Tươi</a></li>
                        <li><a class="dropdown-item" href="#">Sữa Bột</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Sữa Chua & Váng Sữa</a></li>
                    </ul>
                </li>

                <li class="nav-item me-3">
                    <a class="nav-link" href="#" style="color: #654d3c; font-weight: 600;">TIN KHUYẾN MÃI</a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link" href="#" style="color: #654d3c; font-weight: 600;">VỀ CHÚNG TÔI</a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link" href="contact.jsp" style="color: #654d3c; font-weight: 600;">LIÊN HỆ</a>
                </li>
                 <li class="nav-item me-3">
                    <a class="nav-link" href="login.jsp" style="color: #654d3c; font-weight: 600;">ĐĂNG NHẬP</a>
                </li>
                 <li class="nav-item me-3">
                    <a class="nav-link" href="register.jsp" style="color: #654d3c; font-weight: 600;">ĐĂNG KÍ</a>
                </li>
            </ul>
            
            <ul class="navbar-nav d-flex align-items-center">
                <li class="nav-item me-3">
                    <a class="nav-link" href="#">
                        <i class="fa-solid fa-cart-shopping" style="color: #654d3c; font-size: 1.1rem;"></i>
                    </a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link" href="#">
                        <i class="fa-solid fa-user" style="color: #654d3c; font-size: 1.1rem;"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fa-solid fa-magnifying-glass" style="color: #654d3c; font-size: 1.1rem;"></i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<header class="p-5 text-center bg-light" style="background-color: #fcf4e6 !important;">
    <div class="container">
        <h1 class="display-4" style="color: #654d3c; font-weight: 800; margin-bottom: 15px;">
            CHÀO MỪNG ĐẾN VỚI HỆ THỐNG ALOTRA
        </h1>
        
        <p class="lead text-secondary fs-5">
            Sản phẩm tươi mới mỗi ngày, đảm bảo chất lượng tuyệt vời cho gia đình bạn.
        </p>
        
        <a href="#" class="btn btn-primary btn-lg shadow-sm mt-3 px-5" 
           style="background-color: #8c5d33; border: none; font-weight: 600;">
            KHÁM PHÁ SẢN PHẨM <i class="fa-solid fa-bottle-droplet ms-2"></i>
        </a>
    </div>
</header>

<div class="container-lg my-5">
    <div class="row">
        
        <div class="col-lg-3">
            <div class="category-sidebar border rounded shadow-sm">
                
                <p class="category-header">DANH MỤC</p>
                
                <div class="list-group list-group-flush">
                    <div class="list-group-item d-flex justify-content-between active-category">
                        Món Nổi Bật
                        <span class="badge text-bg-light text-secondary">68</span>
                    </div>
                    
                    <div class="list-group-item d-flex justify-content-between">
                        Combo
                        <span class="badge text-bg-light text-secondary">0</span>
                    </div>
                    <div class="list-group-item d-flex justify-content-between">
                        Trà Sữa
                        <span class="badge text-bg-light text-secondary">38</span>
                    </div>
                    <div class="list-group-item d-flex justify-content-between">
                        Fresh Fruit Tea
                        <span class="badge text-bg-light text-secondary">19</span>
                    </div>
                    <div class="list-group-item d-flex justify-content-between">
                        Macchiato Cream Cheese
                        <span class="badge text-bg-light text-secondary">4</span>
                    </div>
                    <div class="list-group-item d-flex justify-content-between">
                        Ice Cream
                        <span class="badge text-bg-light text-secondary">0</span>
                    </div>
                    <div class="list-group-item d-flex justify-content-between">
                        Special Menu
                        <span class="badge text-bg-light text-secondary">18</span>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-lg-6 product-content">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h4 class="mb-0" style="color: #4a4a4a; font-weight: 600;">Món Nổi Bật</h4>
                <select class="form-select w-auto" style="border-color: #ccc;">
                    <option selected>Miền Nam</option>
                    <option>Miền Bắc</option>
                    <option>Miền Trung</option>
                </select>
            </div>
            
            <div class="row row-cols-2 row-cols-md-3 g-3">
                
                <c:forEach items="${products}" var="i" varStatus="st">
                	<c:if test="${st.index < 8}">
                    <div class="col">
                        <div class="card h-100 product-card shadow-sm border-0 text-center" 
                             data-bs-toggle="modal" data-bs-target="#modalProd${st.index}">
                            <img src="${pageContext.request.contextPath}/img/products/${i.image}"
                                 class="card-img-top p-2" alt="Sản phẩm" 
                                 style="height: 150px; object-fit: contain;">
                            
                            <div class="card-body">
                                <h6 class="card-title fw-bold" style="color: #333;"><p> ${i.name}</p> </h6>
                                
                                <p class="card-text text-danger fw-bold fs-6 my-2">
                                    <p>Giá: ${i.price}</p>
                                </p>
                                
                                <button type="button" class="btn btn-sm" 
                                   style="background-color: #f7f7f7; color: #8c5d33; border: 1px solid #ddd; border-radius: 50%;">
                                    <i class="fa-solid fa-plus"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="modalProd${st.index}" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-lg">
                            <div class="modal-content text-start">
                                <div class="modal-header border-0 pb-0">
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body pt-0">
                                    <div class="row">
                                        <div class="col-md-5 text-center">
                                            <img src="${pageContext.request.contextPath}/img/products/${i.image}" class="img-fluid rounded border p-2" style="max-height: 350px;">
                                        </div>
                                        <div class="col-md-7">
                                            <h3 class="fw-bold" style="color: #654d3c;">${i.name}</h3>
                                            <h4 class="text-danger fw-bold">${i.price}₫</h4>
                                            <p class="text-muted small">Mô tả sản phẩm: Tươi mới, thơm ngon cho mỗi ngày.</p>
                                            
                                            <div class="d-flex align-items-center gap-2 mb-4">
                                                <div class="input-group w-auto border rounded">
                                                    <button class="btn btn-light btn-sm">-</button>
                                                    <input type="text" class="form-control form-control-sm text-center border-0" value="1" style="width: 40px;">
                                                    <button class="btn btn-light btn-sm">+</button>
                                                </div>
                                                <button class="btn w-100 fw-bold" style="background-color: #e6c89c; color: #654d3c;">+ ${i.price}₫</button>
                                            </div>

                                            <p class="fw-bold mb-1">Chọn loại</p>
                                            <div class="form-check mb-3"><input class="form-check-input" type="radio" checked><label class="form-check-label">Lạnh</label></div>

                                            <p class="fw-bold mb-1">Chọn size</p>
                                            <div class="d-flex gap-4">
                                                <div class="form-check"><input class="form-check-input" type="radio" name="size${st.index}" checked><label class="form-check-label">Size M</label></div>
                                                <div class="form-check"><input class="form-check-input" type="radio" name="size${st.index}"><label class="form-check-label">Size L</label></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:if>
                </c:forEach>
                 
                </div>
        </div>
        
        <div class="col-lg-3">
            <div class="cart-sidebar border rounded shadow-sm h-100">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h5 class="mb-0" style="color: #654d3c; font-weight: 600;">GIỎ HÀNG CỦA TÔI</h5>
                    <a href="#" class="text-secondary small">Xóa tất cả</a>
                </div>
                
                <div class="text-center py-5">
                    <p class="text-muted">Chưa có sản phẩm nào!</p>
                    <p class="fw-bold fs-4 my-3" style="color: #8c5d33;">
                        x 0 = 0₫
                    </p>
                    <button class="btn w-100 shadow-sm" style="background-color: #e6c89c; color: #654d3c; font-weight: 600;">
                        Thanh toán
                    </button>
                </div>
                
                </div>
        </div>
        
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>

</body>
</html>