<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBCP 테스트</title>
</head>
<body>
	<%
		Context context = new InitialContext();
		DataSource dataSource= (DataSource)context.lookup("java:comp/env/"+"jdbc/dbconn");
		Connection connection= dataSource.getConnection();
		out.println(connection.toString());
		out.println(Thread.currentThread().getName());
	%>
</body>
</html>