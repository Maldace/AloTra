<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:if test="${not empty successMessage}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        ${successMessage} <!-- nội dung thông báo -->
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button> <!-- nút đóng -->
    </div>
</c:if>
<div class="container mt-4">
    <div class="card shadow-sm">
        <div class="card-header bg-white py-3">
            <h5 class="card-title mb-0 text-primary"><i class="fa fa-edit"></i> Chỉnh sửa người dùng</h5>
        </div>
        <div class="card-body">
            <form action="updateUser" method="post">
                <div class="mb-3">
                    <label class="form-label fw-bold">Tên người dùng</label>
                    <input type="text" name="username" class="form-control" value="${username}" readonly required>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Email</label>
                    <input type="text" name="email" class="form-control" value="${email}" required>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-bold">Tên đầy đủ</label>
                    <input type="text" name="fullName" class="form-control" value="${fullName}" required>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-bold">Mật khẩu</label>
                    <input type="text" name="passWord" class="form-control" value="${passWord}" required>
                </div>
                <div class="mb-4">
                    <label class="form-label fw-bold">Đường dẫn ảnh</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fa fa-image"></i></span>
                        <input type="text" name="avatar" class="form-control" value="${avatar}">
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-bold">Quyền người dùng</label>
                    <input type="number" name="roleid" class="form-control" value="${roleid}" required>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-bold">Số điện thoại</label>
                    <input type="text" name="phone" class="form-control" value="${phone}" required>
                </div>
                

                   
                

                <div class="mt-4 pt-3 border-top">
                    <div class="d-flex justify-content-end gap-2">
                        
                        <button type="submit" class="btn btn-warning text-white px-4">
                            <i class="fa fa-save"></i> Lưu thay đổi
                        </button>
                    </div>
                </div>
            </form>
            <form action="home" method="get">
           <button type="submit" class="btn btn-warning text-white px-4">
                            <i class="fa fa-save"></i> Hủy
                        </button>
                        </form>
        </div>
    </div>
</div>