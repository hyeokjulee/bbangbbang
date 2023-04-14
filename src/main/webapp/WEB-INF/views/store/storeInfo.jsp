<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jsp"%>

<header id="gtco-header-sub" class="gtco-cover-sub2 gtco-cover-md" data-stellar-background-ratio="0.5">

<style>

	.myform_star {
		display: inline-block;
		direction: rtl;
		border:0;
	}
	.myform_star fieldset legend{
		text-align: right;
	}
	.myform_star input[type=radio]{
		display: none;
	}
	.myform_star label{
		font-size: 3em;
		color: transparent;
		text-shadow: 0 0 0 #f0f0f0;
	}
	.myform_star label:hover{
		text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	.myform_star label:hover ~ label{
		text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	.myform_star input[type=radio]:checked ~ label{
		text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	
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
				<h3>${store.sname}</h3>
				<br>
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
				<h4>위치</h4>
				<div class="panel panel-default">
					<div class="panel-body">
						<div id="map"></div>
						<ul>
							<li class="saddr">${store.saddr}</li>
						</ul>
					</div>
				</div>
				<h4>영업시간</h4>
				<div class="panel panel-default">
					<div class="panel-body">
						<ul>
							<li class="sopen">${store.sopen}</li>
						</ul>
					</div>
				</div>
				<h4>전화번호</h4>
				<div class="panel panel-default">
					<div class="panel-body">
						<ul>
							<li class="sopen">${store.stel}</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

<br><br><br><br><br>
	
<sec:authorize access="isAuthenticated()">
	<!-- 리뷰 등록 구역 -->
	<div class="panel panel-default">
	    	<div class="panel-body"><b>리뷰 등록</b></div>
	      <div class="panel-body">

			<div class="container">
				<input type="hidden" class="sid" name="sid" value='${store.sid}'>
				<sec:authentication property="principal" var="user" />
				<input type="hidden" name="rwriter" value="${user.username}">
				
				<input type="hidden" class="uid" name="uid" value="${id}">


				<fieldset class="myform_star">
					<input type="radio" class="rscore2" value="5" id="rate5" name="rate"><label
						for="rate5">★</label>
					<input type="radio" class="rscore2" value="4" id="rate4" name="rate"><label
						for="rate4">★</label>
					<input type="radio" class="rscore2" value="3" id="rate3" name="rate"><label
						for="rate3">★</label>
					<input type="radio" class="rscore2" value="2" id="rate2" name="rate"><label
						for="rate2">★</label>
					<input type="radio" class="rscore2" value="1" id="rate1" name="rate"><label
						for="rate1">★</label>
				</fieldset> <br>

				<input class="form-data rcontent form-control" row="3" value=""> <br>

				<input type="hidden" class="form-data rscore">
					
				<button class="btn btn-primary pull-right" type="button" onclick="insertAjax()">리뷰 등록하기</button>
			</div>
		</div>

</sec:authorize>

		

		<!-- 리뷰 게시물 -->

		

<c:forEach items="${reviewList}" var="r">
    <div class="panel panel-default">
        <div class="panel-heading rscore_x_star">${r.rscore}</div>
        <div class="panel-body">
            <p>${r.rcontent}</p>
        </div>
        <div class="panel-footer">
            <div class="row">
                <div class="col-sm-6">
                    <small>${r.rregdate}</small>
                </div>
                <div class="col-sm-6">
                    <div class="btn-group pull-right">
					<c:if test="${r.uid == id}">
                        <button type="button" class="btn btn-primary"  onclick="javascript:updateModel('${r.rid}', '${r.rscore}', '${r.rcontent}' )">수정모달</button>
					</c:if>
                    </div>
                </div> 
            </div>
        </div>
    </div>
</c:forEach>
	</div>
</div>
		<div class="modal review_modal" tabindex="-1">
			<div class="modal-dialog" id="updateModal">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal-title">모달_타이틀_</h5>
					</div>
					<div class="modal-body" id="modal-body">
						모달_바디_부분_자동으로_정보를_가져와서_바꿀_예정</div>
					<div class="modal-footer" id="modal-footer"></div>
				</div>
			</div>
		</div>
		
			</div>
</body>


<script type="text/javascript">

	const fieldset = document.querySelector(".myform_star");

	fieldset.addEventListener("click", function() {
		var selectedValue = document.querySelector('input[class="rscore2"]:checked').value;
		console.log(selectedValue);
		var rscore = $('div.container input.rscore').val(selectedValue);
	});

</script>

<script>

	var starImg = '<Image src="/resources/images/star_over.png" width="20" height="20" />';

	// star 대신 starImg 를 넣도록 수정하기

	var rscore_x_star = document.getElementsByClassName("rscore_x_star");
	for (var i = 0; i < rscore_x_star.length; i++) {
		var rscore = rscore_x_star[i].innerHTML;
		//rscore 의 값 만큼 starImg를 출력하기
		var star = "";
		for (var j = 0; j < rscore; j++) {
			star += starImg;
		}
		rscore_x_star[i].innerHTML = star;
		
	}

</script>


<script type="text/javascript">

//updateModel(${r.rid}, ${r.content}, ${r.rscore}) 에서 받은 값으로 modal을 띄우는 함수
function updateModel(rid, rscore, rcontent) {
    //모달창을 띄우자
    $('.review_modal').modal('show');
	var modal_title = document.getElementById("modal-title");
	modal_title.innerHTML = "리뷰 수정";

	var modal_body = document.getElementById("modal-body");
	modal_body.innerHTML =  "<input id='rid' type='hidden' value= '" + rid + "' ><br>"  +
	
    	"<fieldset class='myform_star modal_review'>"+
        "<input type='radio' class='rscore3' value='5' id='rate5_2' name='rate2'><label for='rate5_2'>★</label>"+
        "<input type='radio' class='rscore3' value='4' id='rate4_2' name='rate2'><label for='rate4_2'>★</label>"+
        "<input type='radio' class='rscore3' value='3' id='rate3_2' name='rate2'><label for='rate3_2'>★</label>"+
        "<input type='radio' class='rscore3' value='2' id='rate2_2' name='rate2'><label for='rate2_2'>★</label>"+
        "<input type='radio' class='rscore3' value='1' id='rate1_2' name='rate2'><label for='rate1_2'>★</label> </fieldset> "+

							"<input class='rscore_star' type='hidden' value= '" + rscore + "' ><br>"  +


							"<input id='rcontent' class='form-control' value= '" + rcontent + "' >" ;
	
	var modal_footer = document.getElementById("modal-footer");
	modal_footer.innerHTML = "<button type='button' class='btn btn-primary' onclick='javascript:updateAjax()'>수정하기</button>"
		+ "<button type='button' class='btn btn-primary' onclick='javascript:deleteAjax()'>삭제하기</button>"
		+ "<button type='button' class='btn btn-secondary' data-dismiss='modal'>닫기</button>" ; 

		updateModa_star();
}

</script>

<script>

	function updateModa_star(){
		
	var fieldset2 = document.querySelector(".modal_review");	
	fieldset2.addEventListener("click", function() {
		var selectedValu = document.querySelector('input[class="rscore3"]:checked').value;
		console.log(selectedValu);
		var rscore3 = $('input.rscore_star').val(selectedValu);
	});

	}



</script>
<script>


	// rid 값을 받아서 수정하기 버튼을 누르면 수정페이지로 이동
	// 버그가 터지니까 방향성 수정 -> modal_body 의 innerHTML 을 수정하자 -> id 값을 설정하기로
	// 그렇게하면 var 변수 = document.getElementById("id값") 으로 값을 가져올 수 있다. 
	function updateAjax() {
		var rid = document.querySelector("#rid").value;
		var rscore = document.querySelector(".rscore_star").value;
		var rcontent = document.querySelector("#rcontent").value;

		//alert("rid : " + rid + ", rcontent : " + rcontent + ", rscore : " + rscore) ;

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
		var rcontent = $('div.container input.rcontent').val() ;
		var rscore = $('div.container input.rscore').val();
		
		if (!(1<=rscore&&rscore<=5)) {
			rscore = 0;
		}

	//	alert("rcontent : " + rcontent + ", rscore : " + rscore +  ", sid : " + sid) ;


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
	//	alert(rid) ;
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

		//console.log(menu);
		//console.log(price);

		for (var i = 0; i < menuArr.length; i++) {
			var li = document.createElement('li');
			li.innerHTML = "<div class='left'>"+menuArr[i].toString().replace("'", "").replace("'","")+"</div>" +
							"<div class='right'>"+priceArr[i].toString().replace("'", "").replace("'","")+"</div>"
			smenu.appendChild(li);

			//li 가 18개가 넘을경우 더보기 버튼 생성
			if (i > 18) {
				var li = document.createElement('li');
				// 해당 버튼을 눌렀을 때, 모달을 띄우도록 처리
				li.innerHTML = "<button type='button' class='btn btn-primary text-align-center' data-toggle='modal' data-target='#exampleModal''>메뉴 더보기</button>";
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

	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
		  <div class="modal-content">
			<div class="modal-header">
			  <h1 class="modal-title fs-5" id="exampleModalLabel">Menu</h1>
			</div>
			<div class="modal-body">
			  <ul id="menu_modal_target">

			  </ul>
			</div>
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

<style>
	
	li {
	  list-style: none;
	  overflow: hidden;
	}
	
	.left {
	  float: left;
	}
	
	.right {
	  float: right;
	}
</style>

<script>
var menu_modal_target = document.getElementById('menu_modal_target');
// menu_modal_target.innerHTML = "모달 타겟에 잘 도착했나?";
// menu_modal_target 에 li 를 추가해야한다.
// menuArr[i], priceArr[i] 를 이용한다.
// menuArr[i] 는 smenu 의 값이고, priceArr[i] 는 sprice 의 값이다.
// menuArr[i] 는 왼쪽에, priceArr[i] 는 오른쪽에 띄운다.

for (var i = 0; i < menuArr.length; i++) {
	var li = document.createElement('li');
	
	li.innerHTML = "<div class='left'>"+menuArr[i]+"</div><div class='right'>"+priceArr[i]+"</div>" ;
	
	menu_modal_target.appendChild(li);
}

</script>	


<script>


</script>


</body>
<section class="py-5 text-center container"></section><br><br><br><br>

<%@ include file="/WEB-INF/footer.jsp"%>