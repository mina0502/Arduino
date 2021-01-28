<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유효성 검사_2</title>
</head>

<script type="text/javascript">
	function checkLogin() {
		var form=document.loginFrm;
		if(form.id.value=="")
			{
				alert("아이디를 입력해주세요");
				form.id.focus();
				return false;
			}
		else if(form.pw.value=="")
			{
				alert("비밀번호를 입력해주세요");
				form.pw.select();
				return false;
			}
		form.submit();
	}

</script>

<body>
	<form name="loginFrm" action="validation_default_process.jsp" method="post">
		<p>ID : <input type="text" name="id">
		<p>PW : <input type="password" name="pw">
		<p><input type="button" value="전송" onclick="checkLogin()">
	</form>
</body>
</html>