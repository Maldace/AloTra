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
	<form action="login" method="post">
	  <label for="name">Họ tên:</label><br>
	  <input type="text" id="name" name="name"><br>
	  <label for="pass">Mật khẩu:</label><br>
	  <input type="text" id="pass" name="pass"><br><br>
	  <input type="submit" value="submit">
	</form> 
</body>
</html>