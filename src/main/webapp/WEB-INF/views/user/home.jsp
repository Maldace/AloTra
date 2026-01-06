<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<div id="alotraCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#alotraCarousel" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#alotraCarousel" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#alotraCarousel" data-bs-slide-to="2"></button>
    </div>

    <div class="carousel-inner">
        <div class="carousel-item active" >
            <img src="https://tocotocotea.com/wp-content/themes/tocotocotea/assets/images/aboutus-home.jpg" class="d-block w-100 banner-full" alt="Banner 1">
        </div>
        <div class="carousel-item" >
            <img src="https://tocotocotea.com/wp-content/uploads/2025/12/Website_1920x1080.jpg" class="d-block w-100 banner-full" alt="Banner 2">
        </div>
        <div class="carousel-item" >
            <img src="https://tocotocotea.com/wp-content/uploads/2025/12/2-Slide-Website.jpg" class="d-block w-100 banner-full" alt="Banner 3">
        </div>
    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#alotraCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#alotraCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>
</div>


<div class="container mt-4">
    </div>
    <c:if test="${not empty message}"> <!-- kiểm tra có message -->
    <div style="color: green;"> <!-- style đơn giản -->
        ${message} <!-- hiển thị nội dung -->
    </div>
</c:if>
<div class="container-lg my-5">
    <div class="row">
        <div class="col-lg-3">
    <div class="category-sidebar border rounded shadow-sm mb-4">
        <p class="category-header">DANH MỤC SẢN PHẨM THEO LOẠI</p>
    <c:forEach items="${category}" var="i" varStatus="st">
        <%-- <div class="list-group list-group-flush">
            <div class="list-group-item d-flex justify-content-between active-category">${i.name}<span class="badge text-bg-light">68</span></div>
        </div> --%>
        <form action="categoryFilter" method="post">
        <input type="hidden" name="categoryName" value="${i.name}">
            <button type="submit" class="btn w-100 fw-bold py-2 shadow-sm" style="background-color: #dcb06b; color: white; border-radius: 20px; border: none;">
                ${i.name}
            </button>
        </form>
     </c:forEach>
    </div>
   


    <div class="category-sidebar border rounded shadow-sm">
        <p class="category-header">DANH MỤC THƯƠNG HIỆU</p>
        <c:forEach items="${supplier}" var="i" varStatus="st">
        <%-- <div class="list-group list-group-flush">
            <div class="list-group-item d-flex justify-content-between active-category">${i.name} <span class="badge text-bg-light">68</span></div>
        </div> --%>
        <form action="supplierFilter" method="post">
        <input type="hidden" name="supplierName" value="${i.name}">
            <button type="submit" class="btn w-100 fw-bold py-2 shadow-sm" style="background-color: #dcb06b; color: white; border-radius: 20px; border: none;">
                ${i.name}
            </button>
        </form>
     </c:forEach>
    </div>
