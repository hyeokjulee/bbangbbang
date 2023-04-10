<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
	<!-- bootstrap CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container mt-3">
	<h3 class="my-3">전체 회원 리스트</h3>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th scope="col">이메일</th>
					<th scope="col">이름</th>
					<th scope="col">가입시간</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody id="ajaxTable">
			</tbody>
		</table>
	</div>
	
	<!-- bootstrap JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	
	<script>
	function listFunction() {
		$.ajax({
			type:"post",
			url:"/admin/list",
			headers: {'${_csrf.headerName}': '${_csrf.token}'},
			success : function(data) {
				let users = data;
				let str = "";
				
				for (var i = 0; i < users.length; i++) {
					if (users[i].authority == 'USER_MANAGER') {
						continue;
					}
					str += "<tr><td>" + users[i].username + "</td>";
					str += "<td>" + users[i].uname + "</td>"
					str += "<td>" + users[i].udate + "</td>"
					str += "<td><button onclick='location.href=\"/admin/edit?uid=" + users[i].uid + "\"' class='btn btn-sm btn-warning mx-3 px-3'>비밀번호변경</button>"
					str += "<td><button onclick='deleteUser(\"" + users[i].username + "\")' class='btn btn-sm btn-danger mx-3 px-3'>삭제</button></td></tr>"
				}
				$("#ajaxTable").html(str);
			}
		})
	}
	
	function deleteUser(email) {
		$.ajax({
			type:"post",
			url:"/admin/remove",
			headers: {'${_csrf.headerName}': '${_csrf.token}'},
			data : {username : email },
			success : function(data) {
				if (data == 1 ) {
					alert("회원 [" + email +"] 님을 회원 목록에서 제거하였습니다")
					listFunction();
				} else {
					alert("처리에 문제가 생겼습니다.")
				}
			},
			error: function (err) {
				 	alert("처리에 문제가 생겼습니다.");
				}
		})
	}
	
	window.onload = function() {
		listFunction();
	}
	</script>
</body>
</html>