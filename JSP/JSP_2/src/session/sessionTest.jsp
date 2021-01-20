<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check the Session</title>
</head>
<body>
	<%
		Enumeration<String> en= session.getAttributeNames();
		int i=0;
		while(en.hasMoreElements())
		{
			i++;
			String sName = en.nextElement();
			String sValue = session.getAttribute(sName).toString();
			
			out.println("sName: "+sName+"<br/>");
			out.println("sValue: "+sValue+"<br/>");
		}
		if(i==0)
		{
			out.println("해당 세션이 삭제되었습니다 <br/>");
			out.println(session.getId()+"<br/>");
		}
	%>
</body>
</html>