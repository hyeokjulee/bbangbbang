<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이트 소개 등록</title>
</head>
<body>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	
	<form:form modelAttribute="NewNotice" 
			   action="./noticeadd?${_csrf.parameterName}=${_csrf.token}"
	           class="form-horizontal"
	           method = "post">
	<fieldset>
				<sec:authentication property="principal" var="user" />
	<%-- <form:input path="nwriter" type="hidden" value="${user.username}" class="form-control"/> --%>
	제목 : <form:input path="ntitle" class="form-control"/>
	내용 : <form:textarea path="ncontent" class="form-control" rows="10"/>

	<!-- <input type="submit" class="btn btn-primary" value="등록"/> -->
	<button type="submit" class="btn btn-primary">등록</button>
	
	
	</fieldset>
	</form:form>



</body>
</html></html>