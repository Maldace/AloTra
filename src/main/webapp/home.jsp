<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang Chủ Alo Tèo</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
    <link rel="stylesheet" 
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" 
          integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLMDJc5fN9z1b44k8yU6h5E9Jz5p+1W8c+1gV4aN6vB4h4k4wP4x8zY5t4i4z4wZg==" 
          crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

<nav class="navbar navbar-expand-lg sticky-top" style="background-color: #f7f7f7; border-bottom: 1px solid #eee;">
    <div class="container-fluid container-lg">
        
        <a class="navbar-brand me-5" href="#">
           <img src="${pageContext.request.contextPath}/img/HOME/LOGO.png" height="35">
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
                    <a class="nav-link" href="#" style="color: #654d3c; font-weight: 600;">LIÊN HỆ</a>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>

</body>
</html>