<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie read Value</title>
</head>
<body>
	<h1>CookieGet</h1>
	<%
		Cookie[] cookies= request.getCookies();
		
		for(int i=0;i<cookies.length;i++)
		{
			String name= cookies[i].getName();
			String value= cookies[i].getValue();
			if(name.equals("abcde"))
			{
				out.println("cookies["+i+"] name: "+name);
				out.println("<br/>");
				out.println("cookies["+i+"] value: "+value);
			}
		}
	%>
	<br/><br/>
	<a href="cookieDel.jsp"><button>쿠키 삭제 페이지 이동</button></a>
</body>
</html>