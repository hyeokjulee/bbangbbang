<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보수정</title>

</head>
<body>
	<form:form action="${ pageContext.servletContext.contextPath }/user/myEdit?${_csrf.parameterName}=${_csrf.token}" method="POST" modelAttribute="user">
	     <form:password path="password" placeholder="변경할 비밀번호"/><br>
         <form:errors path="password" cssStyle="color:red" /><br>
         
	     <form:password path="passwordCheck" placeholder="비밀번호 확인"/><br>
         <form:errors path="passwordCheck" cssStyle="color:red" /><br>

		<form:hidden path="uid" value="${user.uid}"/>

		<input type="submit" value="비밀번호변경" onclick="return confirm('변경하시겠습니까?')">
	</form:form >
	<br>
	<form action="/user/myDelete?username=${user.username}&${_csrf.parameterName}=${_csrf.token}" method="post">
		<input type="submit" value="회원탈퇴하기" onclick="return confirm('탈퇴하시겠습니까?')">
	</form>
</body>
</html>