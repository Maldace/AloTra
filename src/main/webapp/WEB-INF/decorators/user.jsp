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