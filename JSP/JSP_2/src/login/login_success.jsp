<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login Success</title>
</head>
<body>
<script type="text/javascript">
	alert('Login Success')
	</script>
	<%
	Cookie[] cookies= request.getCookies();
	for(int i=0;i<cookies.length;i++)
	{
		String id= cookies[i].getValue();
		if(id.equals("abcde"))
		{
			out.println(id+"님 반갑습니다.");
		}
	}
	%>
	<h1>환영합니다</h1>
	<a href="logout.jsp"><button>Logout</button></a>
</body>
</html>