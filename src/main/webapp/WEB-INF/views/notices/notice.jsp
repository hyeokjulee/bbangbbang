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
<title>사이트 소개</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>

<script>
	
	function checkFunction(bid, check) {
		$.ajax({
			type : "POST",
			url : "/boards/check",
			data : {
				bid : bid,
				check : check
			},
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				alert("등록 성공");
			},
			error : function(request, status, error) {
				alert(request.status + " " + request.responseText);
			}
		});
		window.location.reload();
	}
	
	function checkAlert(result){

		 if(result === ''){
	          return;
	        }
		 
		 if(result === "update success"){
	            alert("수정이 완료되었습니다.");
	        }
		 
        if(result === "delete success"){
            alert("삭제가 완료되었습니다.");
        }
	}
</script>

</head>
<body>

	<!-- 주 게시물 -->
	<div class="card">
		<h5 class="card-header">${notice.ntitle}</h5>
		<div class="card-body">
			<h5 class="card-title">${notice.ncontent}</h5>
			<br>
			<br>
			<br>
			<div class="d-flex justify-content-end">
				<p class="btn btn-success btn-sm">조회수 [ ${notice.nview} ]</p>
			</div>
			<div class="d-flex justify-content-end badge bg-light text-dark">${notice.nregdate}</div>
		</div>
		
		<a class="btn btn-primary" id="update_btn">수정</a>
		<a class="btn btn-danger" id="delete_btn">삭제</a>
		<button class="btn btn-secondary" onclick="history.back()">취소</button>
	</div>

<div class="my-5"></div>

</body>

<script>

/* 수정 하기 버튼 */
$("#update_btn").on("click", function(e){
    mForm.submit();
});

/* 삭제 버튼 */
$("#delete_btn").on("click", function(e){
    form.attr("action", "/board/delete");
    form.attr("method", "post");
    form.submit();
});

</script>
</html>
