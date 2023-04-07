<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
		crossorigin="anonymous">

<!--  ${_csrf.parameterName}=${_csrf.token} -->

	<form:form modelAttribute="NewStore"
		action="/store/add"
		class="form-horizontal" method="POST" enctype="multipart/form-data">
		<fieldset>
			<legend>가게 등록</legend>
			가게 이름 :
			<form:input path="sname" class="form-control" />
			가게 주소 :
			<form:input path="saddr" class="form-control" />
			가게 번호 :
			<form:input path="stel" class="form-control" />
			가게 사진 :
			<form:input path="sphotoFile" type="file" class="form-control" />
			<!-- 여기는 따로 수정이 필요 -->
			메뉴 :
			<form:input path="smenu" class="form-control" />
			가격 :
			<form:input path="sprice" class="form-control" />


			<input type="submit" class="btn btn-primary" value="등록" />


		</fieldset>
	</form:form>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>

</body>
</html>