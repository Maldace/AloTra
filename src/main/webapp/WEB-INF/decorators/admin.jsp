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
        .sidebar { width: 250px; height: 100vh; background: #2c3e50; color: white; position: fixed; }
        .sidebar .nav-link { color: #adb5bd; padding: 10px 20px; border-bottom: 1px solid #34495e; }
        .sidebar .nav-link:hover, .sidebar .nav-link.active { background: #34495e; color: white; }
        .sidebar .nav-link i { margin-right: 10px; width: 20px; }
        .main-content { margin-left: 250px; padding: 20px; }
        .card-header { background: white; border-bottom: 1px solid #eee; }
        .btn-add { background-color: #28a745; color: white; border: none; }
        .sidebar-header { padding: 20px; border-bottom: 1px solid #34495e; }
        .user-profile img { width: 40px; height: 40px; border-radius: 50%; margin-right: 10px; }
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</html>