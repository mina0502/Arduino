<%@page import="java.util.Enumeration"%>
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
		request.setCharacterEncoding("utf-8");
		Enumeration<String>en= session.getAttributeNames();
		while(en.hasMoreElements())
		{
			String sName=en.nextElement();
			String sValue=session.getAttribute(sName).toString();
			
			if(sValue.equals("한글"))
			{
				out.print(sValue+"님 안녕하세요!"+"<br/>");
			}
		}
	%>
	<h1>환영합니다</h1>
	<a href="session_logout.jsp"><button>Logout</button></a>
</body>
</html>