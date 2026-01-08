<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<<<<<<< Updated upstream
<div class="main-content">
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
            <h5 class="mb-0">Danh sách tài khoản khách hàng</h5>
            <a href="customer-add" class="btn btn-light btn-sm fw-bold">+ Thêm mới</a>
        </div>
        
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead class="table-light">
                        <tr>
                            <th scope="col">#ID</th>
                            <th scope="col">Tên tài khoản</th>
                            <th scope="col">Email</th>
                            <th scope="col">Tên đầy đủ</th>
                            <th scope="col">Mật khẩu</th>
                            <th scope="col">Hình đại diện</th>
                            <th scope="col">Vai trò</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Ngày tạo</th>
                            <th scope="col" class="text-center">Hành động</th>
=======
<c:if test="${not empty successMessage}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        ${successMessage} <!-- nội dung thông báo -->
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button> <!-- nút đóng -->
    </div>
</c:if>
<div class="card shadow-sm">
    <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Danh sách tài khoản khách hàng</h5>
        <form action="redirectAddUser" method="post">
        <button class="btn btn-danger btn-sm"><i class="fa fa-trash">Thêm mới</i></button>
        </form>
    </div>
    
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th scope="col">#ID</th>
                        <th scope="col">Tên tài khoản</th>
                        <th scope="col">Email</th>
                        <th scope="col">Tên đầy đủ</th>
                        <th scope="col">Mật khẩu</th>
                        <th scope="col">Hình đại diện</th>
                        <th scope="col">Vai trò</th>
                        <th scope="col">Số điện thoại</th>
                        <th scope="col">Ngày tạo</th>
                        <th scope="col" class="text-center">Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${users}" var="c">
                        <tr>
                            <td class="fw-bold">#KH${c.id}</td>
                            <td>${c.userName}</td>
                            <td>${c.email}</td>
                            <td>${c.fullName}</td>
                            <td>${c.passWord}</td>
                            <td>${c.avatar}</td>
                            <td>${c.roleid}</td>
                            <td>${c.phone}</td>
                            <td>${c.createdDate}</td>
                            <td class="text-center">
                                <form action="redirectEditUser" method="post">
                                <input type="hidden" name="username" value="${c.userName}">
                                <input type="hidden" name="email" value="${c.email}">
                                <input type="hidden" name="fullName" value="${c.fullName}">
                                <input type="hidden" name="passWord" value="${c.passWord}">
                                <input type="hidden" name="avatar" value="${c.avatar}">
                                <input type="hidden" name="roleid" value="${c.roleid}">
                                <input type="hidden" name="phone" value="${c.phone}">
                                <button class="btn btn-warning btn-sm text-white w-100"><i class="fa fa-search">Sửa</i></button>
                                </form>
                                <form action="deleteUser" method="post">
                                <input type="hidden" name="username" value="${c.userName}">
                                <button onclick="return confirm('Xác nhận xóa khách hàng này?')" class="btn btn-warning btn-sm text-white w-100"><i class="fa fa-search">Xóa</i></button>
                                </form>
                            </td>
>>>>>>> Stashed changes
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${users}" var="c">
                            <tr>
                                <td class="fw-bold">#KH${c.id}</td>
                                <td>${c.userName}</td>
                                <td>${c.email}</td>
                                <td>${c.fullName}</td>
                                <td>${c.passWord}</td>
                                <td>${c.avatar}</td>
                                <td>${c.roleid}</td>
                                <td>${c.phone}</td>
                                <td>${c.createdDate}</td>
                                <td class="text-center">
                                    <a href="customer-edit?id=${c.id}" class="btn btn-outline-warning btn-sm">
                                        <i class="bi bi-pencil"></i> Sửa
                                    </a>
                                    <a href="customer-delete?id=${c.id}" 
                                       class="btn btn-outline-danger btn-sm"
                                       onclick="return confirm('Xác nhận xóa khách hàng này?')">
                                        <i class="bi bi-trash"></i> Xóa
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>