<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>mina's Shopping mall</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp" flush="false"/>
	
	<%
		String greeting="Welcom Web Market";
		String tagline="Welcome to web Market!";
	%>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%=greeting %></h1>
		</div>
		<hr>
	</div>
	
	<div class="container">
		<div class="text-center">
			<h3><%=tagline %></h3>
			<%
			Calendar calendar= Calendar.getInstance();
			int hour= calendar.get(Calendar.HOUR_OF_DAY);
			int min = calendar.get(Calendar.MINUTE);
			int sec = calendar.get(Calendar.SECOND);
			int am_pm= calendar.get(Calendar.AM_PM);
			String ampm=null;
			if(am_pm==0)
			{
				ampm="오전";
			}
			else
			{
				ampm="오후";
			}
			
			String connectTime = ampm+" "+hour+" : "+min+" : "+sec;
			
			out.println("현재 접속 시간: "+connectTime);
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" flush="false"/>

</body>
</html>