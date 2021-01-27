<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일업로드 (commons.jar이용)</title>
</head>
<body>
		<form name="fileForm" action="fileupload_commons_2_process.jsp" method="post" 
		enctype="multipart/form-data">
			<p><b>파 일 : </b><input type="file" name="name"></p>
			<p><b>올린 사람 : </b><input type="text" name="username"></p>
			<p><input type="submit" value="Upload"></p>
		</form>
</body>
</html>