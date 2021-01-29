<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL redirect태그 실습</title>
</head>
<body>
	<c:redirect url="url_result.jsp">
		<c:param name="id" value="${param.id }"/>
		<c:param name="pw" value="${param.pw }"/>
		<c:param name="name" value="${param.name }"/>
		<c:param name="email" value="${param.email }"/>
	</c:redirect>
</body>
</html>