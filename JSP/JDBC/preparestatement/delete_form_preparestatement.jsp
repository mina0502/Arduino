<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete 실습</title>
</head>
<body>
	<h2>입력된 값 DB삭제</h2>
	<form action="delete_preparestatement.jsp" method="post">
		<p>ID: <input type="text" name="id" required="required"/></p>
		<p>PW: <input type="password" name="pw" required="required"/></p>
		<p>Name: <input type="text" name="username"/></p>
		<p><input type="submit" value="Check"/></p>
	</form>
</body>
</html>