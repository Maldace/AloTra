<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký tài khoản</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

</head>
<div class="register-wrapper">
    <div class="register-form-box">
        <form action="register" method="post">
            <h2>Tạo tài khoản mới</h2>

            <c:if test="${alert != null}">
                <div class="alert">${alert}</div>
            </c:if>

            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-id-card"></i></span>
                <input type="text" placeholder="Full name" name="fullname" class="form-control" required>
            </div>

            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                <input type="email" placeholder="Email" name="email" class="form-control" required>
            </div>

            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="text" placeholder="Username" name="username" class="form-control" required>
            </div>

            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" placeholder="Password" name="password" class="form-control" required>
            </div>

            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" placeholder="Confirm Password" name="confirmPassword" class="form-control" required>
            </div>

            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                <input type="text" placeholder="Phone" name="phone" class="form-control">
            </div>

            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-image"></i></span>
                <input type="text" placeholder="Link ảnh đại diện" name="avatar" class="form-control">
            </div>

            <button type="submit" class="btn-submit">Đăng ký</button>
        </form>
    </div>
</div>
</html>