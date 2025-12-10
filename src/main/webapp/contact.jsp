<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Về Chúng Tôi - Alo Tra</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
    <link rel="stylesheet" 
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" 
          integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLMDJc5fN9z1b44k8yU6h5E9Jz5p+1W8c+1gV4aN6vB4h4k4wP4x8zY5t4i4z4wZg==" 
          crossorigin="anonymous" referrerpolicy="no-referrer" />
          
    <style>
        .page-header {
            background-image: url('${pageContext.request.contextPath}/img/bg-about.jpg'); /* Đổi thành ảnh nền phù hợp */
            background-size: cover;
            background-position: center;
            height: 300px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-shadow: 2px 2px 5px rgba(0,0,0,0.7);
        }
        .quote-section {
            background-color: #fcf4e6;
            padding: 50px 0;
            text-align: center;
        }
        .quote-section blockquote {
            font-size: 1.5rem;
            font-style: italic;
            color: #654d3c;
            border: none;
            max-width: 900px;
            margin: 0 auto;
        }
        .content-section img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .text-brown {
             color: #654d3c !important;
        }
        .text-primary-color {
            color: #8c5d33 !important;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg sticky-top" style="background-color: #f7f7f7; border-bottom: 1px solid #eee;">
    <div class="container-fluid container-lg">
        
        <a class="navbar-brand me-5" href="${pageContext.request.contextPath}/home.jsp">
           <img src="${pageContext.request.contextPath}/img/HOME/LOGO.png" height="35">
        </a>    
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar" 
                aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mainNavbar">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item me-3">
                    <a class="nav-link" href="${pageContext.request.contextPath}/home.jsp" style="color: #654d3c; font-weight: 600;">TRANG CHỦ</a>
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
                    <a class="nav-link active" aria-current="page" href="#" style="color: #654d3c; font-weight: 600;">VỀ CHÚNG TÔI</a>
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

<div class="page-header">
    <h1 class="display-3 fw-bold">VỀ ALOTRA</h1>
</div>


<section class="quote-section">
    <div class="container">
        <blockquote>
            <p>"AloTra cam kết tâm huyết lấy nông sản Việt Nam làm nguyên liệu chính, mang đến những sản phẩm chất lượng, an toàn và giàu giá trị dinh dưỡng. Ưu tiên sử dụng nông sản trong nước góp phần đẩy mạnh tiêu thụ và phát triển bền vững."</p>
            <footer>— Ban Quản Lý AloTra</footer>
        </blockquote>
    </div>
</section>

<section class="container my-5 content-section">
    <div class="row g-5 align-items-center">
        
        <div class="col-lg-7">
            <h2 class="text-primary-color mb-3 fw-bold">LỊCH SỬ PHÁT TRIỂN</h2>
            <p>Trở về những ngày đầu tiên, AloTra là một trong những thương hiệu tiên phong sử dụng nguồn nguyên liệu sạch và chất lượng cao từ nông sản Việt Nam.</p>
            <p>Thành lập từ <span class="fw-bold">Tháng 11/2013</span>, thương hiệu AloTra chính thức được thành lập bởi công ty cổ phần thương mại dịch vụ. Với tầm nhìn dài hạn, AloTra không ngừng mở rộng hệ thống, đến nay đã có hơn 1000 cửa hàng phủ sóng trên toàn quốc.</p>
            <p>Mục tiêu của chúng tôi là mang đến cho khách hàng những trải nghiệm tuyệt vời, sản phẩm tươi mới, đảm bảo sức khỏe và góp phần nâng cao giá trị nông sản Việt.</p>
            
            <h4 class="text-brown mt-4 fw-bold">Sứ mệnh của AloTra</h4>
            <ul class="list-unstyled">
                <li><i class="fa-solid fa-check-circle me-2 text-primary-color"></i> Nâng tầm giá trị nông sản Việt.</li>
                <li><i class="fa-solid fa-check-circle me-2 text-primary-color"></i> Cung cấp đồ uống sạch, an toàn và dinh dưỡng.</li>
                <li><i class="fa-solid fa-check-circle me-2 text-primary-color"></i> Xây dựng hệ thống cửa hàng chuyên nghiệp, phục vụ tận tâm.</li>
            </ul>
        </div>
        
        <div class="col-lg-5">
            <img src="${pageContext.request.contextPath}/img/about-story.jpg" alt="Lịch sử phát triển" class="img-fluid"> 
        </div>
        
    </div>
</section>

<footer class="bg-dark text-white-50 py-4 mt-5">
    <div class="container text-center">
        <p class="mb-0">© 2025 Alo Tra. Bản quyền thuộc về Đội ngũ phát triển.</p>
        <p class="small">Địa chỉ: 99 Đường ABC, TP. HCM | Hotline: 123 456 789</p>
    </div>
</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>

</body>
</html>