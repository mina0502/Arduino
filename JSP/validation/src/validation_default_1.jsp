<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유효성 검사_1</title>
</head>

<script type="text/javascript">
	function printForm() {
		alert("ID: "+document.loginFrm.id.value+"\n"+
				"PW: "+document.loginFrm.pw.value);
	}

</script>

<body>
	<form name="loginFrm" action="#" method="post">
		<p>ID : <input type="text" name="id">
		<p>PW : <input type="password" name="pw">
		<p><input type="submit" value="전송" onclick="printForm()">
	</form>
</body>
</html>