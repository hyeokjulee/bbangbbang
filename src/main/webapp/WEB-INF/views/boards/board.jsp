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
<title>게시물 보기</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>

<script>
	function replyNewFunction() {
		$.ajax({
			type : "POST",
			url : "/boards/replynew",
			data : {
				bid : document.getElementById('bid').value,
				bpwriter : document.getElementById('bpwriter').value,
				rpwriter : document.getElementById('rpwriter').value,
				bcontent : document.getElementById('bcontent').value
			},
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				alert("답변 등록 성공");
			},
			error : function(request, status, error) {
				alert(request.status + " " + request.responseText);
			}
		});
		window.location.reload();
	}
	
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

	<!-- 주 게시물 -->
	<div class="card">
		<h5 class="card-header">${board.btitle}</h5>
		<div class="card-body">
			<h5 class="card-title">${board.bcontent}</h5>
			<br>
			<br>
			<br>
			<div class="d-flex justify-content-end">
				<p class="btn btn-success btn-sm">조회수 [ ${board.bview} ]</p>
			</div>
			<div class="d-flex justify-content-end badge bg-light text-dark">${board.bregdate}</div>
				<!-- <button type="button" class="btn btn-primary" style="float:right" onclick="goToUpdate()">수정</button> -->
				<a href="/boards/boardupdate?bid=${board.bid }" class="btn btn-primary" style="float:right">수정</a>
				<button type="button" class="btn btn-danger" style="float:right" id="delete_btn">삭제</button>
				<button type="button" class="btn btn-secondary" style="float:right" onclick="history.back()">취소</button>
		</div>
	</div>


</body>

<script>

/* 수정 하기 버튼 */
function goToUpdate() {
			window.location.href = "/boardupdate";
		}
		
		
/* 삭제 버튼 */
$("#delete_btn").on("click", function(e){
    form.attr("action", "/board/delete");
    form.attr("method", "post");
    form.submit();
});

</script>
</html>
