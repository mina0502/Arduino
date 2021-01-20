<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String name= request.getParameter("name");
	String strScore= request.getParameter("score");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PASS</title>
</head>
<body>
	<h1><b><%=name %>님은 <font size="50px"><%=strScore %></font>점으로 합격하셨습니다</b></h1>
	<a href="score.html"><button>점수 입력창으로 이동</button></a>
</body>
</html>