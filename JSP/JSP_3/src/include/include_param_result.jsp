<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8");
    String name= request.getParameter("name");
    int age= Integer.parseInt(request.getParameter("age"));
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include_param_result 페이지</title>
</head>
<body>
	<h2>include_param_result.jsp 페이지</h2>
	<br/>
	넘어온 이름: <%=name %><br/>
	넘어온 나이: <%=age %><br/>
</body>
</html>