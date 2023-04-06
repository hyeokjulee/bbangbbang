<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

</head>
<body>
	<form action="/user/login" method="post">
		<input type="text" name="username" id="username" placeholder="이메일 주소"><br>
		<input type="password" name="password" id="password" placeholder="비밀번호"><br>
		<button type="submit">로그인</button><br>
		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<a href="/user/join">회원가입</a>
	</form>
</body>
</html>