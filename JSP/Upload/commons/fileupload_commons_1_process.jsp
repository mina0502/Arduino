<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload 처리(commons)</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String fileUploadPath = "D:\\upload";
		
		DiskFileUpload upload = new DiskFileUpload();
		
		List items = upload.parseRequest(request);
		
		Iterator params = items.iterator();
		
		while(params.hasNext())
		{
			FileItem fileItem= (FileItem)params.next();
			if(!fileItem.isFormField())
			{
				String fileName= fileItem.getName();
				fileName= fileName.substring(fileName.lastIndexOf("\\")+1);
				
				out.println("1: "+ fileName+"<br/>");
				File file =new File(fileUploadPath+"/"+fileName);
				fileItem.write(file);
				
				out.println("파일 이름: "+fileName+"<br/>");
				out.println("파일 저장 경로: "+file.getPath()+"<br/>");
			}
		}
	%>
</body>
</html>