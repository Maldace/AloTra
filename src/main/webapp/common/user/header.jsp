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
                <li class="nav-item me-3"><a class="nav-link active" href="${pageContext.request.contextPath}/home" style="color: #654d3c; font-weight: 600;">TRANG CHỦ</a></li>
                <li class="nav-item dropdown me-3">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" style="color: #654d3c; font-weight: 600;">SẢN PHẨM</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Trà sữa</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Cà phê</a></li>
                    </ul>
                </li>
                <li class="nav-item me-3"><a class="nav-link" href="#" style="color: #654d3c; font-weight: 600;">TIN KHUYẾN MÃI</a></li>
                <li class="nav-item me-3"><a class="nav-link" href="#" style="color: #654d3c; font-weight: 600;">VỀ CHÚNG TÔI</a></li>
                <li class="nav-item me-3"><a class="nav-link" href="${pageContext.request.contextPath}/contact" style="color: #654d3c; font-weight: 600;">LIÊN HỆ</a></li>
                <li class="nav-item me-3"><a class="nav-link" href="${pageContext.request.contextPath}/loginRedirect" style="color: #654d3c; font-weight: 600;">ĐĂNG NHẬP</a></li>
                <li class="nav-item me-3"><a class="nav-link" href="${pageContext.request.contextPath}/registerRedirect" style="color: #654d3c; font-weight: 600;">ĐĂNG KÍ</a></li>
            </ul>
            <ul class="navbar-nav d-flex align-items-center">
                <li class="nav-item me-3">
                    <a class="nav-link" href="#">
                        <i class="fa-solid fa-cart-shopping" style="color: #654d3c; font-size: 1.1rem;"></i>
                    </a>
                </li>
                
	                <li class="nav-item me-3">
	                    <%-- <a class="nav-link" href="${pageContext.request.contextPath}/profile">
	                        <i class="fa-solid fa-user" style="color: #654d3c; font-size: 1.1rem;"></i>
	                    </a> --%>
	                    <form action="accountManager" method="post">
            <button type="submit" class="btn w-100 fw-bold py-2 shadow-sm" style="background-color: #dcb06b; color: white; border-radius: 20px; border: none;">Quản lý</button>
        </form>
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
