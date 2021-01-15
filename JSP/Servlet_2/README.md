```
	 Servlet 작동 방식

- 초기의 웹 프로그래밍에선 서블릿을 이용해서 브라우저의 요청을 처리해서 서비스를 제공

1. 클라이언트로부터 요청을 받음
2. 데이터베이스 연동과 같은 비즈니스 로직을 처리
3. 처리된 결과를 클라이언트에 응답

클라이언트에서 servlet요청이 들어오면 서버에서는 servlet컨테이너를 만들고, 요청이 있을 때마다 스레드가 생성됨

웹브라우저 -> 웹서버 -> 웹어플리케이션서버(WAS) -> Servlet 컨테이너(스레드 생성, Servlet객체 생성)
```
```
	Java 와 CGI(Common Gateway Intterface)

자바가 다른 CGI언어에 비해 장점은 클라이언트에게서 계속적으로 요청이 들어오면
JVM이 스레드와 Servlet객체를 생성하여 서버의 부하가 심하지 않고, 빠른 응답속도를 지니고 있음.
자바는 멀티스레드를 지원하기 때문임.

다른 CGI언어는 스레드 생성이 아니라 요청 처리를 위한 객체가 메모리에 지속적으로 상주하기 때문에
서버의 부하가 많이 심해짐 || 보조프로그램을 같이 연동해서 사용함

자바 - 스레드 pool에서 제한된 갯수의 스레드를 만듦 (작업 큐의 양은 늘어나지만 스레드의 양을 유지)

```
```

요청 -->firstServlet --> FirstServlet을 메모리에 로드 --> init()호출 --> doGet()또는 doPost()호출 --> 결과값 응답

init()호출 후 --> 응답 속도 빨라짐 [메모리 로드 시간이 줄어듬]

```	

```
	요청과 응답 관련 API 사용 예
public void init() throws ServletException -->최초로 로딩이 될 경우 단 한번 호출 
protected void doGet(HttpServletRequest request, HttpServletResponse response)
protected void doPot(HttpServletRequest request, HttpServletResponse response)
public void destory() --> Servlet이 사라질 때 호출
```

```
	HttpServletRrequest의 여러가지 메서드

Authenticate(HttpServlet Response response) -> 요청한 사용자가 ServletContext 객체에 대한 인증을 하기 위한 컨테이너 로그인 메커니즘을 사용
changeSessionId() -> 현재 요청과 연관된 현재 세션의 id를 변경하여 새 세션id를 반환
getContextPath() -> 요청한 컨텍스트를 가리키는 URI를 반환 [URI -> 문자열을 전송・반환 하는 프로토콜]
getCookies() -> 현재의 요청과 함께 보낸 쿠키 객체들에 대한 배열을 반환
getHeader(String name) -> 특정 요청에 대한 헤더 정보를 문자열로 반환
getHeaderNames -> 현재의 요청에 포함된 헤더의 name 속성을 enumeration으로 반환
getMethod() -> 현재 요청이 GET,POST 또는 PUT 방식 중 어떤 http 요청인지 반환
getRequsetURI() -> 요청한 URL의 컨텍스트 이름과 파일 경로까지 반환
getServletPath() -> 요청한 URL에서 서블릿이나 JSP이름을 반환
getSession() -> 세션 반환
getPathInfo() -> URL과 관련된 추가 경로 정보 반환


***********************************************************

	HttpServletResponse의 여러가지 메서드

addCookie(Cookie cookie) -> 응답에 쿠키를 추가
addHeader(String name, String value) -> name 과 value를 헤더에 추가
encodeURL(String url) 세션 id를 포함한 특정 URL을 인코딩함 (인코딩 --> 기계가 알아보기 쉬운 방식)
getHeaderNames() -> 응답의 헤더에 포함된 name을 얻어옴
sendRedirect(String location) -> 클라이언트에게 리다이렉트 응답을 보낸 후 특정 URL로 다시 요청하게 함 
```
```
	Servlet 라이프사이클(생명주기)

Servlet의 사용도가 높은 이유 - 빠른 응답속도

최초 요청시 객체가 만들어져 메모리에 로딩, 기존의 객체를 재활용 || 동작 속도 빠름

service()메서드 --> doGet()과 doPost() 메서드가 없을 경우 자동 실행되는 콜백 메서드 || 잘 사용 안함

```

