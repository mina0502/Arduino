<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL out태그</title>
</head>
<body>
	<table border="1">
		<tr align="center" bgcolor="yellow">
			<td width="7%"><b>ID</b></td>
			<td width="7%"><b>PW</b></td>
			<td width="7%"><b>Name</b></td>
			<td width="7%"><b>Email</b></td>
		</tr>
		
		<tr align="center">
			<td><c:out value="${param.id}"/> </td>
			<td><c:out value="${param.pw}"/></td>
			<td><c:out value="${param.name}"/></td>
			<td><c:out value="${param.email}"/></td>
		</tr>
		
		<tr align="center">
			<td><c:out value="&lt" escapeXml="true"/></td>
			<td><c:out value="&lt" escapeXml="false"/></td>
			<td><c:out value="&gt" escapeXml="true"/></td>
			<td><c:out value="&gt" escapeXml="false"/></td>
		</tr>
		
		<tr align="center">
			<td><%=id %></td>
			<td><%=pw %></td>
			<td><%=name %></td>
			<td><%=email %></td>
		</tr>
		
	</table>
</body>
</html>