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
		이름 : <form:input path="uname" /><br>
         <form:errors path="uname" cssStyle="color:red" /><br>

	         이메일 : <form:input path="username" /><br>
         <form:errors path="username" cssStyle="color:red" /><br>
	
	         비밀번호 : <form:password path="password" /><br>
         <form:errors path="password" cssStyle="color:red" /><br>
         
	         비밀번호 확인 : <form:password path="passwordCheck" /><br>
         <form:errors path="passwordCheck" cssStyle="color:red" /><br>
		
		<input type="submit" value="회원가입하기">
	</form:form >
</body>
</html>