<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jsp"%>

<header id="gtco-header-sub" class="gtco-cover-sub2 gtco-cover-md" data-stellar-background-ratio="0.5">
<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-center">

					<div class="row row-mt-8em">
						<div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
							<h2 class="white-color" style="font-size: 60px; font-weight: bold;">자유게시판</h2>
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</header>


<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>

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
					<c:forEach items="${boardList}" var="board">
						<tr>
							<td>${board.bid}</td>
							<td>
							<a href="/boards/board?bid=${board.bid}">${board.btitle}</a>
							</td>
							<td>${board.bwriter}</td>
							<td>${board.bview}</td>
							<td>${board.bregdate}</td>
							<td>${board.bupdate}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<hr>
			<div class="row form-group" >
			<div class="col-md-12">
			<a href="/boards/boardadd"><button type="button" class="btn btn-primary" style="float:right">등록</button></a>
			</div>
			</div>
		</div>
</body>
<section class="py-5 text-center container"></section><br><br><br><br>

<%@ include file="/WEB-INF/footer.jsp"%>