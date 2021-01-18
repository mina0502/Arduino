```
Servlet --> MVC 패턴에서 컨트롤러로 웹을 구성

JSP --> Java Server Page 서버에서 움직이는 동적 스크립트 

request -> response(html형식)

JSP --> 	HTML코드 안에 자바코드 삽입 할 수 있도록 함 
	html로 출력 스트림을 쓰지 않고 서버에서 만들어줌
	MVC패턴에서 View단에서 사용됨

```

```
		JSP 등장 배경

서블릿으로 화면 구현 시 문제점

- 기존 서블릿에서는 자바 코드를 기반으로 문자열을 사용해 HTML과 자바스크립트로 화면을 구현

- JSP는 HTML,CSS, JS기반으로 JSP 요소들을 사용해 화면을 구현함

```

```
문제점

웹프로그램의 화면 기능이 복잡해져 서블릿의 자바 기반으로 화면 구현 시 어려움 발생

디자이너 입장에서 화면 구현 시 자바 코드로 인해 작업이 어려워짐

서블릿에 비즈니스 로직과 화면 기능이 같이 있어 개발 후 유지관리가 어려움

해결책

서블릿의 비즈니스 로직과 결과를 보여주는 화면 기능을 분리

비즈니스 로직과 화면을 분리함으로써 개발자는 비즈니스 로직 구현에 집중하고, 디자이너는 화면 기능 구현에만 집중

개발 후 재사용성과 유지관리가 훨씬 수월해짐

```

```
		JSP 구성요소

HTML, CSS, JS

JSP기본 태그

JSP 액션 태그

Framwork에서 제공하는 커스텀(custom)태그

```

```
	JSP태그 개념 이해

Servlet은 JAVA언어를 이용하여 문서를 작성, 출력 객체(PrintWrite)를 이용하여 HTML코드 삽입

JSP는 Servlet과 달리 HTML코드에 JAVA언어를 삽입하여 동적 문서를 만들 수 있음

```

```
	JSP태그 종류

지시자  -->  <%@ %> : 페이지 속성 (ex. import)

주석 --> <%-- --%> : HTML주석 소스보기 하면 보임 || JSP 주석은 안보임

선언 --> <%! %> : 변수, 메서드 선언 (전역)

표현식 --> <%= %> : 결과값 출력

스크립트립 --> <% %> : JAVA코드(가장 많이 사용됨)

액션태그 :<jsp:action> </jsp:action> : 자바빈(클래스) 연결 [DTO]

```
```

JSP- View || Servlet- Controller
HTML태그를 이용해 화면 구성이 쉬움
서블릿 -> 자바코드로 되어 있어 로직 수행코드가 들어감으로써 Controller역할을 함

```
```
		JSP 3단계 작업 과정

톰캣 컨테이너에서 JSP 변환 과정

1. 변환단계 (Translation Step) : JSP파일을 자바 파일로 변환

2. 컴파일 단계(Compile Step) : 변환된 java파일을 class 파일로 컴파일

3. 실행 단계(interpret Step): class파일을 실행하여 결과를 브라우저로 전송해 출력

```

```
JSP가 요청되어 응답하기까지

클라이언트가 웹브라우저로 helloWorld.jsp를 요청할 경우 WAS의 JSP컨테이너가 JSP파일을 Servvlet파일로 자동변환

변환된 Servlet파일은 컴파일 된 후 class파일로 변환되고 클라이언트한테 html파일 형태로 응답

스레드를 생성해서 클라이언트에게 응답 || 재요청시 스레드 이용 || 처음만 서블릿과 JSP의 속도차이가 있지만 이후 거의 동일

JSP -> Servlet ->class -> HTML

```

```
<%@ page 페이지 지시자, 페이지의 속성 import할 때 자주 사용함 %>

실제 HelloWorld_jsp.java, HelloWorld_jsp.class확인하는 경로
workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\프로젝트명\org\apache\jsp
```

