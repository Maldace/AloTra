<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
                    
                    <c:if test="${empty listC}">
                        <tr>
                            <td colspan="5" class="text-center text-muted py-4">Không có dữ liệu khách hàng.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>