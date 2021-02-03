<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form 인증</title>
</head>
<body>
	<form name="loginForm" action="j_security_check" method="post">
		<p><b>사용자명 : </b><input type="text" name='j_username'/>
		<p><b>비밀번호 : </b><input type="password" name='j_password'/>
		<p> <input type="submit" value="전송"/>
	</form>
</body>
</html>