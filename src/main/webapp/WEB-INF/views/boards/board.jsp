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


</head>
<body>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
		crossorigin="anonymous">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>

	<!-- 주 게시물 -->
	<div class="card">
		<h5 class="card-header">${board.btitle}</h5>
		<div class="card-body">
			<h5 class="card-title">${board.bcontent}</h5>
			<br> <br> <br>
			<div class="d-flex justify-content-end">
				<p class="btn btn-success btn-sm">조회수 [ ${board.bview} ]</p>
			</div>
			<div class="d-flex justify-content-end badge bg-light text-dark">${board.bregdate}</div>

			<!-- <button type="button" class="btn btn-primary" style="float:right" onclick="goToUpdate()">수정</button> -->
			<a href="/boards/boardupdate?bid=${board.bid }"
				class="btn btn-primary" style="float: right">수정</a>
			<!-- <button type="button" class="btn btn-danger" style="float:right" id="delete_btn">삭제</button> -->
			<%-- <a id = "board" href="javascript:ajaxremoveFromBoard('${board.bid}')"
								class="btn btn-danger" style="float:right">삭제</a> --%>
			<form action="/boards/deleteboard" method="post">
				<input type="hidden" name="bid" value="${board.bid }" /> <input
					type="submit" class="btn btn-danger" style="float: right"
					value="삭제" />
			</form>
			<button type="button" class="btn btn-secondary" style="float: right"
				onclick="history.back()">취소</button>
		</div>
	</div>
	
		<!-- 답변 등록 -->
		<sec:authentication property="principal" var="user" />
		<%-- 	<input id="cwriter" type="hidden" value="${board.bwriter}"/> --%>
		<input id="bid" type="hidden" name="bid" value="${board.bid}">

		<div class="card text-center">
			<div class="card-header">
				<%--  작성자 : ${member.username} --%>
			</div>
			<div class="card-body">
				<h5 class="card-title">답변 등록</h5>
				<p class="card-text">
					<textarea name="ccontent" id="ccontent" rows="3"
						class="form-control"></textarea>
				</p>
				<button class="btn btn-primary" style="float: right" type="button"
					onclick="addreply()">답변등록</button>
			</div>
		</div>

	<!-- 답변 게시물 -->

	<div class="card">
		<div class="card-body">답변 리스트</div>
		<b>${cnt}개의 답변이 있습니다.</b>
		<c:forEach items="${commentList}" var="c">

			<div class="card">
				<div class="card-header">${c.cwriter}</div>
				<div class="card-body">
					<blockquote class="blockquote mb-0">
						<p>${c.ccontent}</p>
						<div class="d-flex justify-content-end">
							<footer class="blockquote-footer">${c.cregdate}</footer>
						</div>
						<button type="button" class="btn btn-primary btn-sm" style="float: right" onclick="javascript:updateModal(${c.cid},'${c.ccontent}' )">수정</button>
						<form action="/boards/deletereply" method="post">
						<input type="hidden" name="bid" value="${c.bid }" />
						<input type="hidden" name="cid" value="${c.cid }" /> <input
							type="submit" class="btn btn-danger btn-sm" style="float: right"
							value="삭제" />
						</form>
					</blockquote>
				</div>
			</div>
		</c:forEach>

		<!-- 댓글 수정 모달 -->
					<div class="modal" tabindex="-1">
						<div class="modal-dialog" id="updateModal">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="modal-title">모달_타이틀_</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body" id="modal-body">
									모달_바디_부분_자동으로_정보를_가져와서_바꿀_예정
								</div>
								<div class="modal-footer" id="modal-footer">


								</div>
							</div>
						</div>
					</div>
					
	

	</div>

</body>

<script>
	/* 수정 하기 버튼 */
	function goToUpdate() {
		window.location.href = "/boardupdate";
	}

	function ajaxremoveFromBoard(board) {
		$.ajax({
			type : "POST",
			url : "/board/ajaxremove",
			data : {
				bid : board
			},
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				alert("게시글이 삭제되었습니다.");
			},
			error : function(request, status, error) {
				alert(request.status + " " + request.responseText);
			}
		})

		window.location.reload();
	}


	//댓글 ajax

	function addreply() {
		var bid = $("#bid").val();
		var ccontent = $("#ccontent").val();
		var cwriter = "임시값_수정해야함";
		
		console.log(bid);
		console.log(ccontent);
		console.log(cwriter);

		$.ajax({
			type : "POST",
			url : "/boards/replynew",
			data : {
				bid : bid,
				ccontent : ccontent,
				cwriter : cwriter
			},
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				alert("등록 완료")
			 window.location.reload() ;
			},
			error : function(request, status, error) {
				alert(request.status + " " + request.responseText);
			}
		});
		/*  window.location.reload();  */
	}
	
	 //updateModel(${r.rid}, ${r.content}, ${r.rscore}) 에서 받은 값으로 modal을 띄우는 함수
	function updateModal(cid, ccontent) {
	    $('.modal').modal('show');
		var modal_title = document.getElementById("modal-title");
		modal_title.innerHTML = "댓글 수정";
		var modal_body = document.getElementById("modal-body");
		modal_body.innerHTML =  "<input id='cid' value= '" + cid + "' >" +
								"<input id='ccontent' value= '" + ccontent + "' >" ;
		
		var modal_footer = document.getElementById("modal-footer");
		modal_footer.innerHTML = "<button type='button' class='btn btn-primary' onclick='javascript:updateAjax()'>수정</button>"
			+ "<button type='button' class='btn btn-secondary' data-bs-dismiss='modal'>닫기</button>" ; 
	}

	function updateAjax() {
	    var cid = document.querySelector("#cid").value;
	    var ccontent = document.querySelector("#ccontent").value;

	    $.ajax({
	        url: "/boards/updatereply",
	        type: "POST",
	        data: {
	            cid: cid,
	            ccontent: ccontent
	        },
	        beforeSend: function(xhr) { 
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
	        success: function(data) {
				window.location.reload();
			},
	        error: function(jqXHR, textStatus, errorThrown) {
	            // 수정 실패 시 처리할 로직
	        }
	    });
	}


</script>
</html>
