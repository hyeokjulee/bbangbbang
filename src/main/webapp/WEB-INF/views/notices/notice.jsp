<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jsp"%>

<header id="gtco-header-sub" class="gtco-cover-sub2 gtco-cover-md" data-stellar-background-ratio="0.5">
<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-center">

					<div class="row row-mt-8em">
						<div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
							<h2 class="white-color" style="font-size: 60px; font-weight: bold;">공지사항</h2>
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</header>

<section class="py-5 text-center container"></section><br><br>
<script>
	
	function checkFunction(nid, check) {
		$.ajax({
			type : "POST",
			url : "/notices/check",
			data : {
				nid : nid,
				check : check
			},
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				alert("등록 성공");
			},
			error : function(request, status, error) {
				alert(request.status + " " + request.responseText);
			}
		});
		window.location.reload();
	}
	
	function checkAlert(result){

		 if(result === ''){
	          return;
	        }
		 
		 if(result === "update success"){
	            alert("수정이 완료되었습니다.");
	        }
		 
        if(result === "delete success"){
            alert("삭제가 완료되었습니다.");
        }
	}
</script>

</head>
<body>
<div class="container">
<!-- 주 게시물 -->
    <div class="text-right">작성일: ${notice.nregdate}  | 조회수 [ ${notice.nview} ]</div>

    <div class="panel panel-default">
      <div class="panel-heading">${notice.ntitle}</div>
      <div class="panel-body">
        <h5>${notice.ncontent}</h5>
        <br><br><br>
        </div>
       
  <!-- <button type="button" class="btn btn-secondary" style="float:right; margin-right: 5px;" onclick="history.back()">취소</button> -->
  
  <sec:authorize access="hasRole('ROLE_ADMIN')">
	  <form action="/notices/deletenotice" method="post" style="display:inline;">
	    <input type="hidden" name="nid" value="${notice.nid }"/>
	    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	  <input type="submit" class="btn btn-danger btn-outline" style="float:right" value="삭제"/>
  <a href="/notices/noticeupdate?nid=${notice.nid}" class="btn btn-primary btn-outline" style="float:right; margin-right: 5px;">수정</a>
    <a href="/notices/noticelist" class="btn btn-outline btn-default" style="float:right; margin-right: 5px;">이전으로</a>
	  </form>
  </sec:authorize>    
 </div>
</div>
		
	

<div class="my-5"></div>

</body>

<script>

/* 수정 하기 버튼 */
function goToUpdate() {
			window.location.href = "/noticeupdate";
		}
		
/*  //삭제 버튼 		
function ajaxremoveFrom(notice) {
	$.ajax({
		type:"POST",
		url:"/notice/ajaxremove",
			data:{
				nid:notice
			},
			beforeSend : function(xhr){   //데이터를 전송하기 전에 헤더에 csrf값을 설정한다
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
		success:function(result) {
			alert("소개글이 삭제되었습니다.");
		},
		error:function(request, status, error) {
			alert(request.status + " " +request.responseText);
		}
	})

    window.location.reload();
}
 */

</script>
<section class="py-5 text-center container"></section><br><br><br><br>

<%@ include file="/WEB-INF/footer.jsp"%>