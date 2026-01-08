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
        <h4 class="m-0">Thêm sản phẩm mới</h4>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb m-0">
                <li class="breadcrumb-item"><i class="fa fa-home"></i> Bảng điều khiển</li>
                <li class="breadcrumb-item"><a href="home.jsp">Sản phẩm</a></li>
                <li class="breadcrumb-item active">Thêm mới</li>
            </ol>
        </nav>
    </div>
<form action="addProduct" method="post">
    <div class="card">
        <div class="card-body">
            <form action="saveProduct" method="POST" enctype="multipart/form-data">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Tên sản phẩm</label>
                        <input type="text" name="productName" class="form-control" placeholder="Nhập tên trà sữa...">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Loại hàng</label>
                        
                        <select name="categoryId" id="type">
                        <c:forEach items="${listCategory}" var="i" varStatus="st">
						    <option value="${i.id}">${i.name}</option>
					  </c:forEach>
					  </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Giá</label>
                        <input type="number" name="price" class="form-control" placeholder="0">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Hàng tồn kho</label>
                        <input type="number" name="inventory" class="form-control" placeholder="0">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Nhà cung cấp</label>
                        
                        <select name="supplierId" id="type">
                        <c:forEach items="${listSupplier}" var="i" varStatus="st">
						    <option value="${i.id}">${i.name}</option>
					  </c:forEach>
					  </select>
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Ảnh sản phẩm</label>
                        <input type="file" name="img" class="form-control">
                    </div>
                    <div class="col-12 mt-4">
                        <button type="submit" class="btn btn-primary">Lưu sản phẩm</button>
                        <button type="submit" class="btn btn-primary">Hủy</button>
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