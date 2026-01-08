<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đăng nhập tài khoản</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
    <link rel="stylesheet" 
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" 
          integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLMDJc5fN9z1b44k8yU6h5E9Jz5p+1W8c+1gV4aN6vB4h4k4wP4x8zY5t4i4z4wZg==" 
          crossorigin="anonymous" referrerpolicy="no-referrer" />
  	

    <style>
        body {
            /* Căn giữa form trên toàn bộ màn hình */
            background-color: #f8f9fa; 
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }
        .login-container {
            /* Tạo kiểu form nổi bật */
            max-width: 400px;
            width: 100%;
            padding: 30px;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); 
        }
    </style>
</head>
<body>
<c:if test="${not empty successMessage}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        ${successMessage} <!-- nội dung thông báo -->
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button> <!-- nút đóng -->
    </div>
</c:if>
<div class="login-container">
    <form action="login" method="post">
        <h2 class="text-center mb-4 text-primary">Đăng Nhập Tài Khoản</h2>

        <c:if test="${alert != null}">
            <div class="alert alert-danger mb-3" role="alert">
                ${alert}
            </div>
        </c:if>
        
        <div class="mb-3">
            <label for="username" class="form-label">Tài khoản</label>
            <div class="input-group">
                <span class="input-group-text"><i class="fa-solid fa-user"></i></span> 
                <input type="text" class="form-control" id="username" placeholder="Nhập tên đăng nhập" name="username" required>
            </div>
        </div>
        
        <div class="mb-4">
            <label for="password" class="form-label">Mật khẩu</label>
            <div class="input-group">
                <span class="input-group-text"><i class="fa-solid fa-lock"></i></span> 
                <input type="password" class="form-control" id="password" placeholder="Nhập mật khẩu" name="password" required>
            </div>
        </div>
        
        <div class="mb-3">
            <input type="submit" class="btn btn-primary w-100" value="Đăng nhập">
        </div>
        
        <p class="text-center small text-muted">
            <a href="forgot" class="text-decoration-none">Quên mật khẩu?</a>
            <span class="mx-2">|</span>
            <a href="register" class="text-decoration-none">Đăng ký tài khoản</a>
        </p>
        
    </form>
    
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>

</body>
</html>