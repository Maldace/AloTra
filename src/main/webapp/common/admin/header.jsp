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
		<form action="userManager" method="post" class="mb-2">
		    <button class="btn btn-danger btn-sm text-white w-100 text-start">
		        <i class="fa fa-users me-2"></i> Quản lý khách hàng
		    </button>
		</form>
		
		<form action="redirectOrderManager" method="post" class="mb-2">
		    <button class="btn btn-danger btn-sm text-white w-100 text-start">
		        <i class="fa fa-shopping-cart me-2"></i> Quản lý đơn hàng
		    </button>
		</form>
		
		<form action="redirectStatistics" method="post" class="mb-2">
		    <button class="btn btn-danger btn-sm text-white w-100 text-start">
		        <i class="fa fa-bar-chart me-2"></i> Thống kê
		    </button>
		</form>
        <a class="nav-link active" href="#"><i class="fa-solid fa-boxes-stacked"></i> Quản lý sản phẩm</a>
        <div class="ps-4">
            <a class="nav-link bg-secondary text-white py-1" href="${pageContext.request.contextPath}/admin/home">Sản phẩm</a>
            <a class="nav-link py-1" href="#">Danh mục</a>
            <a class="nav-link py-1" href="${pageContext.request.contextPath}/admin/editorder">Hóa đơn</a>
        </div>
	        <a class="nav-link" href="${pageContext.request.contextPath}/admin/ordermanagement"><i class="fa-solid fa-handshake"></i> Quản lý đơn hàng</a>
			<a href="${pageContext.request.contextPath}/admin/logout" 
		   class="btn btn-dark btn-sm text-white"
		   onclick="return confirm('Đăng xuất nhé?')">
		   <i class="fa fa-sign-out"></i> Đăng xuất
		</a>
    </nav>
</div>