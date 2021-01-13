	#Servlet 
```
	Servlet
- JSP 표준이 나오기 전에 만들어진 표준으로 자바로 웹어플리케이션을 개발할 수있도록 하기 위해 만들어짐

- Servlet을 이용하면 자바 클래스를 이용해서 웹어플리케이션을 개발할 수 있음

- 반드시 매핑을 해야함 [경로, 보안상 문제|| 유지하기위해 사용]
- 동적 웹어플리케이션 컴포넌트 (.jsp와 동일{view})
- .java 확장자
- 클라이언트의 요청에 동적으로 작동하고, 응답은 html을 이용
- java thread이용하여 동작 (가장 큰 장점) - thread pool<제한된 갯수만큼 쓰레드를 생성>을 이용하면 서버의 부하를 줄임
- MVC패턴에서 Controller로 이용됨


	★MVC 패턴★

request→  Controller(Servlet) ↔ Model
	      ↓
	 View (JSP) → response

```
	##Servlet 상속 계층도

```
Servlet [ init, Destory, 추상메서드・・・], ServletConfig (추상메서드)

GenericServlet [추상클래스]

HttpServlet [Generic Servlet 추상클래스를 상속받음] @Overidng 해줘야함
	↓
http 프로토콜을 사용하는 Servlet을 이용하기위해 

```

```
Servlet 파일은 HttpServlet파일을 상속받아야 서블릿 파일이 됨
서블릿 파일을 만들고 나서, URL 매핑을 해줘야함
1. @WebServlet에 적용될 문자열을 입력하여 주는 방법
2. Web.xml파일에서 태그로 직접 지정
```

```
	web.xml

- servlet-name : 임의의 이름을 만들어줌

- servlet-class : 매핑할 클래스 파일명을 패키지명을 포함하여 정확하게 입력

- url-pattern : servlet-class의 클래스를 매핑할 임의의 이름을 입력 ※주의※ '/'로 시작


```

```
	어노테이션을 서블릿 매핑

@WebServlet("/example") : 매핑명을 java소스에 직접 입력
--> 어노테이션을 통한 매핑보다는 web.xml파일의 우선 순위가 높지만 어노테이션을 이용하는게 편함

==> URL매핑코드가 @WebServlet어노테이션에 명기되어 있음
서블릿 파일이 되면 httpServlet 클래스를 자동으로 상속 받는다.
```
```
javax.servlet 패키지에 예외가 발생하면, 프로젝트 우클릭해서 build path -> libaries ->add external jars
-> 톰캣폴더\lib-> 찾기(jsp-api, servlet_api.jar)추가

URL 매핑코드가 @WebServlet어노테이션에 명기되어 있음
서블릿 파일이 되면 HttpServlet 클래스를 자동으로 상속받음
```

```
	2가지의 메서드 doGet(), doPost() --> Servlet 파일이 처리하는 부분

Servlet을 호출할 때, Client에서 request가 들어올 때, Get 방식인지 Post방식인지에 따라 호출이 달라짐
==> doGet() 메서드 ==> 폼을 출력하는 형태
==> doPost 메서드 ==> 데이터를 가공・처리 코드 실행할 때, 많이 사용
```


```

jsp파일 : HTML 파일내에 jsp 코드를 넣는 것
Servlet 파일 : 자바파일, 반드시 매핑을 해서 사용해야함

```


```
		web.xml

1. 매핑해야될 서블릿파일을 지정

2. 지정한 매핑할 서블릿 파일을 url-pattern 태그를 이용하여 
    URL창에 표식이 되도록함

3. servlet-mapping 내의 servlet-name의 경우 지정한 이름과 동일하게 해줘야함

```

```
 response.setContentType("text/html; charset=utf-8"); : 문자셋 지정
 
System.out.println() ==> 콘솔

PrintWriter ==> 출력

 서블릿은 JSP표준 이전에 등장한 표준 (자바웹어플리케이션 개발을 목적)
```
```

	web.xml 매핑과 어노테이션 매핑

어노테이션 매칭 -> 프로그램 개발을 완성한 후 릴리즈를 한 후 수정시 자바소스파일을 수정, 재컴파일을 계속하게됨 || (유지보수가 용이하지 않음)

web.xml --> 경우에 따라 각각 다르게 구현이 되어야함 || 규모가 클 경우 유리

```

```
		서블릿 프로젝트 만들기

Servlet은 Java언어를 사용하여 웹 프로그램을 제작하는 것

Servlet은 HttpServlet을 상속받아서 사용됨

어노테이션방식 호출 ==> doGet()메소드로 호출됨

```

```
response.setContentType("text/html"); <-- 클라이언트에게 보여줄 때는 html로
PrintWriter writer = response.getWrite(); <-- 웹브라우저에 출력하기 위한 스트림 
[서블릿 파일은 자바파일이기 때문에 출력스트림을 이용해서 tml코드를 직접 뿌려줌]

JSP는 기본적으로 html파일이기 때문에 서블릿과는 다름

write.close(); <-- 자원 아끼기

Client -request-> Was -> DB -> Was -response-> Client 
```

```
	GET 방식

Get방식 (form method value= get) : 	URL값으로 정보가 전송되어 보안에 약함
				URL경로 뒤에 ?와 함께 parameter를 붙여 전송(쿼리문자열)
				쿼리문자열은 파라미터를 &로 구분


POST방식 (form method value=post):	header를 이용해 정보가 전송되어 보안에 강함

(컨테이너 --> WAS)

doGet() --> 	html내 form태그의 method 속성이 get일 때 호출
		웹브라우저의 주소창을 이용하여 servlet을 요청한 경우에 호출
doGet메소드의 매개변수  : HttpServletRequest / HttpServletResponse를 받음
	Request(요청) || Response(응답)


* Response객체 setContentType()메소드를 호출하여 응답방식 결정
* getWriter()메소드를 이용하여 출력 스트림을 얻음

기본적으로 응답을 할경우 html코드로 응답을 하고 문자셋은 utf-8로 설정
response.setContentType("text/html; charset=utf-8"); 

출력스트림 --> println() 메소드를 활용해서 출력할 경우 웹브라우저에 출력
close() || 출력객체 닫음


	POST 방식

html내 form태그의 method속성이 post일 경우 호출


```

```
	Form태그
<form action="GetorPost" method="get">
	<input type="submit" value="Go">
</form>

form 태그를 이용하여 GgetorPost.java파일에 있는 doGet()를 호출

입력타입 submit은 전송의 의미로 버튼이 나타나고 Go라는 라벨이 적힘
```
```
request.setCharacterEncoding("utf-8");  || 클라이언트가 요청한 parameter 값들을 인코딩을 해주는 코드

String id = request.getParameter("id");
String passwd= request.getParameter("passwd");

==> 클라이언트에게서 넘어오는 id, password 값을 받아 인코딩 설정 후 출력리스트림을 얻고 화면에 뿌림

response.setContentType("text/html; charset=utf-8");
PrintWriter writer= response.getWriter();
```

```
		CSS
ID 선택자 -->  #

태그 선택자 --> 그대로 사용

```

```
request.setCharacterEncoding() - 인코딩 설정 || 요청 들어온 문자열

response.setContentType() - 타입 설정  || 응답하기 윈한 문자열

```