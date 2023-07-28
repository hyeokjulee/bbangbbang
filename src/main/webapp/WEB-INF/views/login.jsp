<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jsp"%>

<header id="gtco-header-sub" class="gtco-cover-sub2 gtco-cover-md" data-stellar-background-ratio="0.5">
<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-center">

					<div class="row row-mt-8em">
						<div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
							<h2 class="white-color" style="font-size: 60px; font-weight: bold;">로그인</h2>
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</header>
	
	<section class="py-5 text-center container"></section><br><br><br>
		<div class="gtco-container" style="width:30%">
			<div class="row">
					<form action="/login" method="post">
						<div class="row form-group" >
							<div class="col-md-12">
								<input type="text" name="username" id="username" class="form-control" placeholder="Email">
							</div>
						</div>
						<div class="row form-group" >
							<div class="col-md-12">
								<input type="password" name="password" id="password" class="form-control" placeholder="password">
							</div>
						</div>
						
						<div style="color: red;">${error}</div>
						
						<div class="row form-group" >
							<div class="col-md-12">
								<input type="submit" value="로그인" class="form-control" class="white-color">
							</div>
						</div>
						<div class="row form-group" >
							<div class="col-md-12">
								<input type="button" value="회원가입" class="form-control" style="background-color:orange; color:white;" onclick="location.href='/join'">
							</div>
						</div>
						
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>		
				</div>
			</div>
<section class="py-5 text-center container"></section><br><br><br><br>

<%@ include file="/WEB-INF/footer.jsp"%>