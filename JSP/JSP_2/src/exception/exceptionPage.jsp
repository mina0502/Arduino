<%@ page isErrorPage="true"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exceptionPage</title>
</head>
<body>
<!-- 
	<%
		response.setStatus(200);
		response.setCharacterEncoding("utf-8");
	%>
	<h1>에러 발생<br/></h1>
	<%--=exception.getMessage()--%>
	-->
	 <h1>죄송합니다. 서비스 실행 중 오류가 발생했습니다.</h1><br/>
	 <h1>잠시 후 다시 시도해 주세요.</h1><br/>
	 <img src="image/error_image.png"/>
</body>
</html>