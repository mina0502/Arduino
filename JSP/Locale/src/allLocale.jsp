<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 Locale 인자값 출력하기</title>
</head>
<body>
	<%
	int cnt=0;
	for(Locale locale : Locale.getAvailableLocales())
	{
		cnt++;
	%>
		<p>언어코드: <%=locale.getLanguage() %>
		<p>국가코드: <%=locale.getCountry() %>
		<p>국가이름: <%=locale.getDisplayCountry() %>
		<p>언어,국가: <%=locale.getDisplayName() %>
	<%
	}
	%>
	<p>총 Locale수 : <%=Locale.getAvailableLocales().length%>
</body>
</html>