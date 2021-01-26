<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 입력값 DB저장하기</title>
</head>
<body>
	<%@include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
		
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String username= request.getParameter("username");
		
		Statement stmt = null;
		
		try{
		String sql = "insert into members (id,pw,username) values('"+id+"','"+pw+"','"+username+"')";
		
		stmt= connection.createStatement();
		stmt.executeUpdate(sql);
		out.println("members테이블에 정상적으로 삽입 되었습니다");
		}
		catch(SQLException e)
		{
			out.println("members테이블에 삽입이 되지 않았습니다 <br/>");
			out.println("SQLException:"+ e.getMessage()+"<br/>");
		//	e.printStackTrace();
		}
		finally
		{
			if(stmt!=null)
			{
			stmt.close();
			}
			if(connection!=null)
			{
				connection.close();
			}
		}
	%>
	<br/><a href="select_statement.jsp"><button>확인하러가기</button></a>
</body>
</html>