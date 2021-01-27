<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일업로드 (cos.jar이용)</title>
</head>
<body>
		<form name="fileForm" action="fileupload_cos_1_process.jsp" method="post" 
		enctype="multipart/form-data">
			<p><b>이 름 : </b><input type="text" name="name"></p>
			<p><b>제 목 : </b><input type="text" name="title"></p>
			<p><b>파 일 : </b><input type="file" name="filename"></p>
			<p><input type="submit" value="Upload"></p>
		</form>
</body>
</html>