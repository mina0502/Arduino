<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다국어처리-fmt태그01(로케일)</title>
</head>
<body>
	<p>---------기본 로케일----------</p>
	<fmt:setBundle basename="bundle.myBundle_ko" var="resourceBundle"/>
	<p>제목 :<fmt:message key="title" bundle="${resourceBundle}"/>
	 
	<p><fmt:message key="username" var="user"  bundle="${resourceBundle}"/>
	이름: ${user}
	
	<p>비밀번호 :<fmt:message key="password" bundle="${resourceBundle}"/>
	
	
		<p>---------영문 로케일----------</p>
	
	<fmt:setLocale value="en"/>
	<fmt:setBundle basename="bundle.myBundle" var="resourceBundle"/>
	<p>제목 :<fmt:message key="title" bundle="${resourceBundle}"/>
	 
	<p><fmt:message key="username" var="user"  bundle="${resourceBundle}"/>
	이름: ${user}
	
	<p>비밀번호 :<fmt:message key="password" bundle="${resourceBundle}"/>



</body>
</html>