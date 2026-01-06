<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
        body { background-color: #f4f6f9; font-size: 14px; }
        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            height: 100vh;
            position: fixed;
            background-color: #2c3e50;
            color: white;
            padding-top: 20px;
        }
        .sidebar .nav-link {
            color: #bdc3c7;
            padding: 12px 20px;
        }
        .sidebar .nav-link:hover, .sidebar .nav-link.active {
            background-color: #34495e;
            color: white;
        }
        .sidebar .nav-link.active { border-left: 4px solid #27ae60; }
        
        /* Main Content */
        .main-content { margin-left: 250px; padding: 20px; }
        .card { border: none; border-radius: 0; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        .btn-add { background-color: #27ae60; color: white; border: none; }
        .btn-add:hover { background-color: #219150; color: white; }
    </style>
<body>
	<div>
		<%@ include file="/common/admin/header.jsp"%>
		<hr>
		<%@ include file="/common/admin/left.jsp"%>
		<sitemesh:write property="body"/>
		<hr>
		<%@ include file="/common/footer.jsp"%>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</html>