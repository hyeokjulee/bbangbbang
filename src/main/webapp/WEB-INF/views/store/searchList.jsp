<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jsp"%>
<header id="gtco-header-sub" class="gtco-cover-sub2 gtco-cover-md" data-stellar-background-ratio="0.5">
<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-center">

					<div class="row row-mt-8em">
						<div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
							<h2 class="white-color" style="font-size: 60px; font-weight: bold;">검색한 배빵빵</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
<section class="py-5 text-center container"></section><br>
						<!-- 검색창 띄우기 -->
							<form action="/store/searchInfo?${_csrf.parameterName}=${_csrf.token}" method="get">
									<div class="input-group" style="margin-top: 40px; margin-left: auto; margin-right: auto; text-align: center;">
									<div class="col-md-12">
										<input type="text" placeholder="지역 또는 검색어를 입력해주세요"
												class="form-control" name="search"
												style="background-color: white; height: 50px; width:700px"> 
										<span class="input-group-btn">
										<div class="row form-group">
										<input type="submit" value="검색" class="form-control" class="white-color"style="color: white; background-color: orange; height: 50px; width: 100px">
									</div>
									</div>
								</span>
							</div>
						</form><br>
<body>
<div class="container">
  <div class="row" id="store-list">
    <c:forEach var="store" items="${storeList}">
      <div class="col-md-3">
        <div class="panel panel-default" >
          <div class="panel-heading">
            <img src="${store.sphoto}" style="height:250px;" class="img-responsive" alt="${store.sname}"
      onerror="this.onerror=null; this.src='/resources/images/NoImage.jpg';">
          </div>
          <div class="panel-body">
            <h5 class="card-title">${store.sname}</h5>
            <p class="card-text" style="height:50px;">${store.saddr}</p>
          </div>
          <div class="panel-footer" style="display: flex; justify-content: center;">
			  <a href="/store/info?sid=${store.sid }" class="btn btn-sm btn-outline-secondary">View</a>
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