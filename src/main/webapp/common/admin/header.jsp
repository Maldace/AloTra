<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="sidebar">
    <div class="sidebar-header d-flex align-items-center">
        <div class="user-profile d-flex align-items-center">
            <img src="https://via.placeholder.com/40" alt="User">
            <div>
                <div class="fw-bold">Admin</div>
                <small class="text-success">● Online</small>
            </div>
        </div>
    </div>
    <div class="p-3 text-uppercase fw-bold text-muted small">TRANG QUẢN LÍ DỮ LIỆU CỦA ADMIN</div>
    <nav class="nav flex-column">
        <a class="nav-link" href="#"><i class="fa-solid fa-file"></i> Trang</a>
        <form action="userManager" method="post">
			<button class="btn btn-danger btn-sm text-white">
			    <i class="fa fa-users"></i> Quản lý khách hàng
			</button>
        </form>
        <a class="nav-link active" href="#"><i class="fa-solid fa-boxes-stacked"></i> Quản lý sản phẩm</a>
        <div class="ps-4">
            <a class="nav-link bg-secondary text-white py-1" href="${pageContext.request.contextPath}/admin/home">Sản phẩm</a>
            <a class="nav-link py-1" href="#">Danh mục</a>
            <a class="nav-link py-1" href="${pageContext.request.contextPath}/admin/editorder">Hóa đơn</a>
        </div>
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/ordermanagement"><i class="fa-solid fa-handshake"></i> Quản lý đơn hàng</a>
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/statistics"><i class="fa-solid fa-handshake"></i> Thống kê</a>
    </nav>
</div>