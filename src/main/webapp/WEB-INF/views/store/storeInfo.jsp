<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jsp"%>

<header id="gtco-header-sub" class="gtco-cover-sub2 gtco-cover-md" data-stellar-background-ratio="0.5">
<style>
li {
   list-style: none;
}

#map {
   width: 480;
   height: 400;
   margin: auto;
}
</style>
<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-center">

					<div class="row row-mt-8em">
						<div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
							<h2 class="white-color" style="font-size: 60px; font-weight: bold;">${store.sname}</h2>
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</header>
	
	<div class="gtco-section">
  <div class="gtco-container">
    <div class="row">
      <div class="col-md-12">
        <h3>${store.sname}</h3><br>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6 col-sm-6 ">
        <h4>메뉴</h4>
        <div class="panel panel-default">
          <div class="panel-body">
            <ul class="smenu">
              
            </ul>
          </div>
        </div>
      </div>
      <div class="col-md-5 col-md-push-1 col-sm-6">
      <h4>오시는 길</h4>
        <div class="panel panel-default">
          <div class="panel-body">
            <div id="map"></div>
            <ul>
              <li class="saddr">${store.saddr}</li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-md-5 col-md-push-1 col-sm-6">
      <h4>영업시간</h4>
        <div class="panel panel-default">
          <div class="panel-body">
            <ul>
              <li class="sopen">${store.sopen}</li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-md-5 col-md-push-1 col-sm-6">
      <h4>전화번호</h4>
        <div class="panel panel-default">
          <div class="panel-body">
            <ul>
              <li class="stel"><a href="tel://1234567920">${store.stel}</a></li>
            </ul>
          </div>
        </div>
      </div>
      
    </div>
  </div>
</div>

	
		<sec:authorize access="isAuthenticated()">
	    	<!-- 리뷰 등록 구역 -->
			<div class="card">
				<h5 class="card-header">리뷰 등록</h5>
				<div class="card-body">
					<h5 class="card-title">리뷰 등록</h5>
	
					<div class="container">
						<input type="hidden" class="sid" name="sid" value='${store.sid}'>
						<!-- <input type="hidden" name="mid" value="${member.mid}"> -->
						<input type="hidden" class="uid" name="uid" value="1"> <input
							type="text" class="form-data rcontent"> <input type="text"
							class="form-data rscore">
						<button class="btn btn-primary" type="button"
							onclick="insertAjax()">리뷰 등록하기</button>
					</div>
				</div>
			</div>
	    </sec:authorize>

		<!-- 리뷰 게시물 -->

		<c:forEach items="${reviewList}" var="r">
			<div class="card">
				<h5 class="card-header">${r.rscore}</h5>
				<div class="card-body">
					<h5 class="card-title">${r.rcontent}</h5>
					<input type="hidden" name="rid" value="${r.rid}"> <br>
					<br> <br>

					<div class="d-flex justify-content-end badge bg-light text-dark">${r.rregdate}</div>
					<div class="d-flex justify-content-end badge bg-light text-dark">${r.rupdate}</div>

					<!-- 리뷰 부분 -->
					<!-- // onclick 에 rid의 값을 updateModel(rid) 값을 넘겨주기 -->
					<button type="button" class="btn btn-primary"
						onclick="javascript:updateModel(${r.rid}, ${r.rscore}, '${r.rcontent}' )">수정모달</button>

				</div>
			</div>
		</c:forEach>

		<div class="modal review_modal" tabindex="-1">
			<div class="modal-dialog" id="updateModal">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal-title">모달_타이틀_</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body" id="modal-body">
						모달_바디_부분_자동으로_정보를_가져와서_바꿀_예정</div>
					<div class="modal-footer" id="modal-footer"></div>
				</div>
			</div>
		</div>
</body>

<script type="text/javascript">

//updateModel(${r.rid}, ${r.content}, ${r.rscore}) 에서 받은 값으로 modal을 띄우는 함수
function updateModel(rid, rscore, rcontent) {
    //모달창을 띄우자
    $('.review_modal').modal('show');
	var modal_title = document.getElementById("modal-title");
	modal_title.innerHTML = "리뷰 수정";

	var modal_body = document.getElementById("modal-body");
	modal_body.innerHTML =  "<input id='rid' value= '" + rid + "' >" +
							"<input id='rscore' value= '" + rscore + "' >" +
							"<input id='rcontent' value= '" + rcontent + "' >" ;
	
	var modal_footer = document.getElementById("modal-footer");
	modal_footer.innerHTML = "<button type='button' class='btn btn-primary' onclick='javascript:updateAjax()'>수정하기</button>"
		+ "<button type='button' class='btn btn-primary' onclick='javascript:deleteAjax()'>삭제하기</button>"
		+ "<button type='button' class='btn btn-secondary' data-bs-dismiss='modal'>닫기</button>" ; 
}


	// rid 값을 받아서 수정하기 버튼을 누르면 수정페이지로 이동
	// 버그가 터지니까 방향성 수정 -> modal_body 의 innerHTML 을 수정하자 -> id 값을 설정하기로
	// 그렇게하면 var 변수 = document.getElementById("id값") 으로 값을 가져올 수 있다. 
	function updateAjax() {
		var rid = document.querySelector("#rid").value;
		var rscore = document.querySelector("#rscore").value;
		var rcontent = document.querySelector("#rcontent").value;

		alert("rid : " + rid + ", rcontent : " + rcontent + ", rscore : " + rscore) ;

		$.ajax ({
			url : "/review/update",
			type : "POST",
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			data : {
				rid : rid,
				rcontent : rcontent,
				rscore : rscore
			},
			success : function(data) {
				//페이지를 리로드하자
				window.location.reload();
			},
			error : function() {
				alert("수정_에러");
			}
			
		});
	}

	function insertAjax() {
		var sid = $('div.container input.sid').val();
		var uid = $('div.container input.uid').val();
		var rcontent = $('div.container input.rcontent').val();
		var rscore = $('div.container input.rscore').val();

		alert("rcontent : " + rcontent + ", rscore : " + rscore + ", uid : " + uid + ", sid : " + sid) ;


		$.ajax ({
			url : "/review/insert",
			type : "POST",
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			data : {
				sid : sid,
				uid : uid,
				rcontent : rcontent,
				rscore : rscore
			},
			success : function(data) {
				//페이지를 리로드하자
				window.location.reload();
			},
			error : function() {
				alert("등록_에러");
			}
			
		});
	}

	
	//rid 값을 받아서 삭제하기 버튼을 누르면 삭제페이지로 rid 값을 보내준다.
	function deleteAjax() {
		var rid = document.querySelector("#rid").value;	
		alert(rid) ;
		$.ajax ({
			url : "/review/delete",
			type : "POST",
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			data : {
				rid : rid
			},
			success : function(data) {
				//페이지를 리로드하자
				window.location.reload();
			},
			error : function() {
				alert("삭제_에러");
			}
			
		});
	}


