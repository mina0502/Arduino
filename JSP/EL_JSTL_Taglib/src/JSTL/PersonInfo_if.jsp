<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<c:set var="id" value="mina" scope="page"/>
<c:set var="pw" value="1234" scope="page"/>
<c:set var="name" value="${'美奈'}" scope="page"/>
<c:set var="age" value="${21}" scope="page"/>
<c:set var="height" value="${175}" scope="page"/>
<head>
<meta charset="UTF-8">
<title>JSTL 라이브러리 if태그</title>
</head>
<body>
	<c:if test="${(id=='mina')&&(name=='美奈')}">
		<h2>ID는 ${id }이고 Name은 ${name }입니다</h2>
	</c:if>
	
	<c:if test="${(age==21)&&(height>170)}">
		<h2>나이는 ${age }이고<br/>
		${name }님의 키는 ${height }으로 170보다 큽니다</h2>
	</c:if>
</body>
</html>