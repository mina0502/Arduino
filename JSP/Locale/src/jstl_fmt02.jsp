<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다국어처리-fmt태그02(숫자)</title>
</head>
<body>
	<fmt:setLocale value="en_US"/>
	<p>숫자: <fmt:formatNumber value="4545000" groupingUsed="false" />
	<p><fmt:formatNumber value="4545000" type="number" />  천자리 구분
	<p><fmt:formatNumber value="4545000" type="number" groupingUsed="false"/>  천자리 구분을 하지 않음
	<p><fmt:formatNumber value="4545000" type="currency" />
	<p><fmt:formatNumber value="4545000" type="currency" currencySymbol="원" />
	<p><fmt:formatNumber value="0.45" type="percent" />	
	<p><fmt:formatNumber value="4545000" minIntegerDigits="10" minFractionDigits="2"/>
	
	<p><fmt:formatNumber value="4545000.12" pattern="0000000000.000"/>
	<p><fmt:formatNumber value="4545000.12" pattern="##########.###"/>
</body>
</html>