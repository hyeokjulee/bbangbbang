<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="icon" href="/resources/images/빵2.png">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>서울에서 배빵빵</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by GetTemplates.co" />
<meta name="keywords"
	content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="GetTemplates.co" />

<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="/resources/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="/resources/css/icomoon.css">
<!-- Themify Icons-->
<link rel="stylesheet" href="/resources/css/themify-icons.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="/resources/css/bootstrap.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="/resources/css/magnific-popup.css">

<!-- Bootstrap DateTimePicker -->
<link rel="stylesheet"
	href="/resources/css/bootstrap-datetimepicker.min.css">

<!-- Owl Carousel  -->
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
<!-- Theme style  -->
<link rel="stylesheet" href="/resources/css/style.css">

<!-- jQuery -->
<script src="/resources/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="/resources/js/jquery.easing.1.3.js"></script>

<!-- Modernizr JS -->
<script src="/resources/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="/resources/js/respond.min.js"></script>
	<![endif]-->

</head>
<body>

	<div class="gtco-loader"></div>
	
		<!-- <div id="page"> -->

	<!-- <div class="page-inner"> -->
	<nav class="gtco-nav" role="navigation">
		<div class="gtco-container">

			<div class="row">
				<div class="col-sm-4 col-xs-12">
					<div id="gtco-logo">
						<a href="/">서울에서 배빵빵 <em>.</em></a>
					</div>
				</div>
				<div class="col-xs-8 text-right menu-1">
					<ul>
						<li><a href="/store/list">맛집리스트</a></li>
						<li><a href="/boards/boardlist">자유게시판</a></li>
						<li><a href="/notices/noticelist">공지사항</a></li>

						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li class="btn-cta"><a href="/admin/list"><span>회원목록</span></a></li>
					    </sec:authorize>
						
					    <sec:authorize access="hasRole('ROLE_USER')">
					    	<li class="btn-cta"><a href="/user/myEdit"><span>마이페이지</span></a></li>
					    </sec:authorize>
						
					    <sec:authorize access="isAuthenticated()">
					    	<li class="btn-cta"><a href>
							  <span id="logout">로그아웃 </span></a>
							</li>
					    </sec:authorize>
						
					    <sec:authorize access="!isAuthenticated()">
					    	<c:choose>
								<c:when test="${loginpage }">
									<li class="btn-cta"><a href="/join"><span>회원가입</span></a><li class="btn-cta">
								</c:when>
								<c:when test="${joinpage }">
									<li class="btn-cta"><a href="/login"><span>로그인</span></a><li class="btn-cta">
								</c:when>
								<c:otherwise>
									<li class="btn-cta"><a href="/login"><span>로그인</span></a><li class="btn-cta">
					    			<li class="btn-cta"><a href="/join"><span>회원가입</span></a><li class="btn-cta">
								</c:otherwise>
							</c:choose>
					    </sec:authorize>
					</ul>
				</div>
			</div>

		</div>
	</nav>