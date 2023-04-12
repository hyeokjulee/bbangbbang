<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jsp"%>

<header id="gtco-header-sub" class="gtco-cover-sub2 gtco-cover-md" data-stellar-background-ratio="0.5">
<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-center">

					<div class="row row-mt-8em">
						<div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
							<h2 class="white-color" style="font-size: 60px; font-weight: bold;">사이트소개</h2>
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</header>

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
<section class="py-5 text-center container"></section><br><br><br><br>
<body>

	<div class="container">
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>수정일</th>
					</tr>
					<c:forEach items="${noticeList}" var="notice">
						<tr>
							<td>${notice.nid}</td>
							<td>
							<a href="/notices/notice?nid=${notice.nid}">${notice.ntitle}</a>
							</td>
							<td>${notice.nwriter}</td>
							<td>${notice.nview}</td>
							<td>${notice.nregdate}</td>
							<td>${notice.nupdate}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<hr>
			
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<div class="row form-group" >
					<div class="col-md-12">
						<a href="noticeadd"><button type="button" class="btn btn-primary" style="float:right">등록</button></a>
					</div>
				</div>
		    </sec:authorize>
		    
		</div>
<section class="py-5 text-center container"></section><br><br><br><br>

<%@ include file="/WEB-INF/footer.jsp"%>