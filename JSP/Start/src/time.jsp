<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
	Calendar calendar = Calendar.getInstance();
	int hour=calendar.get(Calendar.HOUR_OF_DAY);
	int minute=calendar.get(Calendar.MINUTE);
	int second=calendar.get(Calendar.SECOND);
%>
</head>
<body>

	<h1>현재 시간: <%= hour %> 시 <%= minute %> 분 <%= second %> 초</h1>


</body>
</html>