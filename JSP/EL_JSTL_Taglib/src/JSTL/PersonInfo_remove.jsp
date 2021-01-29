<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<c:set var="id" value="mina" scope="page"/>
<c:set var="pw" value="1234" scope="page"/>
<c:set var="name" value="${'美奈'}" scope="page"/>
<c:set var="age" value="${21}" scope="page"/>
<c:set var="height" value="${175}" scope="page"/>

<c:remove var="age"/>
<c:remove var="height"/>

<head>
<meta charset="UTF-8">
<title>JSTL 라이브러리 remove태그</title>
</head>
<body>
	<table border="1">
		<tr align="center" bgcolor="yellow">
			<td width="7%"><b>ID</b></td>
			<td width="7%"><b>PW</b></td>
			<td width="7%"><b>Name</b></td>
			<td width="7%"><b>Age</b></td>
			<td width="7%"><b>Height</b></td>
		</tr>
		
		<tr align="center">
			<td>${id}</td>
			<td>${pw}</td>
			<td>${name}</td>
			
			<td>${age}</td>
			<td>${height}</td>
		</tr>
	</table>
</body>
</html>