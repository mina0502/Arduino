<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정규 표현식</title>
</head>

<script type="text/javascript">
	function checkMember()
	{
		var regExpId=/^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var regExpName = /^[가-힣]*$/;
		var regExpPw= /^[0-9]*$/;
		var regExpPhone= /^\d{3}-\d{3,4}-\d{4}$/;
		var regExpEmail= /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		/*DOM 객체형의 멤버로 변수에 할당*/
		var form= document.Member;
		var id = form.id.value;
		var pw = form.pw.value;
		var name= form.name.value;
		var phone = form.phone1.value+"-"+form.phone2.value+"-"+form.phone3.value;
		var email = form.email.value;
		
		if(!regExpId.test(id))
			{
				alert("id는 문자로 시작해주세요");
				return;
			}
		if(!regExpPw.test(pw))
		{
			alert("pw는 숫자로만 입력해주세요");
			return;
		}
		
		if(!regExpName.test(name))
		{
			alert("이름은 한글로만 입력해주세요");
			return;
		}
		
		if(!regExpPhone.test(phone))
		{
			alert("연락처 입력을 확인해 주세요");
			return;
		}
		
		if(!regExpEmail.test(email))
		{
			alert("Email을 입력해주세요");
			return;
		}
		 form.submit(); 
	}
</script>

<body>
	<h3>회원 가입</h3>
	<form name="Member" action="validation_regular_process.jsp" method="post">
		<p>ID : <input type="text" name="id">
		<p>PW : <input type="password" name="pw">
		<p>Name: <input type="text" name="name">
		<p>Phone: <select name="phone1">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
		</select> - 
		<input type="text" maxlength="4" size="4" name="phone2"> -
		<input type="text" maxlength="4" size="4" name="phone3">
	
		<p>E-mail: <input type="text" name="email">
		<p><input type="button" value="Go" onclick="checkMember()">
	</form>
</body>
</html>