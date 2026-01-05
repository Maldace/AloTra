<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
</html>