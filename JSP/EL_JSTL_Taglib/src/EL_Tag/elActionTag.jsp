<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="member" class="sec01.MemberInfo" scope="page"></jsp:useBean>
	<jsp:setProperty  name="member" property="name" value="miyamoto"/>
	<jsp:setProperty  name="member" property="id" value="mina"/>
	<jsp:setProperty  name="member" property="pw" value="12345"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그와 EL표기법</title>
</head>
<body>
		액션태그사용 <br/>
		이름: <jsp:getProperty name="member" property="name" /><br/>
		ID: <jsp:getProperty name="member" property="id" /><br/>
		PW: <jsp:getProperty name="member" property="pw" /><br/>
		
		EL 표기법<br/>
		<p>이름:${member.name}
		<p>ID: ${member.id }
		<p>PW: ${member.pw }
</body>
</html>