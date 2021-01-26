<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
		Connection connection= null;
		
		String url= "jdbc:mysql://localhost:3306/testdb";
		String admin="root";
		String password="1234";
		String driver = "com.mysql.jdbc.Driver";
		
		Class.forName(driver);
		connection=DriverManager.getConnection(url, admin, password);
%>