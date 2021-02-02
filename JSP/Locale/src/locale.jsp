<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Locale 클래스를 이용한 다국어 처리</title>
</head>
<body>
	<h3>현재 로케일의 국가 날씨 통화</h3>
	
	<%
		Locale locale= request.getLocale();
		Date date= new Date();
		
		DateFormat dateFormat= DateFormat.getDateInstance(DateFormat.FULL,locale);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		 
		NumberFormat numberFormat=NumberFormat.getNumberInstance(locale);
	%>
	<p>국가 : <%=locale.getDisplayCountry() %>
	<p>국가코드 : <%=locale.getCountry() %>
	<p>국가언어: <%=locale.getDisplayLanguage() %>
	<p>국가언어: <%=locale.getDisplayLanguage(locale) %>
	<p>언어와 국가: <%=locale.getDisplayName() %> 
	<p>날짜 : <%=dateFormat.format(date) %>
	<p>날짜 : <%=sdf.format(date) %>
	<p>숫자(123456.78) : <%=numberFormat.format(123456.78) %>
	
</body>
</html>