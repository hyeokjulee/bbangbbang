<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
		crossorigin="anonymous">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>

	<c:forEach var="store" items="${storeList}">
<div class="card store-item" style="width: 18rem;">
<img src="${store.sphoto}" class="card-img-top" alt="...">
<div class="card-body">
<h5 class="card-title">${store.sname}</h5>
<p class="card-text">${store.saddr}</p>
<a href="/store/detail?sid=${store.sid }" class="btn btn-primary">Go Detail</a>
<input type="hidden" name="sid" value="${store.sid}">
</div>
</div>
</c:forEach>

<input type="hidden" class="start" value="x">
<script>
$(document).ready(function() {
	// Get the initial length of storeList
	var sid = $(".store-item").length;
	
	// Set up a scroll event listener
	$(window).scroll(function() {
		if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			// Save sid before the AJAX request
			var prevSid = sid;
			
			// Send an AJAX request with the current sid value
			$.ajax({
				url: "/store/list",
				type: "post",
				data: {
					sid: sid
				},
				success: function(data) {
					// Append the returned data to the element with the class 'start'
					$(".start").before(data);
					
					// Update sid with the new length of storeList
					sid = $(".store-item").length;
					
					// If there were no new items, remove the scroll listener to avoid unnecessary requests
					if (prevSid == sid) {
						$(window).off("scroll");
					}
				}
			});
		}
	});
});
</script>


</html>