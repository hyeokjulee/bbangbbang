<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>


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

<!-- Modernizr JS -->
<script src="/resources/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="/resources/js/respond.min.js"></script>
	<![endif]-->

</head>
<body>

	<div class="gtco-loader"></div>
	
		<div id="page">

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
						<li class="has-dropdown"><a href="#">맛집리스트</a>
							<ul class="dropdown">
								<li><a href="#">Food Catering</a></li>
								<li><a href="#">Wedding Celebration</a></li>
								<li><a href="#">Birthday's Celebration</a></li>
							</ul></li>
						<li><a href="#">자유게시판</a></li>
						<li><a href="notices/noticelist">사이트소개</a></li>
						<li class="btn-cta"><a href="/login"><span>Login</span></a></li>
					</ul>
				</div>
			</div>

		</div>
	</nav>
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
<section class="py-5 text-center container"></section><br><br>

<div class="container">
  <div class="row" id="store-list">
    <c:forEach var="store" items="${storeList}">
      <div class="col-md-3">
        <div class="panel panel-default">
          <div class="panel-heading">
            <img src="${store.sphoto}" class="img-responsive" alt="${store.sname}"
              onerror="this.onerror=null; this.src='https://www.sejong.go.kr/images/prog/no_image.png';">
          </div>
          <div class="panel-body">
            <h5 class="card-title">${store.sname}</h5>
            <p class="card-text">${store.saddr}</p>
          </div>
          <div class="panel-footer">
            <div class="btn-group">
              <a href="/store/info?sid=${store.sid }" class="btn btn-sm btn-outline-secondary">View</a>
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
    <input type="hidden" class="page" value="1">
  </div>
</div>
   </div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
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

<!-- jQuery -->
	<script src="/resources/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="/resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="/resources/js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="/resources/js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="/resources/js/jquery.countTo.js"></script>

	<!-- Stellar Parallax -->
	<script src="/resources/js/jquery.stellar.min.js"></script>

	<!-- Magnific Popup -->
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>

	<script src="/resources/js/moment.min.js"></script>
	<script src="/resources/js/bootstrap-datetimepicker.min.js"></script>


	<!-- Main -->
	<script src="/resources/js/main.js"></script>
</body>
</html>