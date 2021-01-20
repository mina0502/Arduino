<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session Value Check</title>
</head>
<body>
	<%
	Object obj1 = session.getAttribute("abcde");
	Integer IntValue =(Integer)obj1;
	out.println("abced : "+ IntValue);
	
	out.println("<br/>");
	
	Object obj2 = session.getAttribute("mina");
	String str1 =(String)obj2;
	out.println("mina : "+str1);
	%>
	<br/>
	<%
	out.print("============================");
	out.print("<br/>");
	
	String sName,sValue;
	
	Enumeration<String> en= session.getAttributeNames();
	
	while(en.hasMoreElements()){
		sName = en.nextElement();
		sValue = session.getAttribute(sName).toString();
		out.println("sName: "+sName+"<br/>"+"sValue: "+sValue+"<br/>");
	}

		out.print("=============================<br/>");
		
		String sessionID= session.getId();
		out.print("sessionID: "+ sessionID);
		
		out.print("<br/>================================<br/>");
		
		int sessionInterval= session.getMaxInactiveInterval();
		out.print("sessionInterval(min) "+sessionInterval/60+"<br/>");
		
		out.print("================================<br/>");
		
		//session.removeAttribute("abcde");
		
		Enumeration<String> en1= session.getAttributeNames();
		
		while(en1.hasMoreElements()){
			sName = en1.nextElement();
			sValue = session.getAttribute(sName).toString();
			out.println("sName: "+sName+"<br/>"+"sValue: "+sValue+"<br/>");
		}
		session.invalidate();
		out.println("============================<br/>");
		if(request.isRequestedSessionIdValid())
		{
			out.print("session valid");
		}
		else
		{
			out.print("session invalid");
		}
	%>
	
</body>
</html>