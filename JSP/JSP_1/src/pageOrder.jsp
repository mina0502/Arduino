<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>import 속성</title>
</head>
<body>
	<%!
	SimpleDateFormat sdf= new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	Date date= new Date();
	%>
	<h1><%= sdf.format(date)%></h1>
</body>
</html>