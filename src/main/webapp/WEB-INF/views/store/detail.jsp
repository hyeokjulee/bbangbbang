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
	
	<c:forEach items="${reviewList}" var="r">
	<div class="card">
		<h5 class="card-header">${r.rid}</h5>
		<div class="card-body">
			<h5 class="card-title">${r.rscore}</h5>
			<input type="hidden" name="rid" value="${r.rid}">
			<br> <br> <br>

			<div class="d-flex justify-content-end badge bg-light text-dark">${r.rcontent}</div>
			<div class="d-flex justify-content-end badge bg-light text-dark">${r.rregdate}</div>
			<div class="d-flex justify-content-end badge bg-light text-dark">${r.rupdate}</div>
			
			//수정하기 버튼 ajax 로 만들기
			<button type="button" class="btn btn-secondary" onclick="javascript:updateAjax()">수정하기</button>
			//삭제하기 버튼 ajax 로 만들기
			<button type="button" class="btn btn-secondary" onclick="location.href='/review/delete?rid=${r.rid}'">삭제하기</button>

			
		</div>
	</div>
	</c:forEach>
	
	
	
	
</body>

<script type="javascript">
	// sid 값을 받아서 수정하기 버튼을 누르면 수정페이지로 이동
	function updateAjax() {
		var rid = document.getElementById("rid").value;
		$.ajax ({
			url : "/review/update",
			type : "POST",
			data : {
				rid : rid
			},
			success : function(data) {
				//페이지를 리로드하자
				window.location.reload();
			}
		});
	}


</script>


</html>