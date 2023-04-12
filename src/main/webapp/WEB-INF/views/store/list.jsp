<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<header id="gtco-header-sub" class="gtco-cover-sub2 gtco-cover-md" data-stellar-background-ratio="0.5">
<div class="overlay"></div>
      <div class="gtco-container">
         <div class="row">
            <div class="col-md-12 col-md-offset-0 text-center">

               <div class="row row-mt-8em">
                  <div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
                     <h2 class="white-color" style="font-size: 60px; font-weight: bold;">맛집 전체보기</h2>
                  </div>
                  
               </div>
               
            </div>
         </div>
      </div>
   </header>
<body>
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
</body>
</html>
<%@ include file="/WEB-INF/footer.jsp"%>