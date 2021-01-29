<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>

<%
	List<String> dataList= new ArrayList<>();	//Interface의 다형성 
	dataList.add("반갑습니다");
	dataList.add("테스트입니다");
	dataList.add("안녕하세요");
%>
<c:set var="list" value="<%=dataList %>"/>

<head>
<meta charset="UTF-8">
<title>JSTL 라이브러리 forEach태그</title>
</head>
<body>
	<c:forEach var="i" begin="1" end="10" step="1" varStatus="loop">
		i=${i} &nbsp;&nbsp;&nbsp;&nbsp; 반복횟수: ${loop.count}<br/>
	</c:forEach>
	<br/>
	
	<c:forEach var="i" begin="1" end="10" step="2">
		10*${i}= ${10*i }<br/>
	</c:forEach>
	<br/>
	
	<c:forEach var="data" items="${list}">
		${data }<br/>
	</c:forEach>
	<br/>
	<c:set var="car" value="소나타, 그랜져, SM7, 아반떼"/>
	<c:forTokens var="token" items="${car}" delims=",">
		${token }<br/>
	</c:forTokens>
</body>
</html>