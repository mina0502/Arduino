<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>JSTL url태그 결과</title>
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
			<td>${param.id}</td>
			<td>${param.pw}</td>
			<td>${param.name}</td>
			<td>${param.email}</td>
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