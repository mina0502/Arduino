<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 지시자</title>
</head>
<body>
	<h1>includeOrder.jsp페이지</h1>
	<%@include file="include.jsp" %>
	<h1>다시 includeOrder.jsp페이지</h1>
</body>
</html>