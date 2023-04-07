<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>

img {
	width:200px;
	height:150px;

}

</style>

<title></title>
</head>
<body>




	<!-- 주 게시물 -->
	<div class="card">
		<h5 class="card-header">${store.sname}</h5>
		<div class="card-body">
			<h5 class="card-title">${store.stel}</h5>
			<br> <br> <br>

			<img alt="" src=" ${store.sphoto}" >
			<div class="d-flex justify-content-end badge bg-light text-dark">${store.smenu}</div>
			<div class="d-flex justify-content-end badge bg-light text-dark">${store.sprice}</div>
			
			<a class="btn btn-secondary" href="/store/update?sid=${store.sid}">수정하기</a>
			
			<a href="/store/delete?sid="${store.sid}" >삭제하기</a> 
		</div>
	</div>
</body>

</html>