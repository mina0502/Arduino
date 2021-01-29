<%@page import="sec02.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="membersList" class="java.util.ArrayList"/>
<jsp:useBean id="membersMap" class="java.util.HashMap"/>

<%
	membersMap.put("id", "mina");
	membersMap.put("pw", "1234");	
	membersMap.put("name", "miyamoto");
	membersMap.put("email", "test@test.com");
	
	Member m1=new Member("Selly","5678","Jelly","Jelly@test.com");
	Member m2=new Member("Ba","9012","NaNa","BaNaNa@test.com");
	
	membersList.add(m1);
	membersList.add(m2);
	
	membersMap.put("membersList",membersList);
%>
<!-- 변수 membersList에 membersMap.membersList값으로 저장 -->

<c:set var="membersList" value="${membersMap.membersList}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL라이브러리 set태그 -bean 활용</title>
</head>
<body>
	<table border="1">
		<tr align="center" bgcolor="yellow">
			<td width="20%"><b>아이디</b></td>
			<td width="20%"><b>비밀번호</b></td>
			<td width="20%"><b>이름</b></td>
			<td width="20%"><b>email</b></td>
		</tr>
		
		<tr align="center">
			<td>${membersMap.id}</td>
			<td>${membersMap.pw}</td>
			<td>${membersMap.name}</td>
			<td>${membersMap.pw}</td>	
		</tr>
		
		<!-- ArrayList에 저장된 객체 || 2개의 객체를 다시 HasMap에 저장 -->
		
		
		<tr align="center">
			<td>${membersList[0].id}</td>
			<td>${membersList[0].pw}</td>
			<td>${membersList[0].name}</td>
			<td>${membersList[0].pw}</td>	
		</tr>
		
		<tr align="center">
			<td>${membersList[1].id}</td>
			<td>${membersList[1].pw}</td>
			<td>${membersList[1].name}</td>
			<td>${membersList[1].pw}</td>	
		</tr>
	</table>
</body>
</html>