<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:if test="${not empty successMessage}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        ${successMessage} <!-- nội dung thông báo -->
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button> <!-- nút đóng -->
    </div>
</c:if>
<div class="main-content">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h4 class="m-0">Thêm người dùng mới</h4>
    </div>
<form action="addUser" method="post">
    <div class="card">
        <div class="card-body">
            <form action="saveProduct" method="POST" enctype="multipart/form-data">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Tên người dùng</label>
                        <input type="text" name="userName" class="form-control" placeholder="Nhập tên người dùng...">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Email</label>
                        <input type="text" name="email" class="form-control" >
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Tên đầy đủ</label>
                        <input type="text" name="fullName" class="form-control" >
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Mật khẩu</label>
                        <input type="text" name="passWord" class="form-control" >
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Ảnh đại diện</label>
                        <input type="file" name="avatar" class="form-control">
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Quyền tài khoản</label>
                        <input type="number" name="roleId" class="form-control">
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Số điện thoại</label>
                        <input type="text" name="phone" class="form-control">
                    </div>
                    <div class="col-12 mt-4">
                        <button type="submit" class="btn btn-primary">Lưu người dùng</button>
                    </div>
                </div>
            </form>
            <form action="home" method="get">
            <button type="submit" class="btn btn-primary">Hủy</button>
            </form>
        </div>
    </div>
    </form>
</div>