```
	JSP내부 객체

개발자가 객체를 생성하지 않고 바로 사용할 수있는 객체

JSP에서 제공되는 내부객체는 JSP컨테이너에 의해 Servlet으로 변화 될 때 자동으로 객체가 생성됨

웹 컨테이너에 의해 자동으로 구현되며 import나 객체 선언 없이도 자유롭게 접근 가능

***************************************************************************

입출력 객체 : request, response, out
서블릿 객체 : page, confing
세션 객체 : session
예외 객체 : exception

**************************************************************************

request -> 클라이언트의 요청 정보를 저장

response -> 응답 정보를 저장

out -> JSP 페이지에서 결과를 출력

session -> 세션 정보를 저장
  
application -> 컨텍스트 정보를 저장

pageContext -> JSP 페이지에 대한 정보를 저장

page -> JSP 페이지의 서블릿 인스턴스를 저장

config -> JSP 페이지에 대한 설정 정보를 저장

exception -> 예외 발생 시 예외를 처리

```

```
	스크립트릿, 선언, 표현식

스크립트릿 - JSP페이지에서 JAVA언어를 사용하기 위한 요소 중 가장 많이 사용되는 요소 || <% %>

선언 - JSP페이지 내에서 사용되는 변수 또는 메서드를 선언 할 때 사용 || 선언된 변수 및 메소드는 전역 의미로 사용

표현식 - JSP페이지 내에서 사용되는 변수의 값 또는 메소드 호출 결과값을 출력하기 위해 사용 ||String 타입, ';'을 사용하지 않음

```
```
		지시자

JSP페이지의 전체적인 속성을 지정할 때 사용|| 언어, import문 많이 사용

page,include,taglib가 있고 <%@ 속성 %>형태로 사용됨

page지시자 - 기본값을 많이 이용

include지시자 - 홈페이지의 경우 반복되는 것, 머리말이나 아랫말에 표시되는 것들은 include지시자를 이용

taglib지시자 - 사용자가 만든 tag들을 태그 라이브러리라고 함, 태그라이브러리를 사용하기 위해 taglib지시자를 사용
uri 및 prefix 속성이 있음 (uri -태그라이브러리의 위치 값, prefix- 태그를 가리키는 이름 값)

********************************************************************
		주석
프로그램 설명들의 목적으로 사용되는 태그

HTML 주석 <!-- -->

JSP 주석 <%-- --%>

```

```
스크립트릿 안에 들어가는 자바코드는 html 소스보기에서 보이지 않음

<%! %> ==> 선언부는 전역의 성질을 가지고 있음
```
```
		page지시자

language 속성: 스크립트요소에서 사용할 언어 설정 || JSP를 지원하는 언어 - java

extends 속성: 상송받을 클래스를 설정

import 속성: import할 패키지, 클래스를 설정

session 속성: HttpSession 사용 여부를 설정

buffer 속성: JSP페이지에서 출력 버퍼 크기를 설정

autoFlush 속성: 버퍼가 꽉 찼을 경우 처리방법 설정

isThreadSafe 속성: 다중 스레드의 동시 실행 여부 설정

info 속성: 페이지 설명

contentType 속성: JSP페이지가 생성할 문서의 타입을 지정

isErrorPage 속성:  현재 페이지를 에러페이지로 지정할 것에 대한 설정

PageEncoding 속성: 현재 페이지의 문자의 인코딩타입 설정
 
**********************************************
	html내에서 meta태그

http-equiv="Content-Type"

content="text/html; charset=UTF-8"
```
```
	<%@ include%>

include페이지 지시자를 이용해서 include.jsp를 포함시킴
```

```
	유효성 검사

 if(user_id==null||user_id.length()==0||user_pw==null||user_pw.length()==0) 

```

```

	input 태그 내에서 사용할 경우
<script>
function checkNumber(event) {
	if(event.keyCode >=48&& event.keyCode<=57)
		{
		return true;
		}
	else
		{
		return false;
		}
	}
</script>

<input type=" " name=" " onkeypress="return checkNumber(event)">

```