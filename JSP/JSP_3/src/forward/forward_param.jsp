<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward, param Tag Test</title>
</head>
<body>
	<h1>forward_param.jsp페이지입니다.</h1>
	<%
		System.out.println("페이지 이동하기 전 forward_param.jsp페이지입니다");
	%>
	<jsp:forward page="forward_param_result.jsp">
		<jsp:param value="abcde" name="id"/>
		<jsp:param value="12345" name="pw"/>
	</jsp:forward>
</body>
</html>