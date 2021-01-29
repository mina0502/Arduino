<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="application"/>
<head>
<meta charset="UTF-8">
<title>JSTL 라이브러리 set태그-컨텍스트이름</title>
</head>
<body>
	<form action="#">
		<p>ID: <input type="text" name="id" size="20"/><br/>
		<p>PW: <input type="password" name="pw" size="20"/><br/>
		<input type="submit" value="Login"/>
	</form>
	<p>컨텍스트 패스 값: ${contextPath }<br/>
	<a href="${contextPath}/PersonInfo.jsp">PresonInfo 이동</a>
</body>
</html>