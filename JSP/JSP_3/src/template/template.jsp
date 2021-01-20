<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String pagefile=request.getParameter("page"); 
if(pagefile==null)
{
	System.out.println("PageCheck");
	pagefile="newitem";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Template Page</title>
<style>
	table {
		margin: auto;
		width: 1024px;
		height: 720px;
		color: gray;
		border: 2px red;
}
</style>
</head>
<body>
	<table border="1">
		<tr>
			<td height="15%" width="20" align="center">쇼핑몰 로고</td>
			<td height="15%" colspan="2" align="right">
				<jsp:include page="top.jsp"/>
			</td>
		</tr>
		
		<tr>
			<td width="20%" align="right" valign="top">
				<jsp:include page="left.jsp"/> 
			</td>
			
			<td colspan="2" align="center">
				<jsp:include page='<%=pagefile+".jsp" %>' />			
			</td>
		</tr>
		
		<tr>
			<td width="100%" height="10%" colspan="3" align="center">
				<jsp:include page="bottom.jsp"/> 
			</td>
			
		</tr>
		
		
	
	</table>
</body>
</html>