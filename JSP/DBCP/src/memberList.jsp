<%@page import="dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>사용자 이름</th>
			<th>사용자 ID</th>
			<th>사용자 PW</th>
			<th>사용자 번호</th>
			<th>사용자 성별</th>
		</tr>

	<%
		MemberDAO dao= new MemberDAO();
		ArrayList<MemberDTO> dtos= dao.memberList();
		for(MemberDTO dto: dtos){
			String username=dto.getUsername();
			String id=dto.getId();
			String pw=dto.getPw();
			String phone=dto.getPhone1()+"-"+dto.getPhone2()+"-"+dto.getPhone3();
			String gender=dto.getGender();
		
	%>
		<tr>
			<td><%=username%></td>
			<td><%=id%></td>
			<td><%=pw%></td>
			<td><%=phone%></td>
			<td><%=gender%></td>
		</tr>
	
	<%
		}
	%>
	</table>
</body>
</html>