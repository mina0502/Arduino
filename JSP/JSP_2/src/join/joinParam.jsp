<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과</title>
</head>
<body>
	<%!
	String name, id, pw, major, gender, job;
	String[] hobby;
	%>
	
	<% 
		request.setCharacterEncoding("utf-8");
		
		name=request.getParameter("name");
		id=request.getParameter("id");
		pw=request.getParameter("pw");
		major=request.getParameter("major");
		gender=request.getParameter("gender");
		job=request.getParameter("job");
		
		hobby=request.getParameterValues("hobby");
		
		
	%>
	
	
	전송받은 이름 : <%=name %><br/><br/>
	전송받은 ID : <%=id %><br/><br/>
	전송받은 PW : <%=pw %><br/><br/>
	전송받은 major : <%=major %><br/><br/>
	전송받은 gender : <%=gender %><br/><br/>
	전송받은 job : <%=job %><br/><br/>
	
	전송받은 hobby : <%=Arrays.toString(hobby) %><br/><br/>
</body>
</html>