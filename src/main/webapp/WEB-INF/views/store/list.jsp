<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div class="row" id="store-list">
			<c:forEach var="store" items="${storeList}">
				<div class="col-md-3">
					<div class="card mb-4 shadow-sm storeItem">
						<img src="${store.sphoto}" class="card-img-top"
							alt="${store.sname}"
							onerror="this.onerror=null; this.src='https://www.sejong.go.kr/images/prog/no_image.png';">
						<div class="card-body">
							<h5 class="card-title">${store.sname}</h5>
							<p class="card-text">${store.saddr}</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="/store/info?sid=${store.sid }"
										class="btn btn-sm btn-outline-secondary">View</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<input type="hidden" class="page" value="1">
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		var loading = false;
		var page = document.querySelector('.page').value;
		$(window).scroll(
				function() {
					if ($(window).scrollTop() + $(window).height() >= $(
							document).height()) {
						if (!loading) {
							loading = true;
							page++;
							console.log(page)
							document.querySelector('.page').value = page;
							$.ajax({
								url : "/store/list",
								type : "POST",
								beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
									xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
								},
								data : { page : page },
								success : function(data) {
									$('#store-list').append(data);
									loading = false;
								},
								error : function() {
									alert('There is no more data to load.');
									loading = true;
								}
							});
						}
					}
				});
	</script>
</body>
</html>