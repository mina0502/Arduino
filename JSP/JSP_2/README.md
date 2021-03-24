```

	request 객체 상세

웹브라우저를 통해 서버에 어떤 정보를 요청하는 것 // 요청 정보는 request객체가 관리

JSP페이지는 웹컨테이너에 의해 서블릿 객체로 변환

객체 중 request와 response객체가 사용자와의 요청 및 응답에서 사용 -->JSP내장객체 || import 없이 사용가능

Request객체 관련 메소드

getServerName(): 서버 이름을 얻음

getServerPort(): 서버 포트번호를 얻음

getContextPath(): 웹어플리케이션의 컨텍스트 패스를 얻음 || 웹어플리케이션의 경로

getMethod(): get방식과 post방식을 구분할 수 있음 || 메서드 방식 구분

getSession(): 세션 객체를 얻음 || 클라이언트와 서버의 관계를 유지하는데 중요한 역할 [Session_id 부여, 시간제한]

getProtocol(): 해당 프로토콜을 얻음 || 프로토콜(통신 규약)

getRequestURL(): 요청 URL을 얻음 || 인터넷, 웹

getRequestURI(): 요청 URI를 얻음 || 파일까지 지칭할 수 있음

getQueryString(): 쿼리 스트링을 얻음 

********************************************

Parameter 메서드 중요, 많이 사용, 서블릿과 유사함

getParameter(String name): name에 해당하는 파라미터 값을 구함

getParameterNames(): 모든 파라미터 이름들을 구함

getParameterValues(String name): name에 해당하는 파라미터값들을 구함

```

```
	response 객체 상세

요청에 응답하는 것 -> response의 정보를 가지고 있는 객체
HTTP응답 헤더 정보를 설정하거나 쿠키를 추가하고 페이지를 리다이렉트하는 등의 기능을 사용할 수 있음

response객체 관련 메소드

setHeader(String headerName, String headerValue): 응답에 포함될 헤더 정보 설정

setCharacterEncoding(): 응답할 때 문자의 인코딩 형태를 구함

addCookie(Cookie cookie): 쿠키를 지정

sendRedirect(String Url): 지정한 URL로 이동(포워딩 기능, 다른 페이지에서 처리하게 함)

```
```
	쿠키

웹브라우저에서 서버로 어떤 데이터를 요청하면, 서버 측에서는 알맞은 로직을 수행한 후 데이터를 웹브라우저에 응답
서버는 웹브라우저와의 관계를 종료 (무상태 서버, 무상태 로직) || 서버 저장안함

웹브라우저에 응답 후 관계를 끊는 것 --> http프로토콜의 특징

연결이 끊겼을 때 정보를 지속적으로 유지하기 위한 수단으로 사용

쿠키는 서버에서 생성, 클라이언트 측에 특정 정보를 저장

서버에 요청 할 때마다 쿠키의 속성 값을 참조, 변경할 수 있음


서버 생성 -> 클라이언트 전송 [저장]

*******************************************************************************
	
	쿠키 메소드

setMaxAge(int seconds): 쿠키 만료기간을 설정

setpath(): 쿠키사용의 유효 디렉토리 설정

★setValue(String value): 쿠키의 값을 설정

setVersion(): 쿠키 버전을 설정

getMaxAge(): 쿠키 만료기간 정보를 얻음

getName(): 쿠키 이름을 얻음

getPath(): 쿠키사용의 유효 디렉토리 정보를 얻음

★getValue(): 쿠키의 값을 얻음 

getVersion(): 쿠키 버전을 얻음

```

```
	현재 페이지에서 다른 페이지로 데이터를 넘기고 싶을 경우 한글일 경우를 대비해서 인코딩을 다시하기

request.setCharacterEncoding("utf-8");
String name= request.getParameter("name");
String strScore= request.getParameter("score");

*******************************************************************
[GET 방식]

String encodeName = URLEncoder.encode(name,"utf-8");
int score= Integer.pareseInt(strScore);

[POST 방식]

pageContext.getSession().setAttribute("name", name);
pageContext.getSession().setAttribute("score", strScore);

```

```
	
	Cookie 요청 들어오는 쿠키들의 값들을 받음
	Cookie[] cookies = request.getCookies();
	
	for(int i=0; i<cookies.length;i++)
	{
		String name=cookies[i].getName();
		String value=cookies[i].getValue();

	if(name.equals("abcde")){
		out.println("cookies["+i+"] name :"+name);
		out.println("<br/>");
		out.println("cookies["+i+"] value :"+value);
		cookies[i].setMaxAge(0); || 유효기간을 0초로 설정하여 삭제하는 효과와 동일
		
		response.addCookie(cookies[i]); || 쿠키의 수정이 있었으므로 다시 response객체에 추가
	}
	남아있는 쿠키값 --> 이름과 값 무시

	쿠키를 생성하고 response객체에 탑재를 해주어야함
	변경이 있을 경우 response 객체에 탑재해야함
	==> 쿠키값이 일관성있게 유지가 됨
	}
```

```
	Cookie 탑재

Cookie cookie= new Cookie("id","pw"); || 쿠키의 이름 =id, 값 =abcde

```

