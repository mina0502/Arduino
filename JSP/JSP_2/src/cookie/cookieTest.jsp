<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check the Cookie</title>
</head>
<body>
	<%
	Cookie[] cookies = request.getCookies();
	
	if(cookies!=null){
		for(int i=0;i<cookies.length;i++)
			{
				out.println("현재 남아있는 쿠키 이름: "+cookies[i].getName());
				out.println("<br/>");
				out.println("현재 남아있는 쿠키 값: "+cookies[i].getValue());
			}
		}
	%>
</body>
</html>