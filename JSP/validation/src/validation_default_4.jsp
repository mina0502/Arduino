<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유효성 검사_4</title>
</head>

<script type="text/javascript">
	function checkLogin() {
		var form=document.loginFrm;
		if(form.id.value=="")
			{
				alert("아이디를 입력해주세요");
				form.id.select();
				form.id.focus();
				return;
			}
		if(form.pw.value=="")
			{
				alert("비밀번호를 입력해주세요");
				form.pw.select();
				form.pw.focus();
				return;
			}
		
		if(form.id.value.length <4 || form.id.value.length > 12)
			{
				alert("아이디는 4~12자 이내로 입력하셔야합니다");
				form.id.select();
				form.id.focus();
				return;
			}
		
		for(var i=0;i<form.id.value.length;i++)
			{
				var ch=form.id.value.charAt(i);
				if((ch<'a' || ch>'z') && (ch>'A' || ch<'Z')&& (ch>'0' || ch<'9'))
					{
						alert("아이디는 소문자만 입력가능합니다");
						form.id.select();
						form.id.focus();
						return;
					}
			}
			
	 
		
		if(form.pw.value.length <4){
			alert("비밀번호는 4자 이상으로 입력해주세요");
			form.pw.select();
			form.pw.focus();
			return;
		}
		
		if(isNaN(form.pw.value))
			{
			alert("비밀번호는 숫자로만 입력가능합니다");
			form.pw.select();
			form.pw.focus();
			return;
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