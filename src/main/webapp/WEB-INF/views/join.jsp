<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

</head>
<body>
	<form:form  action="${ pageContext.servletContext.contextPath }/user/join?${_csrf.parameterName}=${_csrf.token}" method="POST" modelAttribute="user">
		이름 : <form:input path="uname" />
         <form:errors path="uname" />

	         이메일 : <form:input path="username" />
         <form:errors path="username" />
	
	         비밀번호 : <form:password path="password" />
         <form:errors path="password" />
         
	         비밀번호 확인 : <form:password path="passwordCheck" />
         <form:errors path="passwordCheck" />
		
		<input type="submit" value="회원가입하기">
	</form:form >
</body>
</html>