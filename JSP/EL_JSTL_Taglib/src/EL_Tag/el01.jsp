<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 표기법</title>
</head>
<body>
	<% 
		pageContext.setAttribute("socres", new int[]{10,20,30});
		int el = 10;	
	%>
	
	표현식으로 출력한 내용<br/>
	<%=el %><br/>
	
	EL로 출력한 내용<br/>
	${socres[0]}<br/>
	${"mina"}<br/>
	${null}<br/>
	${100 }<br/>
	연산자 이용<br/>
	${100+10 }<br/>
	${(1>2)?"참":"거짓"}<br/>
	${(1>2) && (1<2) }<br/>
	${(1>2) || (1<2) }<br/>
	<%=(1>2)||(1<2) %><br/>
</body>
</html>