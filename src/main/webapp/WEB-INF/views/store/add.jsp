<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jsp"%>

<header id="gtco-header-sub" class="gtco-cover-sub2 gtco-cover-md" data-stellar-background-ratio="0.5">
<div class="overlay"></div>
      <div class="gtco-container">
         <div class="row">
            <div class="col-md-12 col-md-offset-0 text-center">

               <div class="row row-mt-8em">
                  <div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
                     <h2 class="white-color" style="font-size: 60px; font-weight: bold;">가게 등록</h2>
                  </div>
                  
               </div>
               
            </div>
         </div>
      </div>
   </header>

         
<section class="py-5 text-center container"></section><br><br>
<body>
   <div class="container">
   <div class="row form-group" ></div>

<!--  ${_csrf.parameterName}=${_csrf.token} -->

   <form:form modelAttribute="NewStore"
      action="/store/add"
      class="form-horizontal" method="POST" enctype="multipart/form-data">
      <fieldset>
         
         가게 이름 :
         <form:input path="sname" class="form-control" />
         가게 주소 :
         <form:input path="saddr" class="form-control" />
         가게 번호 :
         <form:input path="stel" class="form-control" />
         가게 사진 :
         <form:input path="sphotoFile" type="file" class="form-control" />
         <!-- 여기는 따로 수정이 필요 -->
         메뉴 :
         <form:input path="smenu" class="form-control" />
         가격 :
         <form:input path="sprice" class="form-control" />


         <br><input type="submit" class="btn btn-primary" value="등록" />


      </fieldset>
   </form:form>
</div>
   
</body>
<section class="py-5 text-center container"></section><br><br><br><br>

<%@ include file="/WEB-INF/footer.jsp"%>