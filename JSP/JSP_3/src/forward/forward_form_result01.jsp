<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result01</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	System.out.println("forward_form_result01.jsp 지니감");
	%>
	<jsp:forward page='<%=request.getParameter("forwardPage") %>'>
	<jsp:param value="053-666-7777" name="tel"/>
	</jsp:forward>
</body>
</html>