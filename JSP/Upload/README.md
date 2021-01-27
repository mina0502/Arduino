# 파일 업로드 개요
```
	파일 업로드

웹 브라우저에서 서버로 파일을 전송하여 서버에 저장하는 것

서버로 업로드할 수 있는 파일 ( 대부분 가능)

웹 브라우저에서 서버로 파일을 전송하기 위해 JSP 페이지에 폼 태그 사용

전송된 파일을 서버에 저장하기 위해 오픈 라이브러리 이용

```
```

	파일 업로드를 위한 JSP페이지

웹 브라우저에서 서버로 파일을 전송하기 위해 JSP 페이지에 폼 태그를 작성 할 때 몇 가지 중요한 규칙


	<form action="JSP 파일" method="POST" enctype="multipart/form-data">
		<input type="file" name="요청 파라미터 이름">
	</form>


form 태그의 method 속성은 반드시 POST 방식으로 설정
form 태그의 enctype 속성은 반드시 multipart/form-data로 설정
form 태그의 action 속성은 파일 업로드를 처리할 JSP파일로 설정
파일 업로드를 위해 input 태그의 type 속성을 file로 설정
- 여러 파일을 업로드 하려면 2개 이상의 input 태그를 사용하고 name 속성에 서로 다른 값을 설정

	- enctype은 전송 데이터 형식 설정을 하는 부분
	
	1. application/x-www-form-urlencoded
	 디폴트 값, 서버로 전송되기 전에 url-encode된다는 뜻
	2. mutipart/dorm-data
	 파일 받으면서 설정, 이미지나 파일을 서버로 전송할 경우 이 방식을 사용
	3. text/plain
	 인코딩을 하지 않은 문자 그대로 상태를 전송

```
## 파일 업로드 처리 방법

```

	단순한 자바 코드로 작성하여 처리할 수 없어 오픈 라이브러리인 cos.jar나
	commonsfileupload.jar를 사용

*****************************************************************************************

MultipartRequest 이용 - 가장 간단한 방법 - cos.jar

아파치 API 이용 - 편리하고 강력한 API 제공 - commons-fileupload.jar | commons-io.jar

cos.jar : 웹 to 웹 으로 전송해야되는 간단한 데이터, 진행상태 표시 구현이 필요업는 파일 업로드 기능 구현시 
	매우 간단하게 구현 가능한 장점을 가짐, 소스가 제공되므로 개발자 편의에 따라 소스를 수정하여 사용할 수 있음, 업데이트 잘 안됨

Apache commons upload : 일반적인 파일 업로드기능 외에 파일명이나 저장되야할 위치에 대한 조작 등 개발 의도에 따른 소스 구현이
좀 더 유연함, 업로드 진행상태를 알 수 있는 프로그레스바 구현을 ProgressListner를 통해 쉽게 구현할 수 있음

```

# MultipartRequest를 이용한 파일 업로드

```

	MultipartRequest

웹 페이지에서 서버로 업로드 되는 파일 자체만 다루는 클래스

웹 브라우저가 전송한 multipart/form-data유형과 POST방식의 요청 파라미터 등을
분석한 후 일반 데이터와 파일 데이터를 구분하여 파일 데이터에 접근

한글 인코딩 값을 얻기 쉽고, 서버의 파일 저장 폴더에 동일한 파일명이 있으면 파일명을 자동으로 변경

오픈 라이브러리 cos.jar를 배포 사이트
[사이트](http://servlets.com/cos)

```

