<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Cookie</title>
</head>
<body>
	<%
		Cookie[] cookies= request.getCookies();
	
		for(int i=0;i<cookies.length;i++)
		{
			String name= cookies[i].getName();
			String value= cookies[i].getValue();
			
			if(name.equals("abcde"))
				{
				out.println("cookies["+i+"] name: "+ name);
				out.println("<br/>");
				out.println("cookies["+i+"] value: "+ value);
				cookies[i].setMaxAge(0);	
				response.addCookie(cookies[i]);
				}	
		}
	%>
	<br/><br/>
	<a href="cookieTest.jsp"><button>쿠키 확인 페이지로 이동</button></a>
</body>
</html>