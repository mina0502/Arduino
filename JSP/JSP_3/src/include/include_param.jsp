<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include_param_test</title>
</head>
<body>
	<h2>include Action Tag Test</h2>
	<jsp:include page="include_param_result.jsp" flush="false">
		<jsp:param value="한글Mina" name="name"/>
		<jsp:param value="25" name="age"/>
	</jsp:include>
	<br/>
	<h2>다시 include_param.jsp페이지 입니다</h2>
</body>
</html>