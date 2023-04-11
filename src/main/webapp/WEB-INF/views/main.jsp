<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<!-- jQuery -->
	<script src="/resources/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="/resources/js/jquery.easing.1.3.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="/resources/js/respond.min.js"></script>
	<![endif]-->

</head>
<body>

	<div class="gtco-loader"></div>

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
						<li><a href="#">사이트소개</a></li>
						<li class="btn-cta"><a href="/login"><span>Login</span></a></li>
					</ul>
				</div>
			</div>

		</div>
	</nav>

	<header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner"
		style="background-image: url(/resources/images/main.jpg)"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-left">


					<div class="row row-mt-15em">
						<div class="col-md-7 mt-text animate-box"
							data-animate-effect="fadeInUp">
							<span class="intro-text-small">서울 모든 디저트를 <a
								href="http://gettemplates.co" target="_blank">맛보다!</a></span>
							<h1 class="cursive-font">All in good taste!</h1>


							<form action="/store/searchInfo" method="post">
								<div class="input-group" style="margin-top: 50px;">
									<input type="text" placeholder="지역 또는 검색어를 입력해주세요"
										class="form-control" name="search"
										style="background-color: white; height: 60px;"> <span
										class="input-group-btn">
										<div class="row form-group">
											<div class="col-md-12">
												<input type="submit" value="검색" class="form-control"
													class="white-color"
													style="color: white; background-color: orange; height: 60px; width: 100px">
											</div>
										</div>
									</span>
								</div>
							</form>


						</div>
					</div>
					<div class="col-md-4 col-md-push-1 animate-box"
						data-animate-effect="fadeInRight"></div>
				</div>


			</div>
		</div>
	</header>



	<div class="gtco-section">
		<div class="gtco-container">

			<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
				<h2 class="primary-color"
					style="font-size: 30px; font-weight: bold;">지역별 배빵빵</h2>
			</div>


			<script src="/resources/js/area.js"></script>
			
			<div class="row">
				<!-- 강남 -->
				<div class="col-lg-3 col-md-4 col-sm-6" onclick="areaGangNam()">
					<div class="fh5co-card-item image">
						<figure>
							<div class="overlay">
								<i class="ti-plus"></i>
							</div>
							<img src="/resources/images/강남.jpg" alt="Image"
								class="img-responsive" id="areaList">
						</figure>
						<div class="fh5co-text">
							<p>
								<span class="price cursive-font" id="강남">강남</span>
							</p>
						</div>
					</div>
				</div>
				<!-- 강서 -->
				<div class="col-lg-3 col-md-4 col-sm-6" onclick="areaWest()">
					<div class="fh5co-card-item image">
						<figure>
							<div class="overlay">
								<i class="ti-plus"></i>
							</div>
							<img src="/resources/images/강서.jpg" alt="Image"
								class="img-responsive" id="areaList">
						</figure>
						<div class="fh5co-text">
							<p>
								<span class="price cursive-font" >강서</span>
							</p>
						</div>
					</div>
				</div>
				<!-- 강북 -->
				<div class="col-lg-3 col-md-4 col-sm-6">
					<a href="#" class="fh5co-card-item image">
						<figure>
							<div class="overlay">
								<i class="ti-plus"></i>
							</div>
							<img src="/resources/images/강북.jpg" alt="Image"
								class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<p>
								<span class="price cursive-font">강북</span>
							</p>
						</div>
					</a>
				</div>
				<!-- 강동 -->
				<div class="col-lg-3 col-md-4 col-sm-6">
					<a href="#" class="fh5co-card-item image">
						<figure>
							<div class="overlay">
								<i class="ti-plus"></i>
							</div>
							<img src="/resources/images/강동.jpg" alt="Image"
								class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<p>
								<span class="price cursive-font">강동</span>
							</p>
						</div>
					</a>
				</div>

			</div>
		</div>
	</div>


	<!-- 카카오지도 -->
	<div id="gtco-features">

		<div id="map" style="width: 80%; height: 450px; margin: auto;"></div>

		<div id="map"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=53ca7ba233962018a7a8996d89d2622a&libraries=services"></script>
		<script>
		var listData = [];
		
/* 		$(document).ready(function() {
			  $.ajax({
				    type: "GET",
				    url: "/",
				    dataType: "json",
				    success: function(response) {
				        $.each(response, function(index, item) {
				            listData.push([item.saddr]);
				        });
				    },
				    error: function() {
				        console.log("Error while getting data");
				    }
				});
		    });
		   */
		<c:forEach items="${storeList}" var="store">
	        listData.push(["${store.saddr}","${store.sname}"]);
	    </c:forEach>   
	    /* console.log(listData) */

    // 맵을 넣을 div
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.561, 126.986), // 지도의 중심좌표
        level: 6 // 지도의 확대 레벨 
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
       // 지도 중심좌표를 접속위치로 변경합니다
    		map.setCenter(new kakao.maps.LatLng(lat, lon));
            
      });
    
} 

    // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
    var mapTypeControl = new kakao.maps.MapTypeControl();
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
    var zoomControl = new kakao.maps.ZoomControl();
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

    // 주소 -> 좌표 변환 라이브러리        
    var geocoder = new daum.maps.services.Geocoder();
    
    // foreach loop
    listData.forEach(function(addr, index) {
        geocoder.addressSearch(addr[0], function(result, status) {
            if (status === daum.maps.services.Status.OK) {
                var coords = new daum.maps.LatLng(result[0].y, result[0].x);
    
                var marker = new daum.maps.Marker({
                    position: coords,
                    clickable: true
                });
    
                // 마커를 지도에 표시합니다.
                marker.setMap(map);

                // 인포윈도우를 생성합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">' + addr[1] + '</div>',
                });
                    
         /*        // 마커에 클릭이벤트를 등록합니다
                kakao.maps.event.addListener(marker, 'click', function() {
                      // 마커 위에 인포윈도우를 표시합니다
                      infowindow.open(map, marker);  
	                }); */
                
                kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
                kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));

            // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
            function makeOverListener(map, marker, infowindow) {
                return function() {
                    infowindow.open(map, marker);
                };
            }

            // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
            function makeOutListener(infowindow) {
                return function() {
                    infowindow.close();
                };
            }
                
	            } 
	        });
	    });
    </script>
	</div>
	<!-- 카카오지도 끝 -->






	<footer id="gtco-footer" role="contentinfo"
		style="background-image: url(/resources/images/main.jpg)"
		data-stellar-background-ratio="0.4">
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
					Made by <i class="fa fa-love"></i><a
						href="https://bootstrapthemes.co">최현식,이혁주,정소영,박성준,심경외</a>
				</div>

			</div>



		</div>
	</footer>
	<!-- </div> -->

	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>

	
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

</body>
</html>
