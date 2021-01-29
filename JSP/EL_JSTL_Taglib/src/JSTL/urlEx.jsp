<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<c:url var="url" value="redirect_Ex.jsp">
	<c:param name="id" value="Mina"></c:param>
	<c:param name="pw" value="1234"></c:param>
	<c:param name="name" value="美奈"></c:param>
	<c:param name="email" value="Test@test.com"></c:param>
</c:url>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL url태그 실습</title>
</head>
<body>
	<a href="${url}"><button>회원정보 출력&raquo;</button></a>
</body>
</html>