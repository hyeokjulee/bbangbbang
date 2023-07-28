<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jsp"%>

<header id="gtco-header-sub" class="gtco-cover-sub2 gtco-cover-md" data-stellar-background-ratio="0.5">
<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-center">

					<div class="row row-mt-8em">
						<div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
							<h2 class="white-color" style="font-size: 60px; font-weight: bold;">회원 목록</h2>
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</header>
	<section class="py-5 text-center container"></section><br><br><br><br>
<body>
	<div class="gtco-container" style="width:30%">
	<div class="row">
	<form:form action="${ pageContext.servletContext.contextPath }/admin/edit?${_csrf.parameterName}=${_csrf.token}" method="POST" modelAttribute="user">
	     <div class="row form-group" >
			<div class="col-md-12">
			<form:password path="password" class="form-control" placeholder="변경할 비밀번호"/>
			<form:errors path="password" cssStyle="color:red" /><br>
			</div>
		</div>
		<div class="row form-group" >
			<div class="col-md-12">
			<form:password path="passwordCheck"  class="form-control" placeholder="비밀번호 확인"/>
         	<form:errors path="passwordCheck" cssStyle="color:red" /><br>
			</div>
		</div>
		<form:hidden path="uid" value="${user.uid}"/>

		<div class="row form-group" >
				<div class="col-md-12">
					<input type="submit" value="비밀번호변경" class="form-control" style="background-color:orange; color:white;" onclick="return confirm('변경하시겠습니까?')">
				</div>
		</div>
	</form:form >
</div>
</div>
<section class="py-5 text-center container"></section><br><br><br><br>

<%@ include file="/WEB-INF/footer.jsp"%>