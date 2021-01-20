<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Check</title>
</head>
<body>
	<%!
	String id,pw;
	%>
	<%
	request.setCharacterEncoding("utf-8");
	id=request.getParameter("id");
	pw=request.getParameter("pw");
	
	if(id.equals("한글") && pw.equals("12345"))
	{
		session.setAttribute("id", id);
		
		System.out.println("session_loginOK()");
		
		response.sendRedirect("session_login_success.jsp");
	}
	else
	{
		response.sendRedirect("session_login_fail.jsp");
	}
	%>
</body>
</html>