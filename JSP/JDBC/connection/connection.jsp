<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 연결</title>
</head>
<body>
	<%
		Connection connection= null;
		
		String url= "jdbc:mysql://localhost:3306/testdb";
		String id="root";
		String pw="1234";
		String driver = "com.mysql.jdbc.Driver";
		try{
		Class.forName(driver);
		connection=DriverManager.getConnection(url, id, pw);
		out.println("Database Connect Success");
		}
		catch(Exception e){
			out.println("Database Connect Fail <br/>");
			out.println(e.getMessage()+"<br/>");
			e.printStackTrace();
		}
		finally{
			if(connection !=null)
			{
				connection.close();
			}
		}
	%>
</body>
</html>