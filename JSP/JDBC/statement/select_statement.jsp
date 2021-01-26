<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select 결과</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<table border="1">
		<tr>
			<th width="300" align="center">ID</th>
			<th width="300" align="center">PW</th>
			<th width="300" align="center">Name</th>
		</tr>
		<%
			ResultSet rs = null;
			Statement stmt = null;
			
			try{
				String sql= "select * from members";
				stmt= connection.createStatement();
				rs =stmt.executeQuery(sql);
				
				while(rs.next())
				{
					String id= rs.getString("id");
					String pw= rs.getString("pw");
					String username= rs.getString("username");
				%>
				<tr>
					<td width="300" align="center"><%=id %></td>
					<td width="300" align="center"><%=pw %></td>
					<td width="300" align="center"><%=username %></td>
				</tr>
			<%
				}
			}
			catch(SQLException e){
				out.println("페이지를 찾을 수 없습니다");
				out.println("Exception: "+e.getMessage());
			}
			finally{
				if(rs!=null)
					rs.close();
				if(stmt!=null)
					stmt.close();
				if(connection !=null)
					connection.close();
			}
			%>
	</table>
	<a href="insert_form_statement.jsp"><button>입력창으로</button></a>
</body>
</html>