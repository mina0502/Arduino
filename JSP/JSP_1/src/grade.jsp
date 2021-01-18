<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Score result</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String score1=request.getParameter("score");
	if(score1==""||score1==null)
	{
%>
		<h1>Wrong Score</h1>
		<a href="scoreInput.html"><button>Go Back</button></a>
<% 
	return;	}
	int score=Integer.parseInt(score1);
%>

	<h1>Result: <%=score %></h1>
	<%
	if(score>=96)
	{
	%>
	<h1>A+</h1>
	<%}
	else if(score>=90)
	{%>
	<h1>A</h1>
	<%}
	else if(score>=86)
	{%>
	<h1>B+</h1>
	<%}
	else if(score>=80)
	{%>
	<h1>B</h1>
	<%}
	else if(score>=76)
	{%>
	<h1>C+</h1>
	<%}
	else if(score>=70)
	{%>
	<h1>C</h1>
	<%}
	else if(score>=66)
	{%>
	<h1>D+</h1>
	<%}
	else if(score>=60)
	{%>
	<h1>D</h1>
	<%}
	else{
	%>
	<h1>F</h1>
	<%} %>
	<br>
	<a href="scoreInput.html">Insert Grade</a>
</body>
</html>