```
	MultipartRequest를 이용한 파일 업로드

클래스 생성

MultipartRequest(javax.servlet.http.HttpServletRequest request,
		java.lang.String saveDirectory,
		int maxPostSize,
		java.lang.String encoding,
		FileRenamePolict policy )

******************************************************************************

MultipartRequest 생성자의 매개변수

request - Request 내장 객체를 설정

saveDirectory - 서버의 파일 저장 경로를 설정

maxPostSize - 파일의 최대 크기(바이트 단위)를 설정, 최대 크기를 초과하면 IOException이 발생

encoding - 인코딩 유형을 설정

policy - 파일명 변경정책을 설정, saveDirectory에 파일명이 중복되는 경우 덮어쓰기 여부를 설정하며, 설정하지 않으면 덮어씌움



******************************************************************************

MultipartRequest 클래스 생성 예

MultipartRequest multi = new MultipartRequest(request, 
			"C:\\upload",5*1024*1024,"utf-8",
			new DefaultDileRenamePolicy())

```
```
	MultipartRequest 메소드

웹 브라우저에서 전송되는 요청 파라미터 중

일반데이터는 getParameter()메소드로 값을 받음
파일의 경우 getFileNames()메소드를 이용하여 데이터를 받음


	MultipartRequest 메소드의 종류

getContextType(String name) - 업로드 된 파일의 콘텐츠 유형을 반환, 업로드 된 파일이 없으면 null 반환

getParameter(String name) - 요청 파라미터 이름이 name인 값을 전달받음

getParameterNames() - 요청 파라미터 이름을 Enumeration 객체 타입으로 반환

getFile(String name) - 서버에 업로드된 파일에 대한 파일 객체를 반환| 업로드된 파일이 없으면 null반환

getFileNames() - 폼 페이지에 input 태그 내 type 속성 값이 file로 설정된 요청 파라미터의 이름을 반환

getFilesystemName(String name) - 사용자가 설정하여 서버에 실제로 업로드된 파일명을 반환 | 파일명이 중복되면 변경된 파일명을 반환

getOriginalFilename(String name) - 사용자가 업로드한 실제 파일명을 반환 | 파일명이 중복되면 변경 전의 파일명을 반환

```

## Commons-FileUpload

```

파일 업로드 패키지

서버의 메모리상에서 파일 처리가 가능하도록 지원

오픈 라이브러리 commons-fileupload.jar, commons-io.jar 파일을 배포 사이트에서 직접 다운로드해서 사용

[배포사이트](http://commons.apache.org/downloads/)

JSP페이지에 page디렉티브 태그의 import 속성을 사용하여 패키지 org.apache.commons.fileupload.*를 설정


```

```
		Commons-FileUpload

setRepositoryPath(String repositoryPath) - 업로드된 파일을 임시로 저장할 디렉터리를 설정
setSizeMax(long sizeMax) - 최대 파일의 크기를 설정
setSizeThreshold(int sizeThreshold) - 메모리상에 저장할 최대 크기를 설정
parseRequest(HttpServletRequest req) - multipart/form-data 유형의 요청 파라미터를 가져옴

		FileItem

isFormField() -요청 파라미터가 파일이 아니라 일반 데이터인 경우 true를 반환
getFieldName() - 요청 파라미터의 이름을 얻어옴
getString() - 기본 문자 인코딩을 사용하여 요청 파라미터의 값을 얻어옴
getString(String encoding) - 설정한 문자 인코딩을 사용하여 요청 파라미터의 값을 얻어옴
getName() - 파일의 이름을 얻어옴
getSize() - 파일의 크기를 얻어옴
get() - 바이트 배열로 얻어옴
isInMemory() - 메모리에 저장된 상태인 경우 true를 반환, 임시 디렉토리에 저장된 경우 false 반환
delete() - 파일과 관련된 자원을 삭제, 메모리상에 저장된 경우 할당된 메모리를 반환, 임시 파일로 저장된 경우 파일을 삭제
write() - 파일과 관련된 자원을 저장
getContentType() - 웹브라우저가 전송하는 콘텐츠 유형을 반환, 정의되어 있지 않은 경우 nul을 반환

```

```
enctype : 전송타입을 설정  , 파일을 전송하기 위해서는 반드시 multipart/form-data로 지정

MultipartRequest multi = new MultipartRequest(request, || 업로드 될 경로 지정
			"C:\\upload",5*1024*1024," || 파일의 크기를 지정
			utf-8",			|| 인코딩 방식
			new DefaultDileRenamePolicy())	|| 파일이름에 대한 정책 [ 새로운 파일을 만듬]

```

```

	fileupload_commons.jsp

		업로드 할 서버의 경로를 지정
		String fileUploadPath = "D:\\upload";
		
		
		DiskFileUpload upload = new DiskFileUpload();
		
		요청된 파라메터를 전달받기 위해서 parseRequest()호출
		List items = upload.parseRequest(request);
		
		반복자 얻는 코드
		Iterator params = items.iterator();

		while(params.hasNext())
		{
			FileItem fileItem= (FileItem)params.next();
		|| isFormField()는 요청 파라메터가 파일이 아니라 일반 데이터인 경우 true 리턴
			if(!fileItem.isFormField())
			{
				String fileName= fileItem.getName();
				fileName= fileName.substring(fileName.lastIndexOf("\\")+1) || 경로 제거
			}

```

```
	apache

DiskFileItemFactory
ServletFileUpload

``