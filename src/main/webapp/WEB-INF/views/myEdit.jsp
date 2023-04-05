<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

</head>
<body>
	<form action="/myEdit?${_csrf.parameterName}=${_csrf.token}" method="POST">
		<input type="text" name="uname" id="uname" placeholder="이름" required><br>
		<input type="text" name="username" id="username"  placeholder="이메일" required><br>
		<input type="password" id="password" name="password" placeholder="비밀번호" required><br>
		<input type="password" id="passwordCheck" name="passwordCheck" placeholder="비밀번호 확인" required><br>
		
		<input type="button" value="회원탈퇴하기">
		<input type="submit" value="변경사항저장">
	</form>
</body>
</html>