<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="header.jsp"%>

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
								<span class="price cursive-font">강남</span>
							</p>
						</div>
					</div>
				</div>
				<!-- 강서 -->
				<div class="col-lg-3 col-md-4 col-sm-6" onclick="areaGangseo()">
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
				<div class="col-lg-3 col-md-4 col-sm-6" onclick="areaGangbuk()">
					<div class="fh5co-card-item image">
						<figure>
							<div class="overlay">
								<i class="ti-plus"></i>
							</div>
							<img src="/resources/images/강북.jpg" alt="Image"
								class="img-responsive" id="areaList">
						</figure>
						<div class="fh5co-text">
							<p>
								<span class="price cursive-font">강북</span>
							</p>
						</div>
					</div>
				</div>
				<!-- 강동 -->
				<div class="col-lg-3 col-md-4 col-sm-6" onclick="areaGangdong()">
					<div class="fh5co-card-item image">
						<figure>
							<div class="overlay">
								<i class="ti-plus"></i>
							</div>
							<img src="/resources/images/강동.jpg" alt="Image"
								class="img-responsive" id="areaList">
						</figure>
						<div class="fh5co-text">
							<p>
								<span class="price cursive-font">강동</span>
							</p>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


	<!-- 카카오지도 -->
	<div id="gtco-features">

		<div id="map" style="width: 80%; height: 450px; margin: auto;"></div>

		<div id="map"></div>
		<script type="text/javascript"src="//dapi.kakao.com/v2/maps/sdk.js?appkey=53ca7ba233962018a7a8996d89d2622a&libraries=services"></script>
		<script>
			var listData = [ [ "서울 중구 세종대로 110" ], [ "경기 수원시 팔달구 효원로 1" ] ];

			// 맵을 넣을 div
			var mapContainer = document.getElementById('map');
			var mapOption = {
				center : new daum.maps.LatLng(35.95, 128.25),
				level : 13
			};

			// 맵 표시
			var map = new daum.maps.Map(mapContainer, mapOption);

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
			                removable: true
			            });

			            // 마커에 클릭이벤트를 등록합니다
			            kakao.maps.event.addListener(marker, 'click', function() {
			                // 마커 위에 인포윈도우를 표시합니다
			                infowindow.open(map, marker);
			            });
			        }
			    });
			});
		</script>
	</div>
	<!-- 카카오지도 끝 -->

<%@ include file="footer.jsp"%>



