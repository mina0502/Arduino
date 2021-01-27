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
<title>File Upload 처리</title>
</head>
<body>
	<%
		MultipartRequest multi = new MultipartRequest(request,
													"D:\\upload",
													1000*1024*1024,
													"utf-8",
													new DefaultFileRenamePolicy()
													);
	Enumeration params= multi.getParameterNames();
	
	while(params.hasMoreElements()){
		String name=params.nextElement().toString();
		String value= multi.getParameter(name);
		out.println(name+"="+ value + "<br/>");
	}
	
	
	out.println("===========================================<br/>");
	
	
	Enumeration files=multi.getFileNames();
	while(files.hasMoreElements())
	{
	String name= files.nextElement().toString();
	String filename= multi.getFilesystemName(name);
	String original=multi.getOriginalFileName(name);
	String type= multi.getContentType(name);
	File file= multi.getFile(name);
	out.println("요청들어온 파라메터 이름: "+name+"<br/>");
	out.println("실제 파일 이름: "+original+"<br/>");
	out.println("저장 파일 이름: "+filename+"<br/>");
	out.println("파일 컨텐츠 유형: "+type+"<br/>");
	
	if(file !=null)
	{
		out.println("파일의 크기: "+file.length()+"<br/>");
		out.println("파일의 경로: "+file.getPath()+"<br/>");
	}
	}
	%>
</body>
</html>