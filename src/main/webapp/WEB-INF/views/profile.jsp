<!DOCTYPE html>
<html lang="vi">
<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý tài khoản - Album</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<conten>
	<div class="container main-container">
	    <h1 class="main-title">QUẢN LÝ TÀI KHOẢN</h1>
	    <p class="sub-title">Cập nhật thông tin cá nhân của bạn để bảo mật tài khoản</p>
	
	    <div class="row">
	        <div class="col-md-3 sidebar mb-4">
	            <nav class="nav flex-column">
	                <a class="nav-link active" href="#"><i class="fa-regular fa-user me-2"></i> Hồ sơ</a>
	                <a class="nav-link" href="#"><i class="fa-regular fa-envelope me-2"></i> Email</a>
	                <a class="nav-link" href="#"><i class="fa-solid fa-key me-2"></i> Mật khẩu</a>
	                <a class="nav-link" href="#"><i class="fa-solid fa-shield-halved me-2"></i> Xác thực 2 lớp</a>
	                <a class="nav-link" href="#"><i class="fa-regular fa-file-lines me-2"></i> Dữ liệu cá nhân</a>
	            </nav>
	        </div>
	
	        <div class="col-md-7 offset-md-1">
	            <h3 class="mb-4">Thông tin cá nhân</h3>
	            <form action="${pageContext.request.contextPath}/profile" method="post">
	                <div class="mb-3">
	                    <label class="form-label">Tên người dùng</label>
	                    <input type="text" class="form-control bg-light" value="xuanthulab" readonly>
	                    <div class="form-text">Tên người dùng không thể thay đổi.</div>
	                </div>
	                
	                <div class="mb-3">
	                    <label class="form-label">Email</label>
	                    <input type="email" name="email" class="form-control" placeholder="example@gmail.com">
	                </div>
	
	                <div class="mb-3">
	                    <label class="form-label">Số điện thoại</label>
	                    <input type="text" name="phone" class="form-control" placeholder="Nhập số điện thoại">
	                </div>
	
	                <div class="mb-3">
	                    <label class="form-label">Ảnh đại diện (URL)</label>
	                    <div class="input-group">
	                        <span class="input-group-text"><i class="fa-regular fa-image"></i></span>
	                        <input type="text" name="avatar" class="form-control" placeholder="Link ảnh từ internet">
	                    </div>
	                </div>
	
	                <hr class="my-4">
	                
	                <button type="submit" class="btn btn-save">
	                    <i class="fa-regular fa-floppy-disk me-2"></i> Lưu thay đổi
	                </button>
	            </form>
	        </div>
	    </div>
	</div>
</conten>

</body>
</html>