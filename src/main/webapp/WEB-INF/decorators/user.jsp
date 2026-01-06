<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang Chủ Alo Tra</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home-style.css"> --%>
    
    <style>
        /* FIX 2: Ép các nút cộng trừ phải hiện rõ ràng */
        .cart-control-btn {
            color: #8fa7d5 !important;
            font-size: 1.5rem !important;
            text-decoration: none !important;
            display: inline-block !important;
            line-height: 1;
        }
        .cart-control-btn:hover {
            color: #7a96c9 !important;
        }
         .category-sidebar .list-group-item {
            cursor: pointer;
            border: none;
            padding: 10px 15px;
            font-size: 14px;
            color: #555;
            transition: background-color 0.2s;
        }

        .category-sidebar .list-group-item:hover {
            background-color: #f8f9fa;
            color: #333;
        }

        .category-sidebar .list-group-item.active-category {
            font-weight: bold;
            color: #8c5d33;
            background-color: #fff8f0;
            border-left: 3px solid #8c5d33;
        }

        .category-header {
            font-size: 16px;
            font-weight: bold;
            color: #654d3c;
            padding: 15px 15px 10px 15px;
            border-bottom: 2px solid #eee;
            margin-bottom: 0;
        }
        
        .product-card .card-body {
            padding-top: 5px;
            padding-bottom: 15px;
        }
        
        .cart-sidebar {
            background-color: #f8f8f8;
            padding: 20px;
        }
        /* Chỉ thêm con trỏ chuột cho thẻ card */
        .product-card { cursor: pointer; }
        
        

        :root {
            --primary-orange: #ff4d2d;
            --secondary-gold: #dcb06b;
            --text-muted: #6c757d;
            --bg-light: #f8f9fa;
        }
        body { background-color: var(--bg-light); font-family: 'Segoe UI', sans-serif; color: #333; }
        .card { border: none; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.03); margin-bottom: 20px; }
        .card-header { background: white; border-bottom: 1px solid #f1f1f1; font-weight: 600; padding: 15px 20px; display: flex; justify-content: space-between; align-items: center; }
        .form-group-custom { display: flex; align-items: center; border-bottom: 1px solid #eee; padding: 10px 0; margin-bottom: 5px; }
        .form-group-custom i { width: 25px; color: var(--text-muted); }
        .form-control-custom { border: none; width: 100%; padding: 5px 0; outline: none; font-size: 0.95rem; background: transparent;}
        .btn-order { background-color: var(--primary-orange); color: white; font-weight: 700; border-radius: 10px; padding: 14px; border: none; transition: 0.3s; }
        .btn-order:hover { background-color: #e64427; transform: translateY(-1px); }
        .btn-continue { border: 1px solid var(--secondary-gold); color: var(--secondary-gold); border-radius: 10px; padding: 12px; margin-top: 12px; font-weight: 600; background: transparent; text-decoration: none; text-align: center;}
        .promo-btn { background: var(--secondary-gold); color: white; border-radius: 20px; font-size: 13px; padding: 6px 18px; border: none; }
        .product-img { width: 70px; height: 70px; object-fit: cover; border-radius: 10px; border: 1px solid #eee; }
        
    /* Làm đẹp container sidebar */
    .category-sidebar {
        background-color: #ffffff;
        padding: 15px;
        overflow: hidden;
    }

    /* Định dạng lại tiêu đề danh mục */
    .category-header {
        font-size: 0.9rem;
        font-weight: 700;
        color: #444;
        border-bottom: 2px solid #dcb06b;
        padding-bottom: 10px;
        margin-bottom: 15px !important;
        text-transform: uppercase;
    }

    /* Tối ưu class .btn có sẵn của bạn */
    .category-sidebar .btn {
        background-color: #dcb06b !important;
        color: white !important;
        border-radius: 8px !important; /* Bo góc hiện đại hơn dạng capsule */
        border: none !important;
        margin-bottom: 10px;
        text-align: left; /* Căn trái nhìn sẽ chuyên nghiệp hơn */
        padding-left: 15px !important;
        transition: all 0.3s ease-in-out !important;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    /* Hiệu ứng Hover - Quan trọng để giao diện trông "xịn" hơn */
    .category-sidebar .btn:hover {
        background-color: #c59a58 !important; /* Màu đậm hơn khi rê chuột */
        transform: translateX(8px); /* Nút nhích sang phải một chút */
        box-shadow: 0 4px 15px rgba(220, 176, 107, 0.4) !important;
    }

    /* Thêm một icon mũi tên nhỏ giả lập phía sau (tùy chọn) */
    .category-sidebar .btn::after {
        content: '→';
        font-size: 1.2rem;
        opacity: 0;
        transition: 0.3s;
    }

    .category-sidebar .btn:hover::after {
        opacity: 1;
    }

    .footer-link:hover {
        color: #dcb06b !important;
        padding-left: 5px;
        transition: all 0.3s ease;
    }
    
    footer i {
        color: #dcb06b;
    }

    footer .text-reset {
        font-size: 0.95rem;
    }
        conten { background-color: #f8f9fa; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .main-container { background-color: #ffffff; padding: 40px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); margin-top: 50px; }
        .main-title { font-size: 2.2rem; font-weight: 600; color: #333; }
        .sub-title { font-size: 1.1rem; color: #666; border-bottom: 1px solid #eee; padding-bottom: 20px; margin-bottom: 30px; }
        
        /* Sidebar Styling */
        .sidebar .nav-link { color: #dcb06c; font-weight: 500; padding: 10px 15px; border-radius: 5px; margin-bottom: 5px; transition: 0.3s; }
        .sidebar .nav-link:hover { background-color: #dcb06c; }
        .sidebar .nav-link.active { background-color: #dcb06c; color: white !important; }
        
        /* Form Styling */
        .form-label { font-weight: 600; color: #444; }
        .form-control:focus { border-color: #0d6efd; box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.1); }
        .btn-save { background-color: #dcb06c; color: white; padding: 10px 30px; font-weight: 600; transition: 0.3s; border: none; }
        .btn-save:hover { background-color: #0a58ca; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        
    }
    


</style>
<style>
    /* Sử dụng class để định vị, không dùng thẻ body */
    .register-wrapper {
        display: flex;
        justify-content: center;
        padding: 50px 0;
    }

    .register-form-box {
        max-width: 450px;
        width: 100%;
        margin: auto;
        padding: 30px;
        border: 1px solid #ddd;
        border-radius: 12px;
        background-color: #fff;
        box-shadow: 0 4px 15px rgba(0,0,0,0.05);
    }

    .register-form-box h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #654d3c;
        font-weight: 700;
    }

    .register-form-box .input-group {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
        border-radius: 8px;
        overflow: hidden;
    }

    .register-form-box .input-group-addon {
        padding: 10px 15px;
        background: #f1f1f1;
        border: 1px solid #ccc;
        border-right: 0;
        color: #555;
        min-width: 45px;
        text-align: center;
    }

    .register-form-box .form-control {
        flex: 1;
        padding: 10px;
        border: 1px solid #ccc;
        outline: none;
        font-size: 14px;
    }

    .register-form-box .form-control:focus {
        border-color: #dcb06c;
    }

    .register-form-box .btn-submit {
        width: 100%;
        padding: 12px;
        background: #dcb06c; /* Màu vàng nâu Alotra */
        color: white;
        border: none;
        border-radius: 8px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
        text-transform: uppercase;
    }

    .register-form-box .btn-submit:hover {
        background: #c59a5b;
    }

    .register-form-box .alert {
        color: #d9534f;
        text-align: center;
        background-color: #fceceb;
        padding: 10px;
        border-radius: 5px;
        margin-bottom: 20px;
        font-size: 15px;
    }
</style>



</head>
<body>
	<div>
		<%@ include file="/common/user/header.jsp"%>
		<sitemesh:write property="body"/>
		<%@ include file="/common/footer.jsp"%>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>