```
	Sevlet 선처리, 후처리 순서

Servlet 객체생성 --> @PostConstruct(선처리) --> init() 호출 --> service(),doGet(),doPost() --> destory()호출 --> @PreDestroy(후처리)

init()전에 @PostConstruct가 속한 메서드가 먼저 호출됨
destory() 후에 @PreDestory가 속한 메서드가 destory()이후에 호출 || 잘 사용 안함

```

```
init() --> 최초 한번만 실행

Destory --> 서버를 중지시켜보면 destory()호출 되는 것을 볼 수 있음

실행되었을때, 서블릿객체가 메모리에 로딩이 되고 계속 재사용을 함
doGet(), doPost()

선처리 , 후처리 --> 오버라이딩 개념이 아님 || 직접 메서드를 만들어 주는 것

@PostConstruct 어노테이션이 컴파일러한테 따로 지시함 init()메서드가 호줄되기 전에 실행

@PreDestroy 어노테이션이 컴파일러한테 따로 지시함 destroy()메서드가 호출된 후에 실행

service()	--> doGet(), doPost()가 없다면 service()가 호출, 세가지 메서드가 모두 존재해도 service가 호출이 됨
	--> (get,post) 어떤 메서드 방식으로 호출 되었는지 알 수 없음 || 잘 사용 안함 

```
```
	HTML form 태그

form태그는 서버 쪽으로 정보를 전달할 때 사용하는 태그

********************************************************************************************************
*			input 태그						*
*										*
*   type : 태그 종류 지정 (text, password,submit,checkbox,radio,reset)			*
*										*
*   name : input태그 이름(servlet으로 전송할 때의 이름, servlet에서도 같은이름 사용 가능	*
*										*
*   value : name에 해당하는 값							*
*										*
********************************************************************************************************

type= text || 일반적인 데이터를 입력하기 위해 사용

type= password || 로그인, 회원가입 페이지 등에서 비밀번호를 입력하기 위해 사용

type= submit || form내의 데이터를 서버쪽으로 전송할 때 사용

type= reset || form내의 데이터를 초기화 할 때 사용

type= checkbox || 데이터 값을 여러 개 전송해야 할 때 사용 ★name의 이름은 동일★ - 실제 서버에 전송 되는 값 value

type= radio || 데이터 값 중 한 개의 값만 전송할 때 사용


	Select -- 리스트형태의 데이터를 사용 [하나만 선택] 
<select>
<option value="aaa" selected="selected"></option>
</select>


	<form action="요청하는 컴포넌트 이름" method="get">
Get: http://IP주소:port번호/컨텍스트/path/MemberJoin?id=abcd&name=mina
Post: http://IP주소:port번호/컨텍스트/path/MemberJoin

Get방식- 보안에 취약 [검색]
Post방식 - 보안에 강함 [중요한 정보]

submit--> Servlet파일 || HttpServletRequest객체를 이용하여 Parameter 값을 얻음

getParameter(name) --> 값 1개

getParameters(name) --> 값이 여러개

getParameterNames() --> form태그에서 넘어온 name값들을 전부 배열로 리턴

*************************************************************************************

		한글처리

Get방식 --> server.xml 수정 || <Connetcrot URIEncoding="utf-8"> || Publish to the Server [ctrl+alt+p]

Post방식 --> 자바코드에서 수정 || request.setCharacterEncoding("utf-8");

-- utf-8 : 3byte , EUC-KR - 2byte --


		Servlet.java 설정

한글 깨짐 방지 (request)   --> request.setCharcaterEncoding("utf-8");

한글 깨짐 방지 (response) --> response.setContentType("text/html; charset="utf-8");

```