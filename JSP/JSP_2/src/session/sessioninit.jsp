<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Make Session</title>
</head>
<body>
	<%
		session.setAttribute("abcde", 12345);
		session.setAttribute("mina", "miyamoto");
	%>
	
	<a href="sessionGet.jsp"><button>세션값 확인</button></a>

</body>
</html>