</script>


<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=53ca7ba233962018a7a8996d89d2622a&libraries=services"></script>
<script>
		var listData = [ [ "${store.saddr}" ] ];

		// 맵을 넣을 div
		var mapContainer = document.getElementById('map');
		var mapOption = {
			center : new daum.maps.LatLng(37.56, 126.98),
			level : 3
		};

		// 맵 표시
		var map = new daum.maps.Map(mapContainer, mapOption);

		map.setMaxLevel(10);
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 주소 -> 좌표 변환 라이브러리        
		var geocoder = new daum.maps.services.Geocoder();

		// foreach loop
		listData
				.forEach(function(addr, index) {
					geocoder
							.addressSearch(
									addr[0],
									function(result, status) {
										if (status === daum.maps.services.Status.OK) {
											var coords = new daum.maps.LatLng(
													result[0].y, result[0].x);

											map.setCenter(coords);

											var marker = new daum.maps.Marker({
												position : coords,
												clickable : true

											});

											// 마커를 지도에 표시합니다.
											marker.setMap(map);

											// 인포윈도우를 생성합니다
											var infowindow = new kakao.maps.InfoWindow(
													{
														content : '<div style="width:150px;text-align:center;padding:6px 0;">'
																+ addr[1]
																+ '</div>',
														removable : true
													});

											// 마커에 클릭이벤트를 등록합니다
											kakao.maps.event.addListener(
													marker, 'click',
													function() {
														// 마커 위에 인포윈도우를 표시합니다
														infowindow.open(map,
																marker);
													});
										}
									});

				});
	</script>

<script>
		var smenu = document.querySelector('ul.smenu');
		var modalbody = document.querySelector('div.modal-body');
		var sprice = document.querySelector('ul.sprice');
		var menu = "${store.smenu}";
		var price = "${store.sprice}";
		var menuArr = menu.split(',');

		var priceArr = price.split("',");

		console.log(menu);
		console.log(price);

		for (var i = 0; i < menuArr.length; i++) {
			var li = document.createElement('li');
			li.innerHTML = menuArr[i].toString().replace("'", "").replace("'",
					"")
					+ "     :     "
					+ priceArr[i].toString().replace("'", "").replace("'", "");

			smenu.appendChild(li);

			//li 가 18개가 넘을경우 더보기 버튼 생성
			if (i > 18) {
				var li = document.createElement('li');
				// 해당 버튼을 눌렀을 때, 모달을 띄우도록 처리
				li.innerHTML = "<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal''>더보기</button>";
				smenu.appendChild(li);
			}
			// 18개 이상일경우 더보기 버튼 클릭시 나타나는 메뉴
			if (i > 18) {
				var li = document.createElement('li');
				li.innerHTML = menuArr[i].toString().replace("'", "").replace(
						"'", "")
						+ "     :     "
						+ priceArr[i].toString().replace("'", "").replace("'",
								"");
				sprice.appendChild(li);
			}
		}
	</script>

<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">전체 메뉴</h1>
			</div>
			<div class="modal-body">${store.smenu }:${store.sprice }</div>
		</div>
	</div>
</div>

<div class="m"></div>

<div class="gototop js-top">
	<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
</div>


<!-- SUMMERNOTE ADD -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<script>
var $j341 = jQuery.noConflict();
</script>


<script>
		$j341('#summernote').summernote({
		  placeholder: '리뷰를 작성해주세요.',
		  tabsize: 2,
		  height: 100, // 변경 가능
		  maximumImageFileSize: 1048576*4,   // DB에 허용하는 최대 크기 1mb * 4
		  toolbar: [
			['style', ['style']],
			['font', ['bold', 'underline', 'clear']],
			['color', ['color']],
			['para', ['ul', 'ol', 'paragraph']],
			['table', ['table']],
			['insert', ['link', 'picture', 'video']],
			['view', ['fullscreen', 'codeview', 'help']]
		  ]
		});
		
	  </script>

</body>
<section class="py-5 text-center container"></section><br><br><br><br>

<%@ include file="/WEB-INF/footer.jsp"%>