<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HttpServletResponse를 이용한 sendRedirect</title>
</head>
<body>

	<%
	request.setAttribute("id", "abcde");
	request.setAttribute("pw", "12345");
	pageContext.getSession().setAttribute("name", "aaaa");
	pageContext.getSession().setAttribute("year", "1996");
	// HttpServletResponse을 통해서 위임을 하고 있지만 sendRedirect()방법은 새로운 request객체를 생성
	//이전 요청이 들어온 request 객체는 제거되, 속성값들을 참조할 수 없음
	response.sendRedirect("redirectResult.jsp");
	%>
</body>
</html>