</div>
        
        <div class="col-lg-6">
            <div class="row row-cols-2 row-cols-md-3 g-3">
                <c:forEach items="${products}" var="i" varStatus="st">
                    <div class="col">
                        <div class="card h-100 product-card shadow-sm border-0 text-center" data-bs-toggle="modal" data-bs-target="#modalProd${st.index}">
                            <img src="${pageContext.request.contextPath}/img/products/${i.image}" class="card-img-top p-2" style="height: 150px; object-fit: contain;">
                            <div class="card-body">
                                <h6 class="card-title fw-bold">${i.name}</h6>
                                <p class="text-danger fw-bold">${i.price}đ</p>
                                <button class="btn btn-sm" style="background-color: #f7f7f7; color: #8c5d33; border: 1px solid #ddd; border-radius: 50%;"><i class="fa-solid fa-plus"></i></button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="modal fade" id="modalProd${st.index}" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered modal-lg">
                            <div class="modal-content text-start">
                                <div class="modal-body p-4">
                                    <div class="row">
                                        <div class="col-md-5"><img src="${pageContext.request.contextPath}/img/products/${i.image}" class="img-fluid rounded border"></div>
                                        <div class="col-md-7">
                                            <h3 class="fw-bold">${i.name}</h3>
                                            <h4 class="text-danger fw-bold">${i.price}₫</h4>
			                                <p class="text-danger fw-bold">${i.categoryName}</p>
			                                <p class="text-danger fw-bold">${i.supplierName}</p>
                                            <form action="product" method="post">
                                                <div class="d-flex align-items-center gap-2 mb-4">
                                                    <input type="number" class="form-control w-25" name="quantity" value="1" min="1">
                                                    <input type="hidden" name="name" value="${i.name}">
                                                    <button type="submit" class="btn w-100 fw-bold" style="background-color: #e6c89c;">+ THÊM VÀO GIỎ</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            
            <div class="col-lg-6">
            <div class="row row-cols-2 row-cols-md-3 g-3">
                <c:forEach items="${products}" var="i" varStatus="st">
                    </c:forEach>
            </div> 
            <nav aria-label="Page navigation" class="mt-5">
        <ul class="pagination justify-content-center align-items-center gap-2">
            
            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                <a class="page-link shadow-sm border-0" href="home?page=${currentPage - 1}" 
                   style="color: #654d3c; border-radius: 20px; padding: 8px 20px; font-weight: 600; background-color: #f7f7f7;">
                    <i class="fa-solid fa-chevron-left me-1" style="font-size: 0.8rem;"></i> Trước
                </a>
            </li>

            <c:forEach begin="1" end="${totalPages}" var="p">
                <li class="page-item ${currentPage == p ? 'active' : ''}">
                    <a class="page-link shadow-sm border-0" href="home?page=${p}" 
                       style="width: 40px; height: 40px; display: flex; align-items: center; justify-content: center; border-radius: 50%; font-weight: 700; transition: all 0.3s;
                              ${currentPage == p ? 'background-color: #dcb06b !important; color: white !important;' : 'background-color: white; color: #654d3c;'}">
                        ${p}
                    </a>
                </li>
            </c:forEach>

            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                <a class="page-link shadow-sm border-0" href="home?page=${currentPage + 1}" 
                   style="color: #654d3c; border-radius: 20px; padding: 8px 20px; font-weight: 600; background-color: #f7f7f7;">
                    Sau <i class="fa-solid fa-chevron-right ms-1" style="font-size: 0.8rem;"></i>
                </a>
            </li>
            
        </ul>
    </nav>
            </div>
            
        </div>
        
        <div class="col-lg-3">
            <div class="cart-sidebar border rounded shadow-sm p-3 bg-white" style="position: sticky; top: 90px;">
                <div class="d-flex justify-content-between align-items-center mb-3">
    <h5 class="mb-0 fw-bold" style="color: #654d3c; font-size: 1.1rem;">GIỎ HÀNG CỦA TÔI</h5>
    <c:if test="${not empty sessionScope.cart}">
        <a href="${pageContext.request.contextPath}/update-cart?action=clearAll" class="text-secondary small text-decoration-none">
    Xóa tất cả
</a>
    </c:if>
</div>
                
                <div class="cart-content">
                    <c:choose>
                        <c:when test="${not empty sessionScope.cart}">
                            <div class="list-cart-items" style="max-height: 400px; overflow-y: auto;">
                                <c:forEach items="${sessionScope.cart}" var="item">
                                    <div class="item mb-3 pb-3 border-bottom d-flex justify-content-between align-items-center">
                                        <div style="flex: 1;">
                                            <p class="mb-0 fw-bold" style="color: #333; font-size: 0.9rem;">${item.productName}</p>
                                           
                                            <small class="text-muted">${item.price}đ x ${item.quantity} = <strong>${item.price * item.quantity}đ</strong></small>
                                        </div>
                                        
                                        <div class="d-flex align-items-center gap-2 ms-2">
                                            <a href="update-cart?id=${item.productId}&action=decrease" class="cart-control-btn">
                                                <i class="fa-solid fa-circle-minus"></i>
                                            </a>
                                            
                                            <span class="fw-bold" style="min-width: 15px; text-align: center;">${item.quantity}</span>
                                            
                                            <a href="update-cart?id=${item.productId}&action=increase" class="cart-control-btn">
                                                <i class="fa-solid fa-circle-plus"></i>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <div class="total-section mt-3">
                                <div class="d-flex align-items-center mb-3">
                                     <i class="fa-solid fa-mug-hot me-2 text-secondary" style="font-size: 1.3rem;"></i>
                                     <span class="fw-bold">x ${sessionScope.cart.size()} món = <span class="text-danger">${sessionScope.totalPrice}đ</span></span>
                                </div>
                                <form action="payment" method="post">
                                    <button type="submit" class="btn w-100 fw-bold py-2 shadow-sm" style="background-color: #dcb06b; color: white; border-radius: 20px; border: none;">
                                        THANH TOÁN NGAY
                                    </button>
                                </form>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="text-center py-5">
                                <i class="fa-solid fa-cart-shopping mb-2 text-muted" style="font-size: 2rem;"></i>
                                <p class="text-muted small">Giỏ hàng đang trống</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>