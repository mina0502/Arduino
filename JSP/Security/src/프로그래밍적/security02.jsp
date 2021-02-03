<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증(Security)</title>
</head>
<body>
	<p><b>사용자명 :</b> <%=request.getRemoteUser() %>
	<p><b>인증방법 :</b> <%=request.getAuthType() %>
	<p><b>인증한 사용자명의 역할명 "tomcat" :</b> <%=request.isUserInRole("tomcat") %>
	<p><b>인증한 사용자명의 역할명 "role1" :</b> <%=request.isUserInRole("role1") %>
	<p><b>프로토콜 : </b> <%=request.getProtocol() %>
	<p><b>https : </b> <%=request.isSecure() %>
</body>
</html>