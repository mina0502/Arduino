<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include action Tag Test</title>
</head>
<body>
	<h1>include_Test.jst페이지입니다</h1>
	<jsp:include page="include_test_sample.jsp" flush="false" />
	
		<h1>다시 include_Test.jst페이지입니다</h1>
</body>
</html>