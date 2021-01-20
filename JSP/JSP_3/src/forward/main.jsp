<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>
	<h1>main.jsp페이지입니다.</h1>
	<%
		System.out.println("sub.jsp페이지 이동 전 main.jsp페이지입니다");
	%>
	<jsp:forward page="sub.jsp"/>
</body>
</html>