<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
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
		
		String path="D:\\upload";
		String fileName="";
		// 넘어온 파일의 형태가 "multipart/form-data"인지 확인
		boolean isMultipart=ServletFileUpload.isMultipartContent(request);
		
		if(isMultipart){
			// 메모리나 파일로 업로드할 때 파일을 보관하는 FileItem의 Factory설정
			DiskFileItemFactory factory= new DiskFileItemFactory();
			//업로드 요청을 처리하는 ServletFileUpload 객체를 생성 
			ServletFileUpload upload= new ServletFileUpload(factory);
			//업로드의 요청이 들어올 때 파싱해서 FileItem 목록을 구하는 코드
		 	List<FileItem> items = upload.parseRequest(request);
			
			Iterator<FileItem>iterator= items.iterator();
			
			while(iterator.hasNext())
			{
				FileItem item= iterator.next();
				// 파일 여부 확인
				//Text라면 True
				if(item.isFormField())
				{
					String name= item.getFieldName(); // 태그가 name
					String value= item.getString("utf-8");
				}
				else
				{
					
					fileName= item.getName(); // 파일이름 얻기
					String fileFieldName= item.getFieldName(); // 태그가 Name
					String contentType = item.getContentType();
					boolean isInMemory= item.isInMemory(); // 메모리상에 있으면 true
					
					fileName= fileName.substring(fileName.lastIndexOf("\\")+1);
					long fileSize=item.getSize();// 파일의 용량
					
					File file= new File(path+"/"+fileName);
					
					//파일이 존재한다면
					if (file.exists()){
						for(int i=0;true;i++){
							file = new File(path+"/"+"("+i+")"+fileName);
							if(!(file.exists())==true)
							{
								fileName= "("+i+")"+fileName;
								break;
							}
						}
					}
					item.write(file);
					
					
					
					String filepath=file.getPath();
					out.println("<br>-----------------------------<br>");
					out.println("요청 파라미터 이름: "+fileFieldName+"<br>");
					out.println("저장 파일 이름: "+ fileName+"<br>");
					out.println("파일 콘텐츠 유형: "+contentType+"<br>");
					out.println("파일 크기: "+ fileSize+"<br>");
					out.println("파일 경로: "+path+"<br/>");
				}
			}
		}
	%>
	저장된 이미지<br/>
	<img alt="사진" src="<%=path %>//<%= fileName %>"/>
</body>
</html>