<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container mt-4">
    <div class="card shadow-sm">
        <div class="card-header bg-white py-3">
            <h5 class="card-title mb-0 text-primary"><i class="fa fa-edit"></i> Chỉnh sửa sản phẩm</h5>
        </div>
        <div class="card-body">
            <form action="updateProduct" method="post">
        <input type="text" name="id" value="${id}">
                <div class="mb-3">
                    <label class="form-label fw-bold">Tên sản phẩm</label>
                    <input type="text" name="productName" class="form-control" value="${name}" required>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Giá bán (VNĐ)</label>
                        <div class="input-group">
                            <input type="number" name="price" class="form-control" value="${price}">
                            <span class="input-group-text">đ</span>
                        </div>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Hàng tồn kho</label>
                        <input type="number" name="inventory" class="form-control" value="${inventory}">
                    </div>
                </div>
                
                <div class="mb-3">
                    <label class="form-label fw-bold">Loại hàng</label>
                     <select name="categoryId" id="type">
                        <c:forEach items="${listCategory}" var="i" varStatus="st">
						    <option value="${i.id}"${i.id == categoryId ? 'selected' : ''}>${i.name}</option>
					  </c:forEach>
					  </select>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Nhà cung cấp</label>
                    <select name="supplierId" id="type">
                        <c:forEach items="${listSupplier}" var="i" varStatus="st">
						    <option value="${i.id}"${i.id == supplierId ? 'selected' : ''}>${i.name}</option>
					  </c:forEach>
					  </select>
					  
					  
                </div>

                <div class="mb-4">
                    <label class="form-label fw-bold">Đường dẫn ảnh</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fa fa-image"></i></span>
                        <input type="text" name="img" class="form-control" value="${img}">
                    </div>
                </div>

                <div class="mt-4 pt-3 border-top">
                    <div class="d-flex justify-content-end gap-2">
                        
                        <button type="submit" class="btn btn-warning text-white px-4">
                            <i class="fa fa-save"></i> Lưu thay đổi
                        </button>
                    </div>
                </div>
            </form>
            <form action="home" method="post">
           <button type="submit" class="btn btn-warning text-white px-4">
                            <i class="fa fa-save"></i> Hủy
                        </button>
                        </form>
        </div>
    </div>
</div>