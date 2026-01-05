<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
                <li class="nav-item me-3"><a class="nav-link" href="${pageContext.request.contextPath}/contact" style="color: #654d3c; font-weight: 600;">LIÊN HỆ</a></li>
                <li class="nav-item me-3"><a class="nav-link" href="${pageContext.request.contextPath}/loginRedirect" style="color: #654d3c; font-weight: 600;">ĐĂNG NHẬP</a></li>
                <li class="nav-item me-3"><a class="nav-link" href="${pageContext.request.contextPath}/registerRedirect" style="color: #654d3c; font-weight: 600;">ĐĂNG KÍ</a></li>
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