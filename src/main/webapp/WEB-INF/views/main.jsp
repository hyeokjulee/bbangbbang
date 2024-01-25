<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jsp"%>
						<header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner"
							style="background-image: url(/resources/images/main.jpg)"
							data-stellar-background-ratio="0.5">
							<div class="overlay"></div>
							<div class="gtco-container">
								<div class="row">
									<div class="col-md-12 col-md-offset-0 text-left">
										<div class="row row-mt-15em">
											<div class="col-md-7 mt-text animate-box" data-animate-effect="fadeInUp">
												<span class="intro-text-small">서울 모든 디저트를 <a
														href="http://gettemplates.co" target="_blank">맛보다!</a></span>
												<h1 class="cursive-font">All in good taste!</h1>

												<form action="/store/searchInfo?${_csrf.parameterName}=${_csrf.token}" method="get">
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
										<div class="col-md-4 col-md-push-1 animate-box" data-animate-effect="fadeInRight">
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

								<!-- <script src="/resources/js/area.js"></script> -->

								<div class="row">
									<!-- 강남 -->
									<div class="col-lg-3 col-md-4 col-sm-6" onclick="areaGangNam()">
										<div class="fh5co-card-item image">
											<figure>
												<div class="overlay">
													<i class="ti-plus"></i>
												</div>
												<img src="/resources/images/강남.jpg" alt="Image" class="img-responsive"
													id="areaList">
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
												<img src="/resources/images/강서.jpg" alt="Image" class="img-responsive"
													id="areaList">
											</figure>
											<div class="fh5co-text">
												<p>
													<span class="price cursive-font" id="강서">강서</span>
												</p>
											</div>
										</div>
									</div>
									<!-- 강북 -->
									<div class="col-lg-3 col-md-4 col-sm-6" onclick="areaGangBuk()">
										<div class="fh5co-card-item image">
											<figure>
												<div class="overlay">
													<i class="ti-plus"></i>
												</div>
												<img src="/resources/images/강북.jpg" alt="Image" class="img-responsive"
													id="areaList">
											</figure>
											<div class="fh5co-text">
												<p>
													<span class="price cursive-font" id="강북">강북</span>
												</p>
											</div>
										</div>
									</div>
									<!-- 강동 -->
									<div class="col-lg-3 col-md-4 col-sm-6" onclick="areaGangDong()">
										<div class="fh5co-card-item image">
											<figure>
												<div class="overlay">
													<i class="ti-plus"></i>
												</div>
												<img src="/resources/images/강동.jpg" alt="Image" class="img-responsive"
													id="areaList">
											</figure>
											<div class="fh5co-text">
												<p>
													<span class="price cursive-font" id="강동">강동</span>
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
							<script type="text/javascript"
								src="//dapi.kakao.com/v2/maps/sdk.js?appkey=*****************&libraries=services"></script>
							<script>
							$('#logout').click(function(){   //logout 버튼을 클릭하였을 때
								$.ajax({
									type:'post',   //post 방식으로 전송
									url:'/logout?${_csrf.parameterName}=${_csrf.token}'
								});
								location.reload();
							});
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
									listData.push(["${store.saddr}","${store.sname}","${store.sid}","${store.stel}",("${store.sphoto}"?"${store.sphoto}" : "/resources/images/NoImage.jpg")]);
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
									navigator.geolocation.getCurrentPosition(function (position) {

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
								listData.forEach(function (addr, index) {
									geocoder.addressSearch(addr[0], function (result, status) {
										if (status === daum.maps.services.Status.OK) {
											var coords = new daum.maps.LatLng(result[0].y, result[0].x);

											var marker = new daum.maps.Marker({
												position: coords,
												clickable: true
											});
											
											var content = '<div class="overlaybox">' +
										    '   <div class="boxtitle"><i class="bi bi-house"></i>&nbsp&nbsp&nbsp'+addr[1]+'</div>' +
										    '	<div class="first" onclick="location.href=\'/store/info?sid='+ addr[2]+'\'" '+
										    '	style="background: url('+ addr[4] +') no-repeat center center;background-size: cover;position: relative;width: 100%;height: 0;padding-bottom: 81%;margin-bottom: 8px;">'+
										    '    </div>' +
										    '    <ul>' +
										    '        <li class="up">' +
										    '            <i class="bi bi-telephone"></i>&nbsp&nbsp&nbsp<span class="title">'+(addr[3] ? addr[3] : "정보없음")+'</span>' +        
										    '        </li>' +
										    '        <li class="up">' +    
										    '            <i class="bi bi-geo-alt"></i>&nbsp&nbsp&nbsp<span class="title">'+addr[0]+'</span>' +    
										    '        </li>' +
										    '    </ul>' +
										    '</div>'

											// 마커를 지도에 표시합니다.
											marker.setMap(map);

											var overlay = new kakao.maps.CustomOverlay({
											    position: coords,
											    content: content,
											    xAnchor: 0.42,
											    yAnchor: 1.05
											});

									        // 마커에 클릭이벤트를 등록합니다
										    kakao.maps.event.addListener(marker, 'click', function() {
												 if (overlay.getMap()) {
												        overlay.setMap(null);
												    }
												 // 커스텀 오버레이 표시
												 else{overlay.setMap(map);}
											   });
									        
									        /* kakao.maps.event.addListener(map, 'click', function() {
												 // 마커 위에 인포윈도우를 표시합니다
												 infowindow.close();  
											   });        
 */
											/* kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
											kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));

											// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
											function makeOverListener(map, marker, infowindow) {
												return function () {
													infowindow.open(map, marker);
												};
											}

											// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
											function makeOutListener(infowindow) {
												return function () {
													infowindow.close();
												};
											} */
										}
									});
								});
							</script>
						</div>
						<!-- 카카오지도 끝 -->

						<script>
							function areaGangNam() {
								var form = document.createElement("form");
								form.action = "/store/areaList";
								form.method = "GET";
								
								var hiddenField = document.createElement("input");
								hiddenField.type = "hidden";
								hiddenField.name = "area1";
								hiddenField.value = "강남";
								
								var hiddenField2 = document.createElement("input");
								hiddenField2.type = "hidden";
								hiddenField2.name = "area2";
								hiddenField2.value = "서초";
								
								var hiddenField3 = document.createElement("input");
								hiddenField3.type = "hidden";
								hiddenField3.name = "area3";
								hiddenField3.value = "송파";
								
								form.appendChild(hiddenField);
								form.appendChild(hiddenField2);
								form.appendChild(hiddenField3);
								
								document.body.appendChild(form);
								form.submit();
							}
							
							function areaWest() {
								var form = document.createElement("form");
								form.action = "/store/areaList";
								form.method = "GET";
								
								var hiddenField = document.createElement("input");
								hiddenField.type = "hidden";
								hiddenField.name = "area1";
								hiddenField.value = "강서";
								
								var hiddenField2 = document.createElement("input");
								hiddenField2.type = "hidden";
								hiddenField2.name = "area2";
								hiddenField2.value = "양천";
								
								var hiddenField3 = document.createElement("input");
								hiddenField3.type = "hidden";
								hiddenField3.name = "area3";
								hiddenField3.value = "구로";
								
								form.appendChild(hiddenField);
								form.appendChild(hiddenField2);
								form.appendChild(hiddenField3);
								
								document.body.appendChild(form);
								form.submit();
							}
							
							 function areaGangBuk() {
								var form = document.createElement("form");
								form.action = "/store/areaList";
								form.method = "GET";
								
								var hiddenField = document.createElement("input");
								hiddenField.type = "hidden";
								hiddenField.name = "area1";
								hiddenField.value = "강북";
								
								var hiddenField2 = document.createElement("input");
								hiddenField2.type = "hidden";
								hiddenField2.name = "area2";
								hiddenField2.value = "종로";
								
								var hiddenField3 = document.createElement("input");
								hiddenField3.type = "hidden";
								hiddenField3.name = "area3";
								hiddenField3.value = "동대문";
								
								form.appendChild(hiddenField);
								form.appendChild(hiddenField2);
								form.appendChild(hiddenField3);
								
								document.body.appendChild(form);
								form.submit();
							}
							 
							 function areaGangDong() {
								var form = document.createElement("form");
								form.action = "/store/areaList";
								form.method = "GET";
								
								var hiddenField = document.createElement("input");
								hiddenField.type = "hidden";
								hiddenField.name = "area1";
								hiddenField.value = "강동";
								
								var hiddenField2 = document.createElement("input");
								hiddenField2.type = "hidden";
								hiddenField2.name = "area2";
								hiddenField2.value = "광진";
								
								var hiddenField3 = document.createElement("input");
								hiddenField3.type = "hidden";
								hiddenField3.name = "area3";
								hiddenField3.value = "중랑";
								
								form.appendChild(hiddenField);
								form.appendChild(hiddenField2);
								form.appendChild(hiddenField3);
								
								document.body.appendChild(form);
								form.submit();
							}
						</script>

<%@ include file="/WEB-INF/footer.jsp"%>