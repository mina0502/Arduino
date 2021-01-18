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

	<%if(user_id==null||user_id.length()==0
		||user_pw==null||user_pw.length()==0){%>
	insert into ID/PW<br>
	<a href="main_admin.jsp">로그인 페이지 이동</a>
	<%} 
	else {
		if(user_id.equals("admin"))
			{
	%>
	<h1>You Login Admin</h1>
	<form>
		<input type="button" value="member_list"><br>
		<input type="button" value="member_edit"><br>
		<input type="button" value="member_delete"><br> 
	</form>
	<% 	}
	} %>

</body>
</html>