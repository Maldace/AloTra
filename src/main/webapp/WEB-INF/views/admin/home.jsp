<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:if test="${not empty successMessage}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        ${successMessage} <!-- nội dung thông báo -->
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button> <!-- nút đóng -->
    </div>
</c:if>
<div class="main-content">
    <div class="d-flex justify-content-between align-items-center mb-3">
       <h4 class="m-0">
    Sản phẩm 
    <%-- <a href="${pageContext.request.contextPath}/addproduct" class="btn btn-add btn-sm ms-2">
        <i class="fa fa-plus-circle"></i> Thêm mới
    </a> --%>
     <form action="redirectAddProduct" method="post" class="d-inline">
    <button type="submit" class="btn btn-warning btn-sm text-white ms-2 px-3">
        <i class="fa fa-plus-circle"></i> Thêm mới
    </button>
</form>
</h4>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb m-0">
                <li class="breadcrumb-item"><i class="fa fa-home"></i> Bảng điều khiển</li>
                <li class="breadcrumb-item active">Sản phẩm</li>
            </ol>
        </nav>
    </div>

    <div class="card">
        <div class="card-header bg-white py-3">
            <h5 class="card-title mb-0">Danh sách (1)</h5>
        </div>
<div class="card-body">
    <form action="searchProduct" method="post">
        <div class="row g-2 mb-3 align-items-end">
            <div class="col-md-3">
                <input type="text" name="nameStr" class="form-control form-control-sm" placeholder="Tên sản phẩm...">
            </div>
            
            <div class="col-md-1">
                <button type="submit" class="btn btn-warning btn-sm text-white w-100">
                    <i class="fa fa-search"></i>
                </button>
            </div>

            <div class="col-md-3">
                <select class="form-select form-select-sm" name="categoryId">
                    <option value="">Chọn danh mục</option>
                    <c:forEach items="${listCategory}" var="c">
                        <option value="${c.id}">${c.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="col-md-1">
                <button type="submit" class="btn btn-warning btn-sm text-white w-100">
                    <i class="fa fa-search"></i>
                </button>
            </div>

            <div class="col-md-1">
                <a href="home" class="btn btn-light btn-sm border w-100">
                    <i class="fa-solid fa-arrows-rotate"></i>
                </a>
            </div>
        </div>
    </form>

    <div class="table-responsive">
        </div>
</div>

<div class="table-responsive">
    <table class="table table-bordered align-middle text-center">
        <thead class="table-light">
            <tr>
                <th><input type="checkbox"></th>
                <th>STT</th>
                <th>Tên</th>
                <th>Giá</th>
                <th>Hàng tồn kho</th>
                <th>Loại hàng</th>
                <th>Nhà cung cấp</th>
                <th>Ảnh</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listProdut}" var="i" varStatus="st">
                <tr>
                    <td><input type="checkbox"></td>
                    <td>${st.count}</td>
                    <td class="text-start">${i.name}</td>
                    <td>${i.price}</td>
                    <td>${i.inventory}</td>
                    <td>${i.categoryName}</td>
                    <td>${i.supplierName}</td>
                    
                    <td>
                        <c:if test="${not empty i.image}">
                            <img src="${pageContext.request.contextPath}/img/products/${i.image}" 
                                 onerror="this.src='https://via.placeholder.com/50';"
                                 alt="${i.name}" 
                                 style="width: 50px; height: 50px; object-fit: cover; border-radius: 4px; border: 1px solid #ddd;">
                        </c:if>
                        <c:if test="${empty i.image}">
                            <span class="text-muted">Không có ảnh</span>
                        </c:if>
                    </td>

                    <td>
                        <div class="d-flex justify-content-center gap-1">
                            <form action="editProduct" method="post">
                                <input type="hidden" name="id" value="${i.id}">
                                <input type="hidden" name="productName" value="${i.name}">
                                <input type="hidden" name="price" value="${i.price}">
                                <input type="hidden" name="inventory" value="${i.inventory}">
                                <input type="hidden" name="categoryId" value="${i.categoryId}">
                                <input type="hidden" name="supplierId" value="${i.supplierId}">
                                <input type="hidden" name="img" value="${i.image}">
                                <button class="btn btn-warning btn-sm text-white"><i class="fa fa-edit"></i></button>
                            </form>
                            <form action="deleteProduct" method="post">
                                <input type="hidden" name="productName" value="${i.name}">
                                <button onclick="return confirmDelete()" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></button>
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
            <button class="btn btn-danger btn-sm">Xóa hết</button>
        </div>
    </div>
</div>

<script>
function confirmSave() {
    return confirm("Bạn có chắc chắn muốn lưu thay đổi không?"); // OK = Yes, Cancel = No
}
</script>