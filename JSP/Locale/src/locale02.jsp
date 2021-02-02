<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Locale클래스를 이용한 다국어 처리 -2</title>
</head>
<body>
	<h3>Locale클래스를 인스턴스로 생성하여 처리</h3>
	<%
/* 	Locale locale= new Locale("ja","JP"); */
	Locale locale= Locale.US;	
	Date date=new Date();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	NumberFormat numberFormat = NumberFormat.getNumberInstance(locale);
	%>
	
	<p>국가 : <%=locale.getDisplayCountry() %>
	<p>국가 : <%=locale.getCountry() %>
	<p>국가언어: <%=locale.getLanguage() %>
	<p>국가언어: <%=locale.getDisplayLanguage(locale) %>
	<p>언어와 국가: <%=locale.getDisplayName() %> 
	<p>날짜 : <%=sdf.format(date) %>
	<p>숫자(123456.78) : <%=numberFormat.format(123456.78) %>
</body>
</html>