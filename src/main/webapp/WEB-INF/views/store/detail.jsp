<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

			<c:choose>
				<c:when test="${store.sphoto2 != null}">
					<img src="<c:url value="/resources/save_image/${store.sphoto2}"/>" alt="사진" > 
				</c:when>
				<c:otherwise>
					<img src="${store.sphoto}" alt="사진" >
				</c:otherwise>
			</c:choose>
			
			

			<div class="d-flex justify-content-end badge bg-light text-dark">${store.smenu}</div>
			<div class="d-flex justify-content-end badge bg-light text-dark">${store.sprice}</div>
			
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a class="btn btn-secondary" href="/store/update?sid=${store.sid}">수정하기</a>
		    </sec:authorize>
		</div>
	</div>

	<sec:authorize access="isAuthenticated()">
    	<!-- 리뷰 등록 구역 -->
		<div class="card">
			<h5 class="card-header">리뷰 등록</h5>
			<div class="card-body">
				<h5 class="card-title">리뷰 등록</h5>
				<br> <br> <br>
	
				<div class="container">
					<input type="hidden" class="sid" name="sid" value='${store.sid}'>
					<!-- <input type="hidden" name="mid" value="${member.mid}"> -->
					<input type="hidden" class="uid" name="uid" value="1">
	
					<input type="text" class="form-data rcontent">
					<input type="text" class="form-data rscore">
					<button type="button" onclick="insertAjax()">등록</button>
				</div>
			</div>
		</div>
    </sec:authorize>

	<!-- 리뷰 게시물 -->

	<c:forEach items="${reviewList}" var="r">
	<div class="card">
		<h5 class="card-header">${r.rscore}</h5>
		<div class="card-body">
			<h5 class="card-title">${r.rcontent}</h5>
			<input type="hidden" name="rid" value="${r.rid}">
			<br> <br> <br>

			<div class="d-flex justify-content-end badge bg-light text-dark">${r.rregdate}</div>
			<div class="d-flex justify-content-end badge bg-light text-dark">${r.rupdate}</div>
			
			<!-- 리뷰 부분 -->
			<!-- // onclick 에 rid의 값을 updateModel(rid) 값을 넘겨주기 -->
			<button type="button" class="btn btn-primary" onclick="javascript:updateModel(${r.rid}, ${r.rscore}, '${r.rcontent}' )">수정모달</button>

		</div>
	</div>
	</c:forEach>
	
	
	<div class="modal" tabindex="-1">
		<div class="modal-dialog" id="updateModal">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="modal-title">모달_타이틀_</h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" id="modal-body">
			  모달_바디_부분_자동으로_정보를_가져와서_바꿀_예정
			</div>
			<div class="modal-footer" id="modal-footer">
			 
			  
			</div>
		  </div>
		</div>
	  </div>
	
</body>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script type="text/javascript">

//updateModel(${r.rid}, ${r.content}, ${r.rscore}) 에서 받은 값으로 modal을 띄우는 함수
function updateModel(rid, rscore, rcontent) {
    //모달창을 띄우자
    $('.modal').modal('show');
	var modal_title = document.getElementById("modal-title");
	modal_title.innerHTML = "리뷰 수정";

	var modal_body = document.getElementById("modal-body");
	modal_body.innerHTML =  "<input id='rid' value= '" + rid + "' >" +
							"<input id='rscore' value= '" + rscore + "' >" +
							"<input id='rcontent' value= '" + rcontent + "' >" ;
	
	var modal_footer = document.getElementById("modal-footer");
	modal_footer.innerHTML = "<button type='button' class='btn btn-primary' onclick='javascript:updateAjax()'>수정하기</button>"
		+ "<button type='button' class='btn btn-primary' onclick='javascript:deleteAjax()'>삭제하기</button>"
		+ "<button type='button' class='btn btn-secondary' data-bs-dismiss='modal'>닫기</button>" ; 
}


	// rid 값을 받아서 수정하기 버튼을 누르면 수정페이지로 이동
	// 버그가 터지니까 방향성 수정 -> modal_body 의 innerHTML 을 수정하자 -> id 값을 설정하기로
	// 그렇게하면 var 변수 = document.getElementById("id값") 으로 값을 가져올 수 있다. 
	function updateAjax() {
		var rid = document.querySelector("#rid").value;
		var rscore = document.querySelector("#rscore").value;
		var rcontent = document.querySelector("#rcontent").value;

		alert("rid : " + rid + ", rcontent : " + rcontent + ", rscore : " + rscore) ;


		$.ajax ({
			url : "/review/update",
			type : "POST",
			data : {
				rid : rid,
				rcontent : rcontent,
				rscore : rscore
			},
			success : function(data) {
				//페이지를 리로드하자
				window.location.reload();
			},
			error : function() {
				alert("수정_에러");
			}
			
		});
	}

	function insertAjax() {
		var sid = $('div.container input.sid').val();
		var uid = $('div.container input.uid').val();
		var rcontent = $('div.container input.rcontent').val();
		var rscore = $('div.container input.rscore').val();

		alert("rcontent : " + rcontent + ", rscore : " + rscore + ", uid : " + uid + ", sid : " + sid) ;


		$.ajax ({
			url : "/review/insert",
			type : "POST",
			data : {
				sid : sid,
				uid : uid,
				rcontent : rcontent,
				rscore : rscore
			},
			success : function(data) {
				//페이지를 리로드하자
				window.location.reload();
			},
			error : function() {
				alert("등록_에러");
			}
			
		});
	}

	//rid 값을 받아서 삭제하기 버튼을 누르면 삭제페이지로 rid 값을 보내준다.
	function deleteAjax() {
		var rid = document.querySelector("#rid").value;	
		alert(rid) ;
		$.ajax ({
			url : "/review/delete",
			type : "POST",
			data : {
				rid : rid
			},
			success : function(data) {
				//페이지를 리로드하자
				window.location.reload();
			},
			error : function() {
				alert("삭제_에러");
			}
			
		});
	}


</script>



</html>