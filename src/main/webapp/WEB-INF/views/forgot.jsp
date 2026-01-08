<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

</head>
<c:if test="${not empty successMessage}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        ${successMessage} <!-- nội dung thông báo -->
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button> <!-- nút đóng -->
    </div>
</c:if>
<div class="register-wrapper">
    <div class="register-form-box">
        <form action="forgot" method="post">
            <h2>Đổi Mật Khẩu</h2>
			<p style="font-size: 14px; color: #666; line-height: 1.5; margin-top: 20px; margin-bottom:  5;"> Mật khẩu của bạn phải có tối thiểu 3 ký tự, đồng thời bao gồm cả chữ số, chữ cái và ký tự đặc biệt(@#$%^).</p>

			<c:if test="${alert != null}">
                <div class="alert">${alert}</div>
            </c:if>

            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="text" placeholder="Username" name="username" class="form-control" required>
            </div>
            
             <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                <input type="email" placeholder="Email" name="email" class="form-control" required>
            </div>
            
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                <input type="text" placeholder="Phone" name="phone" class="form-control">
            </div>

            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" placeholder="Password" name="password" class="form-control" required>
            </div>


            <button type="submit" class="btn-submit">Xác nhận</button>
        </form>
    </div>
</div>
</html>