<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jsp"%>
<header id="gtco-header-sub" class="gtco-cover-sub2 gtco-cover-md" data-stellar-background-ratio="0.5">
<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-center">

					<div class="row row-mt-8em">
						<div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
							<h2 class="white-color" style="font-size: 60px; font-weight: bold;">지역별 배빵빵</h2>
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</header>
	<section class="py-5 text-center container"></section><br><br><br><br>
<body>
<div class="container">
  <div class="row" id="store-list">
    <c:forEach var="store" items="${areaList}">
      <div class="col-md-3">
        <div class="panel panel-default" >
          <div class="panel-heading">
            <img src="${store.sphoto}" style="height:250px;" class="img-responsive" alt="${store.sname}"
              onerror="this.onerror=null; this.src='https://www.sejong.go.kr/images/prog/no_image.png';">
          </div>
          <div class="panel-body">
            <h5 class="card-title">${store.sname}</h5>
            <p class="card-text" style="height:50px;">${store.saddr}</p>
          </div>
          <div class="panel-footer">
            <div class="btn-group">
              <a href="/store/detail?sid=${store.sid}" class="btn btn-primary">Go Detail</a>
              <input type="hidden" name="sid" value="${store.sid}">
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
    <input type="hidden" class="page" value="1">
  </div>
</div>

</body>
<section class="py-5 text-center container"></section><br><br><br><br>

<%@ include file="/WEB-INF/footer.jsp"%>