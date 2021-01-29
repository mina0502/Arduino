<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 내장객체</title>
</head>
<body>
	<form action="innerObjectOk.jsp" method="get">
	<p>ID: <input type="text" name="id" required="required"/><br/>
	<p>PW: <input type="password" name="pw" required="required"/><br/><br/>
	
	<input type="submit" value="login"/>
	</form>
	
	<%
		application.setAttribute("application_name","application내장객체");
		session.setAttribute("session_name", "session내장객체");
		pageContext.setAttribute("page_name", "pageContext내장객체");
		request.setAttribute("request_name", "request내장객체");
		
		
	%>
	<b>pageScope, requestScope 내장객체의 범위는 현재 페이지만 적용이 됨</b>
	<p> pageScope: ${pageScope.page_name}<br/>
	<p> requestScope: ${requestScope.request_name}<br/>
</body>
</html>