<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
	<!-- bootstrap CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<div class="container mt-3">
	<h3 class="my-3">전체 회원 리스트</h3>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th scope="col">이메일</th>
					<th scope="col">이름</th>
					<th scope="col">가일입</th>
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
	function searchFunction() {
		$.ajax({
			type:"post",
			url:"/admin/userAllCheck.jsp",
			success : function(data) {
				let users = JSON.parse(data.trim());
				let str = "";
				
				for (var i = 0; i < users.length; i++) {
					if (users[i].email == '<%= sid %>') continue
					str += "<tr><td>" + users[i].email + "</td>";
					str += "<td>" + users[i].name + "</td>"
					str += "<td>" + users[i].joindate + "</td>"
					str += "<td><button onclick='acceptChange(\"" + users[i].email + "\")' class='btn btn-sm btn-warning mx-3 px-3'>승인상태 변경</button>"
					str +=	"<button onclick='deleteUser(\"" + users[i].email + "\")' class='btn btn-sm btn-danger mx-3 px-3'>유저 삭제</button></td></tr>"
				}
				$("#ajaxTable").html(str);
			}
		})
	}
	
	function acceptChange(userEmail) {
		$.ajax({
			type:"post",
			url:"/admin/acceptChange.jsp",
			data : {email : userEmail },
			success : function(data) {
				if (data.trim() == 1 ) {
					alert("회원 [" + userEmail +"] 님이 승인 대기 유저가 되었습니다.")
					searchFunction();
				} else {
					alert("처리에 문제가 생겼습니다.")
				}
			},
			error: function (err) {
				 	alert("처리에 문제가 생겼습니다.");
				}
		})
	}
	
	function deleteUser(userEmail) {
		$.ajax({
			type:"post",
			url:"/admin/removeUser.jsp",
			data : {email : userEmail },
			success : function(data) {
				if (data.trim() == 1 ) {
					alert("회원 [" + userEmail +"] 님을 회원 목록에서 제거하였습니다")
					searchFunction();
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
		searchFunction()
	}
	</script>
</body>
</html>