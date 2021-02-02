<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다국어처리-fmt태그03(날짜)</title>
</head>
<body>
	<p><jsp:useBean id="now" class="java.util.Date"/>
	
	<h2>type에 따라 출력내용이 바뀜</h2>
	<p>date타입 : <fmt:formatDate value="${now}" type="date"/>
	<p>time타입 : <fmt:formatDate value="${now}" type="time"/>
	<p>both타입 : <fmt:formatDate value="${now}" type="both"/>
	
	<h3><b>date Style에 따라 출력 내용이 바뀜</b></h3>
	<p>default스타일 : <fmt:formatDate value="${now}" type="both" dateStyle="default"/>
	<p>short스타일 : <fmt:formatDate value="${now}" type="both" dateStyle="short"/>
	<p>medium스타일 : <fmt:formatDate value="${now}" type="both" dateStyle="medium"/>
	<p>long스타일 : <fmt:formatDate value="${now}" type="both" dateStyle="long"/>
	<p>full스타일 : <fmt:formatDate value="${now}" type="both" dateStyle="full"/>
	<br/><br/>
	<h2>직접 패턴을 주는 방법</h2>
	<p>패턴주기 : <fmt:formatDate value="${now}" type="both" pattern="yyyy년MM월dd일 HH시mm분ss초 E요일"/>
	<p>패턴주기 : <fmt:formatDate value="${now}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
</body>
</html>