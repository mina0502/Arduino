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
		
		PreparedStatement pstmt= null;
	
		try{
		String sql = "insert into members values(?,?,?)";
		
		pstmt= connection.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2,pw);
		pstmt.setString(3,username);
		pstmt.executeUpdate();
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
			if(pstmt!=null)
			{
			pstmt.close();
			}
			if(connection!=null)
			{
				connection.close();
			}
		}
	%>
	<br/><a href="select_preparestatement.jsp"><button>확인하러가기</button></a>
</body>
</html>