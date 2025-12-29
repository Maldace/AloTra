<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán - Checkout</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-orange: #ff4d2d;
            --secondary-gold: #dcb06b;
            --text-muted: #6c757d;
            --bg-light: #f8f9fa;
        }

        body { 
            background-color: var(--bg-light); 
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            color: #333;
        }

        .card { 
            border: none; 
            border-radius: 12px; 
            box-shadow: 0 4px 12px rgba(0,0,0,0.03); 
            margin-bottom: 20px; 
        }

        .card-header { 
            background: white; 
            border-bottom: 1px solid #f1f1f1; 
            font-weight: 600; 
            padding: 15px 20px;
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
        }

        /* Tùy chỉnh Input giống mẫu */
        .form-group-custom {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #eee;
            padding: 10px 0;
            margin-bottom: 5px;
        }

        .form-group-custom i {
            width: 25px;
            color: var(--text-muted);
        }

        .form-control-custom { 
            border: none; 
            width: 100%;
            padding: 5px 0;
            outline: none;
            font-size: 0.95rem;
        }

        .form-control-custom:focus {
            border-bottom: 1px solid var(--primary-orange);
        }

        /* Nút bấm */
        .btn-order { 
            background-color: var(--primary-orange); 
            color: white; 
            font-weight: 700; 
            border-radius: 10px; 
            padding: 14px; 
            border: none;
            transition: 0.3s;
        }

        .btn-order:hover { 
            background-color: #e64427; 
            transform: translateY(-1px);
        }

        .btn-continue { 
            border: 1px solid var(--secondary-gold); 
            color: var(--secondary-gold); 
            border-radius: 10px; 
            padding: 12px; 
            margin-top: 12px;
            font-weight: 600;
            background: transparent;
        }

        .btn-continue:hover {
            background: #fff9f0;
            color: var(--secondary-gold);
        }

        .promo-btn { 
            background: var(--secondary-gold); 
            color: white; 
            border-radius: 20px; 
            font-size: 13px; 
            padding: 6px 18px; 
            border: none;
        }

        .product-img { 
            width: 70px; 
            height: 70px; 
            object-fit: cover; 
            border-radius: 10px; 
        }

        .price-total {
            color: #000;
            font-size: 1.1rem;
        }
    </style>
</head>
<body>

<div class="container py-5">
    <div class="row">
        <div class="col-lg-7">
            <div class="card">
                <div class="card-header">
                    <span>Thông tin giao hàng</span>
                    <i class="fa-solid fa-chevron-down text-muted small"></i>
                </div>
                <div class="card-body px-4">
                    <div class="form-group-custom">
                        <i class="fa-solid fa-user"></i>
                        <input type="text" class="form-control-custom" placeholder="Tên người nhận">
                    </div>
                    <div class="form-group-custom">
                        <i class="fa-solid fa-phone"></i>
                        <input type="text" class="form-control-custom" placeholder="Số điện thoại người nhận">
                    </div>

                    <div class="text-muted small mt-4 mb-1">Giao đến</div>
                    <div class="form-group-custom">
                        <i class="fa-solid fa-location-dot"></i>
                        <input type="text" class="form-control-custom" placeholder="Địa chỉ người nhận">
                    </div>
                    <div class="form-group-custom">
                        <i class="fa-solid fa-pen-to-square"></i>
                        <input type="text" class="form-control-custom" placeholder="Ghi chú địa chỉ...">
                    </div>
                    
                    <div class="mt-4 d-flex justify-content-between align-items-center">
                        <span class="small text-muted">Giao hàng <strong>14:10</strong> - hôm nay 29/12/2025</span>
                        <a href="#" class="text-primary text-decoration-none small">Sửa</a>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <span>Phương thức thanh toán</span>
                    <i class="fa-solid fa-chevron-down text-muted small"></i>
                </div>
                <div class="card-body px-4">
                    <div class="form-check d-flex align-items-center">
                        <input class="form-check-input me-3" type="radio" name="payment" id="cod" checked style="cursor: pointer;">
                        <label class="form-check-label" for="cod" style="cursor: pointer;">
                            Thanh toán khi nhận hàng
                        </label>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-5">
            <div class="card">
                <div class="card-header">
                    <span>Thông tin đơn hàng</span>
                    <i class="fa-solid fa-chevron-down text-muted small"></i>
                </div>
                <div class="card-body px-4">
                    <div class="d-flex justify-content-between align-items-center mb-4 pb-2 border-bottom">
                        <span class="fw-medium"><i class="fa-solid fa-shop me-2 text-muted"></i> Chọn cửa hàng</span>
                        <i class="fa-solid fa-chevron-down text-muted small"></i>
                    </div>

                    <div class="d-flex mb-4">
                        <div class="bg-light d-flex align-items-center justify-content-center border rounded me-3" style="width: 70px; height: 70px;">
                             <i class="fa-solid fa-mug-hot text-secondary"></i>
                        </div>
                        <div class="flex-grow-1">
                            <h6 class="mb-1 fw-bold" style="font-size: 0.95rem;">Xanh Sữa Nhài Năng Nổ (M)</h6>
                            <small class="text-muted d-block mb-1">100% đường, 100% đá</small>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="fw-bold small">30.000đ x 1</span>
                                <span class="fw-bold">30.000đ</span>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex justify-content-between align-items-center border-top border-bottom py-3 my-3">
                        <span class="small fw-medium"><i class="fa-solid fa-ticket me-2 text-muted"></i> Mã khuyến mãi</span>
                        <button class="btn promo-btn">Thêm khuyến mãi</button>
                    </div>

                    <div class="summary-details">
                        <div class="d-flex justify-content-between mb-2 small">
                            <span class="text-muted">Số lượng cốc: 1 cốc</span>
                            <span>Tổng: <strong>30.000đ</strong></span>
                        </div>
                        <div class="d-flex justify-content-between mb-2 small">
                            <span class="text-muted">Phí vận chuyển:</span>
                            <span>0đ</span>
                        </div>
                        <div class="d-flex justify-content-between mb-2 small">
                            <span class="text-muted">Khuyến mãi:</span>
                            <span>0đ</span>
                        </div>
                        <div class="d-flex justify-content-between mt-4 align-items-center">
                            <h5 class="fw-bold mb-0">Tổng cộng:</h5>
                            <h5 class="fw-bold mb-0 text-dark">30.000đ</h5>
                        </div>
                    </div>

                    <textarea class="form-control mt-4 bg-light border-0 small" rows="2" placeholder="Thêm ghi chú..." style="border-radius: 10px; resize: none;"></textarea>

                    <div class="d-grid mt-4">
                        <button class="btn btn-order text-uppercase">Đặt hàng</button>
                        <button class="btn btn-continue text-uppercase">Tiếp tục mua hàng</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>