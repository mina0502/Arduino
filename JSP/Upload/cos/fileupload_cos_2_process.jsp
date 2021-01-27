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
<title>File Upload 다중 처리</title>
</head>
<body>
	<%
		MultipartRequest multi = new MultipartRequest(request,
													"D:\\upload",
													1000*1024*1024,
													"utf-8",
													new DefaultFileRenamePolicy()
													);
	String name1=multi.getParameter("name1");
	String title1=multi.getParameter("title1");
	
	String name2=multi.getParameter("name2");
	String title2=multi.getParameter("title2");
	
	String name3=multi.getParameter("name3");
	String title3=multi.getParameter("title3");
	
	
	Enumeration files=multi.getFileNames();
	
	String file3= files.nextElement().toString();	// 역순으로 가져옴
	String filename3= multi.getFilesystemName(file3);
	
	String file2= files.nextElement().toString();	
	String filename2= multi.getFilesystemName(file2);
	
	String file1= files.nextElement().toString();	
	String filename1= multi.getFilesystemName(file1);	
	
	%>
	<table border="1">
		<tr>
			<th width="100">이름</th>
			<th width="100">제목</th>
			<th width="100">file</th>
		</tr>
		<% 
		out.print("<tr><td>"+name1+"</td>");
		out.print("<td>"+title1+"</td>");
		out.print("<td>"+filename1+"</td></tr>");
		
		out.print("<tr><td>"+name2+"</td>");
		out.print("<td>"+title2+"</td>");
		out.print("<td>"+filename2+"</td></tr>");
		
		out.print("<tr><td>"+name3+"</td>");
		out.print("<td>"+title3+"</td>");
		out.print("<td>"+filename3+"</td></tr>");
		%>
	</table>
	<br/><br/>
	<% 	
	Enumeration files1=multi.getFileNames();
	while(files1.hasMoreElements())
	{
		String name= files1.nextElement().toString();
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
			out.println("파일의 크기: "+file.length()/1024+"Kbyte"+"<br/>");
			out.println("파일의 경로: "+file.getPath()+"<br/>");
			}
			out.println("=======================<br/>");
		}
	%>
</body>
</html>