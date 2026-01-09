<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<nav class="navbar navbar-expand-lg sticky-top" style="background-color: #f7f7f7; border-bottom: 1px solid #eee;">
    <div class="container-fluid container-lg">
        <%-- Logo --%>
        <a class="navbar-brand me-5" href="${pageContext.request.contextPath}/home">
            <img src="${pageContext.request.contextPath}/img/HOME/LOGO.png" height="35" alt="Logo">
        </a>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mainNavbar">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item me-3">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/home" style="color: #654d3c; font-weight: 600;">TRANG CHỦ</a>
                </li>
                
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

                <%-- LOGIC ĐĂNG NHẬP / ĐĂNG XUẤT --%>
                <c:choose>
                    <c:when test="${not empty sessionScope.account}">
                        <%-- CHỈ hiện khi ĐÃ đăng nhập --%>
                        <li class="nav-item me-3">
                            <a class="nav-link" href="${pageContext.request.contextPath}/profile" style="color: #654d3c; font-weight: 600;">
							    CHÀO, ${sessionScope.account.userName}
							</a>
                        </li>
                        <li class="nav-item me-3">
							<a class="nav-link" href="${pageContext.request.contextPath}/logout" style="color: #d93025; font-weight: 600;">
							   ĐĂNG XUẤT
							</a>
							                        </li>
                    </c:when>
                    <c:otherwise>
                        <%-- CHỈ hiện khi CHƯA đăng nhập --%>
                        <li class="nav-item me-3">
                            <a class="nav-link" href="${pageContext.request.contextPath}/loginRedirect" style="color: #654d3c; font-weight: 600;">ĐĂNG NHẬP</a>
                        </li>
                        <li class="nav-item me-3">
                            <a class="nav-link" href="${pageContext.request.contextPath}/register" style="color: #654d3c; font-weight: 600;">ĐĂNG KÝ</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>

            <%-- Icon Giỏ hàng, Tìm kiếm và nút Quản lý --%>
            <ul class="navbar-nav d-flex align-items-center">
                <li class="nav-item me-3">
                    <a class="nav-link" href="#"><i class="fa-solid fa-cart-shopping" style="color: #654d3c; font-size: 1.1rem;"></i></a>
                </li>
                
                <%-- Nút Quản lý chỉ hiện khi đã đăng nhập --%>
                <c:if test="${not empty sessionScope.account}">
                    <li class="nav-item me-3">
                        <form action="${pageContext.request.contextPath}/accountManager" method="post" style="margin: 0;">
                            <button type="submit" class="btn fw-bold px-3 py-1 shadow-sm" style="background-color: #dcb06b; color: white; border-radius: 20px; border: none; font-size: 0.8rem;">QUẢN LÝ</button>
                        </form>
                    </li>
                </c:if>

                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa-solid fa-magnifying-glass" style="color: #654d3c; font-size: 1.1rem;"></i></a>
                </li>
            </ul>
        </div>
    </div>
</nav>