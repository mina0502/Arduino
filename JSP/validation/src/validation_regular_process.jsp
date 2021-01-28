<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정규표현식의 결과</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String id= request.getParameter("id");
	String pw= request.getParameter("pw");
	String name= request.getParameter("name");
	String phone1= request.getParameter("phone1");
	String phone2= request.getParameter("phone2");
	String phone3= request.getParameter("phone3");
	String email = request.getParameter("email");
	%>
	
	<h3>입력에 성공하였습니다<%=id %>님 반갑습니다</h3>
	<p>입력하신 비번은 <%=pw %> 입니다
	<p>입력하신 이름은 <%=name %> 입니다
	<p>입력하신 폰번호는 <%=phone1 %>- <%=phone2 %>- <%=phone3 %> 입니다
	<p>입력하신 이메일은 <%=email %> 입니다
		
</body>
</html>