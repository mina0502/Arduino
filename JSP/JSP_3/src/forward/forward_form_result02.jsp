<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result02</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8"); %>
	<h1>포워드 된 페이지(forward_form_result02.jsp)</h1>
	<table border="1" bgcolor="yellow">
			<tr>
				<td>이름</td>
				<td><%=request.getParameter("name") %> </td>
			</tr>
			<tr>
				<td>나이</td>
				<td><%=request.getParameter("age") %> </td>			</tr>
			<tr>
				<td>주소</td>
				<td><%=request.getParameter("address") %> </td>			</tr>
			<tr>
				<td>전화번호</td>
				<td><%=request.getParameter("tel") %> </td>			</tr>
		</table>
</body>
</html>