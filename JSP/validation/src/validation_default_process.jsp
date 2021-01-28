<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유효성 검사 결과</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id= request.getParameter("id");
		String pw= request.getParameter("pw");
	%>
	<h3>입력에 성공하였습니다<%=id %>님 반갑습니다</h3>
	<p>입력하신 비밀번호는 <%=pw %> 입니다
</body>
</html>