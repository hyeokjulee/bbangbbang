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
         <form:input path="uname" placeholder="이름" value="${user.uname}"/><br>
         <form:errors path="uname" cssStyle="color:red" /><br>

	     <form:input path="username" placeholder="이메일" value="${user.username}"/><br>
         <form:errors path="username" cssStyle="color:red" /><br>
	
	     <form:password path="password" placeholder="비밀번호"/><br>
         <form:errors path="password" cssStyle="color:red" /><br>
         
	     <form:password path="passwordCheck" placeholder="비밀번호 확인"/><br>
         <form:errors path="passwordCheck" cssStyle="color:red" /><br>

		<form:hidden path="uid" value="${user.uid}"/>

		<input type="button" value="회원탈퇴하기">

		<input type="submit" value="변경사항저장">
	</form:form >
</body>
</html>