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
	Cookie[] cookies= request.getCookies();
	if(cookies !=null)
	{
		for(int i=0; i<cookies.length;i++)
		{
			String id= cookies[i].getValue();
			if(id.equals("abcde"))
			{
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
				out.print(id+"님이 로그아웃 하셨습니다");
			}
		}
	}
	%>
	<br/><br/>
	<a href="cookieTest.jsp"><button>Cookie Check</button></a>
</body>
</html>