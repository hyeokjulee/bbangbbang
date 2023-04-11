<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" %>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>서울에서 배빵빵
	</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by GetTemplates.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="GetTemplates.co" />

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
	
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
	<link rel="stylesheet" href="/resources/css/bootstrap-datetimepicker.min.css">

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
					<div id="gtco-logo"><a href="index.html">서울에서 배빵빵 <em>.</em></a></div>
				</div>
				<div class="col-xs-8 text-right menu-1">
					<ul>
						<li class="has-dropdown">
							<a href="#">맛집리스트</a>
							<ul class="dropdown">
								<li><a href="#">Food Catering</a></li>
								<li><a href="#">Wedding Celebration</a></li>
								<li><a href="#">Birthday's Celebration</a></li>
							</ul>
						</li>
						<li><a href="#">자유게시판</a></li>
						<li><a href="#">사이트소개</a></li>
						
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li class="btn-cta"><a href="/admin/list"><span>회원목록</span></a></li>
					    </sec:authorize>
						
					    <sec:authorize access="hasRole('ROLE_USER')">
					    	<li class="btn-cta"><a href="/user/myEdit"><span>마이페이지</span></a></li>
					    </sec:authorize>
						
					    <sec:authorize access="isAuthenticated()">
					    	<li class="btn-cta"><button id="logout"><span>로그아웃</span></button></li>
					    </sec:authorize>
						
					    <sec:authorize access="!isAuthenticated()">
					    	<li class="btn-cta"><a href="/login"><span>로그인</span></a><li class="btn-cta">
					    	<li class="btn-cta"><a href="/join"><span>회원가입</span></a><li class="btn-cta">
					    </sec:authorize>
					</ul>
				</div>
			</div>
			
		</div>
	</nav>
	
	<header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner" style="background-image: url(/resources/images/main.jpg)" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-left">
					

					<div class="row row-mt-15em">
						<div class="col-md-7 mt-text animate-box" data-animate-effect="fadeInUp">
							<span class="intro-text-small">서울 모든 디저트들을 <a href="http://gettemplates.co" target="_blank">맛보다!</a></span>
							<h1 class="cursive-font">All in good taste!</h1>	
						</div>
						<div class="col-md-4 col-md-push-1 animate-box" data-animate-effect="fadeInRight">
						
						</div>
					</div>
							
					
				</div>
			</div>
		</div>
	</header>

	
	
	<div class="gtco-section">
		<div class="gtco-container">
			
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 class="primary-color" style="font-size: 30px; font-weight: bold;">지역별 배빵빵</h2>
					</div>
			
			
			<div class="row">

				<div class="col-lg-3 col-md-4 col-sm-6">
					<a href="index.html" class="fh5co-card-item image-popup">
						<figure>
							<div class="overlay"></div>
							<img src="/resources/images/1.jpg" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<p><span class="price cursive-font">강남</span></p>
						</div>
					</a>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<a href="/resources/images/img_2.jpg" class="fh5co-card-item image-popup">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="/resources/images/img_2.jpg" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<p><span class="price cursive-font">강서</span></p>
						</div>
					</a>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<a href="/resources/images/img_3.jpg" class="fh5co-card-item image-popup">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="/resources/images/img_3.jpg" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<p><span class="price cursive-font">강북</span></p>
						</div>
					</a>
				</div>


				<div class="col-lg-3 col-md-4 col-sm-6">
					<a href="/resources/images/img_4.jpg" class="fh5co-card-item image-popup">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="/resources/images/img_4.jpg" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<p><span class="price cursive-font">강동</span></p>
						</div>
					</a>
				</div>

			</div>
		</div>
	</div>
	
	
	<!-- 카카오지도 -->
	<div id="gtco-features">
		
		<div id="map" style="width:80%;height:450px; margin: auto;"></div>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=53ca7ba233962018a7a8996d89d2622a&libraries=services"></script>
		<script>
		  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		          mapOption = {
		            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		            level: 3 // 지도의 확대 레벨
		          };
		
		  // 지도를 생성합니다
		  var map = new kakao.maps.Map(mapContainer, mapOption);
		
		  // 주소-좌표 변환 객체를 생성합니다
		  var geocoder = new kakao.maps.services.Geocoder();
		
		  var positions = [
		    {
		      title: '광진구',
		      address: '서울 광진구 중곡동 132-11'
		    },
		    {
		      title: '생태연못',
		      address: '경기 남양주시 조안면 능내리 50'
		    },
		    {
		      title: '근린공원',
		      address: '경기 남양주시 별내면 청학로68번길 40'
		    }
		  ];
		
		  // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
		  var bounds = new kakao.maps.LatLngBounds(); //추가한 코드
		
		  positions.forEach(function (position) {
		    // 주소로 좌표를 검색합니다
		    geocoder.addressSearch(position.address, function(result, status) {
		
		      // 정상적으로 검색이 완료됐으면
		      if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		          map: map,
		          position: coords
		        });
		        marker.setMap(map); //추가한 코드
		
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(coords); //추가한 코드, 현재 코드에서 좌표정보는 point[i]가 아닌 coords이다.
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		          content: '<div style="width:150px;text-align:center;padding:6px 0;">' + position.title + '</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        // map.setCenter(coords); //제거한 코드
		        setBounds(); //추가한 코드
		      }
		    });
		  });
		  function setBounds() { //추가한 함수
		    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
		    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
		    map.setBounds(bounds);
		  }
		</script>
	</div>
	<!-- 카카오지도 끝 -->

	<footer id="gtco-footer" role="contentinfo" style="background-image: url(/resources/images/main.jpg)" data-stellar-background-ratio="0.4">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row row-pb-md">

				

				
				<div class="col-md-12 text-center">
					<div class="gtco-widget">
						<h3>서울에서 배빵빵</h3>
					</div>
					<div class="gtco-widget">
						<h3>Get Social</h3>
						<ul class="gtco-social-icons">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-linkedin"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-12 text-center copyright">
				Made by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">최현식,이혁주,정소영,박성준,심경외</a>
				</div>

			</div>

			

		</div>
	</footer>
	<!-- </div> -->

	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
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
	<script src="/resources/js/magnific-popup-options.js"></script>
	
	<script src="/resources/js/moment.min.js"></script>
	<script src="/resources/js/bootstrap-datetimepicker.min.js"></script>

	<!-- Main -->
	<script src="/resources/js/main.js"></script>
	
	<script>
		$('#logout').click(function(){   //logout 버튼을 클릭하였을 때
			$.ajax({
				type:'post',   //post 방식으로 전송
				url:'/logout?${_csrf.parameterName}=${_csrf.token}'
			});
			location.reload();
		});
	</script>

	</body>
</html>
