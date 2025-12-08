<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký tài khoản</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    body { font-family: Arial, sans-serif; }
    form { max-width: 400px; margin: auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; }
    h2 { text-align: center; }
    .input-group { display: flex; align-items: center; margin: 10px 0; }
    .input-group-addon { padding: 8px; background: #eee; border: 1px solid #ccc; border-right: 0; }
    .form-control { flex: 1; padding: 8px; border: 1px solid #ccc; border-left: 0; }
    .btn { width: 100%; padding: 10px; background: #007bff; color: white; border: none; border-radius: 5px; }
    .btn:hover { background: #0056b3; }
    .alert { color: red; text-align: center; }
</style>
</head>
<body>

    <form action="register" method="post">
        <h2>Tạo tài khoản mới</h2>

        <!-- Thông báo lỗi -->
        <c:if test="${alert != null}">
            <h3 class="alert">${alert}</h3>
        </c:if>

        <!-- Fullname -->
        <div class="input-group">
            <span class="input-group-addon"><i class="fa fa-id-card"></i></span>
            <input type="text" placeholder="Full name" name="fullname" class="form-control" required>
        </div>

        <!-- Email -->
        <div class="input-group">
            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
            <input type="email" placeholder="Email" name="email" class="form-control" required>
        </div>

        <!-- Username -->
        <div class="input-group">
            <span class="input-group-addon"><i class="fa fa-user"></i></span>
            <input type="text" placeholder="Username" name="username" class="form-control" required>
        </div>

        <!-- Password -->
        <div class="input-group">
            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
            <input type="password" placeholder="Password" name="password" class="form-control" required>
        </div>

        <!-- Confirm Password -->
        <div class="input-group">
            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
            <input type="password" placeholder="Confirm Password" name="confirmPassword" class="form-control" required>
        </div>

        <!-- Phone -->
        <div class="input-group">
            <span class="input-group-addon"><i class="fa fa-phone"></i></span>
            <input type="text" placeholder="Phone" name="phone" class="form-control">
        </div>
        <div class="input-group">
            <span class="input-group-addon"><i class="fa fa-phone"></i></span>
            <input type="text" placeholder="avatar" name="avatar" class="form-control">
        </div>

        <!-- Submit -->
        <button type="submit" class="btn">Đăng ký</button>
    </form>

</body>
</html>