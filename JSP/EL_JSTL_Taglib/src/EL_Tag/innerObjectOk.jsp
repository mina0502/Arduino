<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 저장값 출력하기</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
	
	%>
	<p>ID: <%=id %><br/>
	<p>PW: <%=pw %><br/>
	
	<hr/>
	<h3>EL태그로(param) 값 출력</h3>
	<p>ID: ${param.id}<br/>
	<p>PW: ${param.pw}<br/>
	
	<hr/>
	
	<h3>applicationScope</h3>
	<b>applicationScope 내장객체는 웹프로젝트에 전부 적용이 되는 값</b><br/>
	<p>applicationScope : ${applicationScope.application_name }<br/>
	
	<hr/>
	
	<h3>sessionScope</h3>
	<b>sessionScope내장객체는 한 브라우저당 발생</b><br/>
	<p>sessionScope : ${sessionScope.session_name }<br/>
	
	<hr/>
	
	<h3>pageScope</h3>
	<b>현재 이페이지는 적용이 되지 않음</b><br/><br/>
	
	<p>pageScope : ${pageScope.page_name }<br/>
	<h3>requestScope</h3>
	<p>requestScope : ${requestScope.request_name }<br/>
</body>
</html>