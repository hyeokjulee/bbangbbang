<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jsp"%>

<header id="gtco-header-sub" class="gtco-cover-sub2 gtco-cover-md" data-stellar-background-ratio="0.5">
<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-center">

					<div class="row row-mt-8em">
						<div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
							<h2 class="white-color" style="font-size: 60px; font-weight: bold;">자유게시판</h2>
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</header>


<section class="py-5 text-center container"></section><br><br><br><br>

<body>

<div class="container">
	<div class="row form-group" ></div>
	
	<form:form modelAttribute="UpdateBoard" 
			   action="./boardupdate?${_csrf.parameterName}=${_csrf.token}"
	           class="form-horizontal"
	           method = "post">
	<fieldset>
	<%-- <sec:authentication property="principal" var="user" /> --%>
	<%-- <form:input path="bwriter" type="hidden" value="${user.username}" class="form-control"/> --%>
	제목 : <form:input path="btitle" class="form-control" value="${board.btitle}"/>
	내용 : <form:input path="bcontent" class="form-control" rows="10" value="${board.bcontent}" style="height:300px; vertical-align: top;"/>
 		 <form:input type="hidden" path="bid" id="bid" size="20" maxlength="20" value="${baord.bid}"/><br>
	<button class="btn btn-secondary" style="float: right; margin-right: 5px;" onclick="history.back()">취소</button>
	<input type="submit" class="btn btn-primary" style="float: right; margin-right: 5px;" value="수정">
	
	</fieldset>
	</form:form>
</div>

</body>
<section class="py-5 text-center container"></section><br><br><br><br>

<%@ include file="/WEB-INF/footer.jsp"%>
