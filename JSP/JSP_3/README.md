```
	액션태그 
JSP페이지 내에서 어떤 동작을 하도록 지시하는 태그(흐름 제어기능)

forwad(이동), include(포함),param(데이터 넘기기), bean(클래스파일)


	forward태그
(pageContext내장객체의 forward()가 태그로 구현) -- 도메인 주소 안바뀜


	include태그

현재페이지에 다른 페이지를 삽입할 때 사용

HTML, JSP, 서블릿 페이지

page 속성 값은 현재 JSP페이지 내에 포함할 내용을 가진 외부 파일명


***************************************************************************

구분		include 액션태그		include 디렉티브 태그

처리시간 		요청 시 자원을 포함	번역시 자원을 포함

기능		별도의 파일로 요청 처리	현재페이지에 삽입

데이터전달	request, param을 통한	페이지 내의 변수를 선언 후 
			파라미터			변수에 값을 저장

용도		화면 레이아웃의 일부분 	다수의 JSP웹 페이지에서 공통으로 사용되는 코드
		모듈화할 때 사용		저작권과 같은 문장을 포함하는 경우

기타		동적페이지		정적페이지

*********************************************************************************

	param 액션태그

forward 및 include 태그에 데이터 전달을 목적으로 사용되는 태그 || 이름과 값으로 이루어짐

<jsp:forward>나 <jsp:include>태그 내부에 사용
다른 페이지에 여러 개의 정보를 전송해야 할 때는 다중의 param액션 태그를 사용

	액션태그의 종류

★forward	- 다른 페이지로의 이동과 같은 페이지흐름을 제어

★include	- 외부 페이지의 내용을 포함하거나 페이지를 모듈화

★useBean	- JSP페이지에 자바빈즈를 설정

★setProperty - 자바빈즈의 프로퍼티 값을 설정

★getProperty - 자바빈즈의 프로퍼티 값을 얻어옴

★param - <jsp:forward>,<jsp:include>,<jsp:plugin>태그에 인자를 추가

plugin - 웹 브라우저에 자바 애플릿을 실행 

element - 동적 XML 요소를 설정

attribute - 동적으로 정의된 XML 요소의 속성을 설정

body - 동적으로 정의된 XML 요소의 몸체를 설정

text - JSP페이지 및 문서에 템플릿 텍스트를 작성

```
```
	템플릿 페이지

웹사이트의 좌측이나 상단메뉴(네비게이션 바) 등 고정된 레이아웃 패턴을 작성하고 다른 페이지에서 반복적으로 사용

```
```
forward --> main.jsp 에서 sub.jsp 로 이동시킬경우 || main.jsp의 태그부분 잠시 출력되지만 육안으로 확인 불가

forward액션태그는 URL주소는 main.jsp로 변하지 않고 페이지 이동만 일어나서 보여주는 페이지가 sub.jsp페이지가 됨

response.sendRedirect("sub.jsp") || url 주소가 변함

forward액션태그를 이용하고 그 안에서 jsp:param액션태그를 이용하여 파라메터들을 전달
페이지 이동에 있어서 내부객체인 request객체는 서로 공유하기 때문에 forward_param_result.jsp 페이지에서는
request를 이용하여 아래의 파라메터값을 참조하면 됨

<jsp:forward page="forward_param_result.jsp">
	<jsp:param value="abcde" name="id"/>
	<jsp:param value="12345" name="pw"/>
</jsp:forward>


forward액션태그를 이용해서 forward_form.jsp에서 form태그로 요청한 hidden속성을 지정한 값으로
페이지 이동으로 시키고 있음 || param 액션태그를 이용해서 tel값을 넘기고 있음
값을 가져가기 위한 스크립트릿 양옆에 '' 로 감싸야함

***************************************

폼태그를 이용해서 데이터를 전송하면 URL이 바뀌고, forward 액션태그를 이용하면 URL이 바뀌지 않음
forward액션태그는 제어권을 포워딩되는 페이지로 완전히 넘기고 그 페이지의 실행이 끝나면 모든 응답을 종료

```
```
<%@include%> 페이지 지시자를 이용한 것

<jsp:include page=""> 액션태그를 이용한 것 flush  속성 true로 설정시, 포함될 페이지로 이동하기 전에 버퍼를 비움

include 액션태그는 여러 페이지를 동적으로 하나의 페이지로 묶을 수 있음 
-각각의 페이지를 기능별로 모듈화 가능 (템플릿 페이지)

	차이점

페이지 지시자 : 소스코드가 텍스트로 포함이 되어짐 || 조각 코드를 삽입할 용도로 많이 사용함


```

```
width : 너비

height : 높이

align : 정렬

valign: 수직 정렬
```