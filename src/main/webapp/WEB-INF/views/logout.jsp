<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>

</head>
<body>
	<form action="/logout?${_csrf.parameterName}=${_csrf.token}" method="post">
		<input type="submit" value="로그아웃">
	</form>
</body>
</html>