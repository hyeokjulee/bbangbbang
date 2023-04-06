<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>게시판</title>

<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>

<script>
	/*  function removeCar(cid) {
	     $.ajax({
	         type:"POST",
	         url:"/cars/remove",
	         data:{cid: cid },
	         beforeSend : function(xhr)
	         {  
	             xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	         },
	         success: function(result) {
	             alert("제품이 삭제되었습니다.")
	         },
	         error:function (request, status, error) {
	             alert(request.status + " " + request.responseText);
	         }
	     })

	     window.location.reload();
	 } */
</script>
</head>
<body>

	<div class="container">
		<div class="container">
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>좋아요</th>
						<th>싫어요</th>
						<th>작성일</th>
					</tr>
					<c:forEach items="${boardList}" var="board">
						<tr>
							<td>${board.bid}</td>
							<td>
							<a href="/boards/board?bid=${board.bid}">${board.btitle}</a>
							</td>
							<td>${board.bwriter}</td>
							<td>${board.bview}</td>
							<td>${board.blike}</td>
							<td>${board.bhate}</td>
							<td>${board.bdate}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<hr>
		</div>
	</div>
</body>
</html>