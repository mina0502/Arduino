<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>
	<%
		Enumeration<String> en= session.getAttributeNames();
		while(en.hasMoreElements())
		{
			String sName= en.nextElement();
			String sValue= session.getAttribute(sName).toString();
			if(sValue.equals("한글"))
			{
				out.println("<br/>"+sValue+"님이 로그아웃 하셨습니다. </br/>");
				session.removeAttribute(sName);
			}
		}
		
	%>
	<br/><br/>
	<a href="sessionTest.jsp"><button>Session Check</button></a>
</body>
</html>