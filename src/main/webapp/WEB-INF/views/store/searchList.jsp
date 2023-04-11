<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
</body>
</html>