```
	Login_Fail

JS의 alert함수를 이용하여 메세지 창을 띄우고 다시 login.html파일로 이동

	alert('로그인 실패');
	location.href="login.html"

```
```
		세션

쿠키와 마찬가지로 서버와의 관계를 유지하기 위한 수단

단, 쿠키와 달리 클라이언트의 특정 위치에 저장되는 것이 아니라, 서버 상에 객체로 존재

||	쿠키와 차이점 	||

1. 쿠키는 로컬PC 폴더에 저장되기 때문에 보안에 취약

2. 세션은 서버에 객체로 존재, 보안에 강함, JSP를 통해서만 접근 가능, 용량 제한 없음 || 여러 클라이언트가 접속하므로 한 클라이언트에 하나의 세션을 생성하고 고유 값을 가지고 있음
(JSP 컨테이너가 자동 생성)

< 로그인 정보나 사용자 환경설정, DB커넥션 등 정보를 유지하는 것들에 사용>

*********************************************************
HTTP프로토콜은 웹에서 텍스트, 이미지, 사운드등의 파일을 주고 받기 위한 규약
HTTP프로토콜은 데이터를 요청하고 결과값을 받게 되면 연결이 바로 종료되는 특징이 있음
*********************************************************

세션은 클라이언트의 요청이 발생하면 자동 생성 (JSP컨테이너 = 서블릿)
session이라는 내부 객체를 지원하여 세션의 속성을 설정할 수 있음

클라이언트 요청(웹 브라우저) --> session 자동 생성(JSP컨테이너[서블릿]) --> Session 속성 설정(session 내부 객체의 메소드 이용)

```
```
	Session 메소드

★setAttribute(String attrName, Object attrValue): 세션에 데이터를 저장

★getAttribute(String attrName): 세션에 파라메터로 지정된 이름의 속성 데이터 값을 얻음

getAttrubuteNames(): 세션에 저장되어 있는 모든 데이터의 이름(유니크한 키 값)얻음

★getId(): 자동 생성된 세션의 유니크한 아이디를 얻음(각 브라우저에 해당하는 값)

isNew(): 세션이 최초 생성되었는지, 이전에 생성된 세션인지 구분

setMaxInactiveInterval(int second) : 세션의 유효시간을 설정한다

getMaxInactiveInterval(): 세션의 유효시간을 얻음 || 가장 최근 요청시점을 기준으로 카운트

removeAttribute(String attrName): 세션에서 특정 데이터(파라메터 값)제거 || 세션을 제거하는게 아닌 값을 삭제

★invalidate(): 세션의 모든 데이터를 삭제 <ex. 로그아웃>

```
```
		예외 페이지

JSP, Servlet에서도 예외가 발생 할 수 있음
예외처리(JSP/Servlet)목적 : 딱딱한 에러 페이지를 보다 친근한 느낌이 느껴지는 페이지로 유도 할 수 있음

1. 페이지 지시자를 이용
2. web.xml파일을 이용

*******************************************

	페이지 지시자

<%@ page errorPage="errorPagge.jsp"%> 
		↓
<%@ page isErrorPage="true"%> 
<% response.setStatus(200);%>
<%=exception.getMessage()%>

*******************************************

	web.xml파일

<error-page>
	<error-code>404</error-code>
	<location>/error404.jsp</location>
</error-page>

<error-page>
	<error-code>500</error-code>
	<location>/error500.jsp</location>
</error-page>

|| 에러발생시 각 페이지로 이동

```

```

스크립트릿으로 내부객체인 session객체를 이용하여 값을 설정
현재 이 jsp파일이 서버에 요청을 하게 되면 컨테이너가 서블릿 변환되면서 session객체가 자동으로 생성되면서 컴파일이이루어짐
session.setAttribute(세션의 이름, 세션의 데이터)	

Object obj1 = session.getAttribute("abcde");
	Integer IntValue =(Integer)obj1;
	out.println("abced : "+ IntValue);

하나의 Name을 주고 Value를 얻어서 출력 
session getAttribute()의 반환타입 ->Object
|| Integer형으로 강제 다운 캐스팅

```

```
getAttributeNames()의 반환값 Enumeration<String> 열거형 제네릭 타입

String만 받도록 제네릭 타입을 설정함

getAttributeNames() 메서드는 세션에 설정되어 있는 모든 Name값을 얻어옴 

sessionID는 웹브라우저 하나당 생기는 고유한 값 || 서버에서 생성해줌

```


```
	★session★

설정 - session.setAttribute("ID","DATA")

얻기 - session.getAttribute() [1개]  || Enumeration<String> en - session.getAttributeNames() [여러개]

유효시간 - 기본적으로 30분 || Server의 web.xml파일로 설정가능

삭제 - session.removeAttribute("ID") [ 세션의 특정한 값을 삭제하는 코드 ] || session.invalidate() [세션의 모든 값을 지움]

세션확인 - request.isRequestedSessionIdValid() || 세션id 값이 있는지 확인

```

```
	Session 과 Cookie의 차이점

Cookie - 로컬PC에 저장되기 때문에 보안에 취약

Session - 서버에 객체로 존재함으로 보안에 강함 || JSP를 통해서만 접근이 가능  (여러클라이언트가 접속하므로 한 클라이언트에 하나의 세션을 생성, 세션ID를 부여/ 세션 ID를 가지고 구분)


```

```
	<%@ page errorPage="JSP파일명"%>
현재 페이지에서 예외가 발생을 하면 페이지 지시자에 있는 속성 중 errorPage로 설정한 페이지로 이동하라는 지시자의 내용

	<%@page isErrorPage="true"  %>
페이지 지시자를 이용해서 isErrorPage속성을 true로 설정 해줘야 exception객체를 참조하여 예외 메세지 활용 가능

response.setStatus(200) || 정상적인 페이지
```
