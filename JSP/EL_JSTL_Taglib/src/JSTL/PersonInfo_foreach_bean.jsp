<%@page import="sec02.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>

<%
	List<Member> membersList= new ArrayList<>();	//Interface의 다형성 
	
	Member m1 = new Member("mina","1234","美奈","test@test.com");
	Member m2 = new Member("Kim","5678","宮本","test@test.kr");
	Member m3 = new Member("LEE","1256","宮本美奈","test@test.jp");
	
	membersList.add(m1);
	membersList.add(m2);
	membersList.add(m3);
	
%>

<c:set var="membersList" value="<%=membersList %>"/>
<head>
<meta charset="UTF-8">
<title>JSTL 라이브러리 forEach태그</title>
</head>
<body>
	<table border="1">
		<tr align="center" bgcolor="lightgreen">
			<td width="7%"><b>아이디</b></td>
			<td width="7%"><b>비밀번호</b></td>
			<td width="5%"><b>이름</b></td>
			<td width="7%"><b>이메일</b></td>
		</tr>
		
		<c:forEach var="member" items="${membersList }" >
			<tr align="center">
				<td>${member.id}<br/></td>
				<td>${member.pw}<br/></td>
				<td>${member.name}<br/></td>
				<td>${member.email}<br/></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>