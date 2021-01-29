<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입폼</title>
</head>
<body>
	<h1 style="text-align: center;">회원 등록창</h1>
	<form action="out.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td width="200"><p align="right">아이디</p></td>
				<td width="400"><input type="text" name="id"></td>	
			</tr>
			
			<tr>
				<td width="200"><p align="right">비밀번호</p></td>
				<td width="400"><input type="password" name="pw"></td>	
			</tr>
			
			<tr>
				<td width="200"><p align="right">이름</p></td>
				<td width="400"><input type="name" name="name"></td>	
			</tr>
			
			
			<tr>
				<td width="200"><p align="right">이메일</p></td>
				<td width="400"><input type="text" name="email"></td>	
			</tr>
			
			<tr>
				<td colspan="2" width="400" align="center">
				<input type="submit" value="가입하기">
				<input type="reset" value="Reset">
				</td>	
			</tr>

		</table>
	</form>
</body>
</html>