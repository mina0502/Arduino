<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    String name= request.getParameter("name");
    String strScore = request.getParameter("score");
    
    String encodeName=URLEncoder.encode(name,"utf-8"); 
   	int score = Integer.parseInt(strScore);
   	
   	
   	pageContext.getSession().setAttribute("name", name);
   	pageContext.getSession().setAttribute("score", strScore);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Score Result</title>
</head>
<body>
		<%
		if(score <0 || score >100){
			out.print("<h1>점수를 잘못 입력했습니다.</h1>");
			out.print("<a href=score.html><button>점수 입력창으로 이동</button></a>");
			return;
		}
		 %>
		 
		<%
		if(score>=60) {
			response.sendRedirect("pass.jsp?name="+encodeName+"&score="+strScore);
		}
		else{
			response.sendRedirect("ng.jsp?name="+encodeName+"&score="+strScore);
			}
		%>
		
</body>
</html>