<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/header.jsp"%>


<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>

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
	

	<section class="py-5 text-center container"></section><br><br>
<body>
  <div class="container">

    <!-- 주 게시물 -->
    <div class="panel panel-default">
      <div class="panel-heading">${board.btitle}</div>
      <div class="panel-body">
        <h5>${board.bcontent}</h5>
        <br><br><br>
        <div class="text-right">
       		   조회수 [ ${board.bview} ]
        </div>
        <div class="text-right">작성일: ${board.bregdate}</div>

         <!-- <button type="button" class="btn btn-secondary" style="float:right; margin-right: 5px;" onclick="history.back()">취소</button> -->
        <c:choose>
			<c:when test="${flag == true}">
				<form action="/boards/deleteboard" method="post" style="display:inline;">
		          <input type="hidden" name="bid" value="${board.bid }" />
		          <input type="submit" class="btn btn-danger" style="float: right; margin-right: 5px; " value="삭제" />
		        </form>
		        <a href="/boards/boardupdate?bid=${board.bid }" class="btn btn-primary" style="float: right; margin-right: 5px;">수정</a>
			</c:when>
		</c:choose>
        
      </div>
    </div>

    <sec:authorize access="isAuthenticated()">
    	<!-- 답변 등록 -->
	    <sec:authentication property="principal" var="user" />
	    <input id="bid" type="hidden" name="bid" value="${board.bid}">
	
	    <div class="panel panel-default">
	      <div class="panel-heading">답변 등록</div>
	      <div class="panel-body">
	        <textarea name="ccontent" id="ccontent" rows="3" class="form-control"></textarea>
	        <br>
	        <button class="btn btn-primary pull-right" type="button" onclick="addreply()">답변 등록</button>
	      </div>
	    </div>
    </sec:authorize>
    
    
    
	<!-- 답변 게시물 -->

	<div class="panel panel-default">
    <div class="panel-heading">답변 리스트</div>
    <div class="panel-body">
        <b>${cnt}개의 답변이 있습니다.</b>
        <c:forEach items="${commentList}" var="c">
            <div class="panel panel-default">
                <div class="panel-heading">${c.cwriter}</div>
                <div class="panel-body">
                    <p>${c.ccontent}</p>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-sm-6">
                            <small>${c.cregdate}</small>
                        </div>
                         <div class="col-sm-6">
                            <div class="btn-group pull-right">
                                <%-- <button type="button" class="btn btn-primary btn-xs" onclick="javascript:updateModal(${c.cid},'${c.ccontent}')">수정</button>
                                <form action="/boards/deletereply" method="post">
                                    <input type="hidden" name="bid" value="${c.bid}" />
                                    <input type="hidden" name="cid" value="${c.cid}" />
                                    <button type="submit" class="btn btn-danger btn-xs">삭제</button>
                                </form> --%>
						<form action="/boards/deletereply" method="post"   style="display:inline;">
						 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="bid" value="${c.bid }" />
						<input type="hidden" name="cid" value="${c.cid }" /> 
						<input type="submit" class="btn btn-danger btn-sm" style="float: right; margin-right: 5px;" value="삭제" />
						</form>
                        <button type="button" class="btn btn-primary btn-sm" style="float: right; margin-right: 5px;" onclick="javascript:updateModal(${c.cid},'${c.ccontent}' )">수정</button>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- 댓글 수정 모달 -->
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="modal-title" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modal-title">댓글 수정</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="modal-body">
                    <input id="cccontent" class="form-control">
                </div>
                <div class="modal-footer" id="modal-footer">
                    <!--  <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" onclick="javascript:updateComment()">수정</button> -->
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>

<script>
	/* 수정 하기 버튼 */
	function goToUpdate() {
		window.location.href = "/boardupdate";
	}

	function ajaxremoveFromBoard(board) {
		$.ajax({
			type : "POST",
			url : "/board/ajaxremove",
			data : {
				bid : board
			},
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				alert("게시글이 삭제되었습니다.");
			},
			error : function(request, status, error) {
				alert(request.status + " " + request.responseText);
			}
		})

		window.location.reload();
	}


	//댓글 ajax

	function addreply() {
		var bid = $("#bid").val();
		var ccontent = $("#ccontent").val();
		var cwriter = "임시값_수정해야함";
		
		console.log(bid);
		console.log(ccontent);
		console.log(cwriter);

		$.ajax({
			type : "POST",
			url : "/boards/replynew",
			data : {
				bid : bid,
				ccontent : ccontent,
				cwriter : cwriter
			},
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				alert("등록 완료")
			 window.location.reload() ;
			},
			error : function(request, status, error) {
				alert(request.status + " " + request.responseText);
			}
		});
		/*  window.location.reload();  */
	}
	
	 //updateModel(${r.rid}, ${r.content}, ${r.rscore}) 에서 받은 값으로 modal을 띄우는 함수
	function updateModal(cid, ccontent) {
	    $('.modal').modal('show');
		var modal_title = document.getElementById("modal-title");
		modal_title.innerHTML = "댓글 수정";
		var modal_body = document.getElementById("modal-body");
		modal_body.innerHTML =  "<input id='cid' type='hidden' value= '" + cid + "' >" +
								"<input id='cccontent' name='ccontent' value= '" + ccontent + "' rows='3' class='form-control'>" ;
		var modal_footer = document.getElementById("modal-footer");
		modal_footer.innerHTML = "<button type='button' class='btn btn-primary' onclick='javascript:updateAjax()'>수정</button>"
			+ "<button type='button' class='btn btn-secondary' onclick='modalClose()'>닫기</button>"; 
	}

	function updateAjax() {
	    var cid = document.querySelector("#cid").value;
	    var ccontent = document.querySelector("#cccontent").value;

	    $.ajax({
	        url: "/boards/updatereply",
	        type: "POST",
	        data: {
	            cid: cid,
	            ccontent: ccontent
	        },
	        beforeSend: function(xhr) { 
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
	        success: function(data) {
				window.location.reload();
			},
	        error: function(jqXHR, textStatus, errorThrown) {
	            // 수정 실패 시 처리할 로직
	        }
	    });
	    
	}

	 $('a[href="#updateModal"]').click(function(event) {
	      event.preventDefault();
	 
	      $(this).modal({
	        fadeDuration: 250
	      });
	    });
	 
	    function modalClose() {
	        $('#updateModal').modal('hide'); 
	        $('#updateModal').hide();
	        $('.jquery-modal').hide();
	    }

</script>

<section class="py-5 text-center container"></section><br><br><br><br>

<%@ include file="/WEB-INF/footer.jsp"%>
