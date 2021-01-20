<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Make cookie</title>
</head>
<body>
	<h1>서버에서 쿠키를 생성하는 페이지</h1>
	<%
		request.setCharacterEncoding("utf-8");
		Cookie cookie= new Cookie("abcde","12345");
		cookie.setMaxAge(60*60);
		response.addCookie(cookie);
	%>
	<br/>
	<br/>
	<a href="cookieGet.jsp"><button>쿠키값 확인하는 창으로 이동</button></a>
</body>
</html>