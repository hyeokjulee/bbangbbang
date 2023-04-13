<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jsp"%>

<header id="gtco-header-sub" class="gtco-cover-sub2 gtco-cover-md" data-stellar-background-ratio="0.5">
<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-center">

					<div class="row row-mt-8em">
						<div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
							<h2 class="white-color" style="font-size: 60px; font-weight: bold;">사이트소개</h2>
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
	
	<%-- ${_csrf.parameterName}=${_csrf.token} --%>
	<form:form modelAttribute="UpdateNotice" 
			   action="/notices/noticeupdate?${nid}"
	           class="form-horizontal"
	           method = "post">
	<fieldset>
	<%--<sec:authentication property="principal" var="user" />  --%>
	<%-- <form:input path="nwriter" type="hidden" value="${user.username}" class="form-control"/> --%>
	제목 : <form:input path="ntitle" class="form-control" value="${notice.ntitle}"/>
	<form:errors path="ntitle" cssStyle="color:red"/><br>
	내용 : <form:input path="ncontent" class="form-control" value="${notice.ncontent}" style="height:300px; vertical-align: top;"/>
	<form:errors path="ncontent" cssStyle="color:red"/>
		 <form:input type="hidden" path="nid" id="nid" value="${notice.nid}"/><br>
	<button class="btn btn-secondary" onclick="history.back()" style="float:right">취소</button>
	<input type="submit" class="btn btn-primary" value="수정" style="float:right">
	
	</fieldset>
	</form:form>
	</div>
</body>
<section class="py-5 text-center container"></section><br><br><br><br>

<%@ include file="/WEB-INF/footer.jsp"%>