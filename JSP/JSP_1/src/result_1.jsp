<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%
		request.setCharacterEncoding("utf-8");
		String user_id= request.getParameter("user_id");
		String user_pw= request.getParameter("user_pw");
		
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과창</title>
</head>
<body>
	<h1>결과 출력</h1>
	<%if(user_id==null||user_id.length()==0
		||user_pw==null||user_pw.length()==0){%>
	insert into ID/PW<br>
	<a href="main.jsp">로그인 페이지 이동</a>
	<%} 
	else {
	%>
	<h1>Welcome<%=user_id %></h1>
	<h1>your_PW: <%=user_pw %></h1><br>
	<%} %>

</body>
</html>