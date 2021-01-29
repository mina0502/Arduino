		# EL  태그 
```
Expression Language - 표현식, 액션태그를 대신해서 값을 표현하는 언어

표현식 : <%= value%> --------------> EL : ${value}


```

	##### EL 연산자

```

산술 : +, -, *, / ,%

관계: ==, !=, <, >, <=, >=

조건 : a? b : c

논리 : &&, ||

```

		# 액션태그로 사용되는 EL
```

<jsp:getProperty name="member" property="name"/>  
			
			↓
		${member.name}


```

		# EL 내장객체

```

pageScope - page 객체를 참조하는 객체

requestScope - request 객체를 참조하는 객체

sessionScope - session 객체를 참조하는 객체

applicationScope - application 객체를 참조하는 객체

param - 요청 파라미터를 참조하는 객체

paramValues - 요청 파라미타(배열)를 참조하는 객체

initParam - 초기화 파라미터를 참조하는 객체

cookie - cookie객체를 참조하는 객체

```

		# JSTL
```

JSP Standard Tag Library


JSP의 경우 HTML태그와 같이 사용되어 전체적인 코드의 가독성이 떨어짐

단점을 보완하기위해 만들어진 태그 라이브러리 JSTL 

[사이트](http://jakarta.apache.org)

```
		### JSTL 라이브러리
```

Core - c - <c:tag

XML Processing - x - <x:tag

I18N formatting - fmt -<fmt:tag

SQL - sql - <sql:tag

Functions - fn - <fn:function()


**********************************************************

Core - 기본적인 라이브러리로 출력, 제어문, 반복문 같은 기능이 포함되어 있음
	<%@ taglib uri=http/java.sun.com/jsp/jstl/core prefix="c"%>

	
			출력태그
	<c:out value="출력값" default="기본값" escapeXml = "true or false">


			변수 설정 태그
	<c:set var="변수명" value="설정값" target="객체" property="값" scope="범위">

			변수 제거 태그

	<c:remove var="변수명" scope="범위">

			예외 처리

	<c:catch var="변수명">


			제어문 if

	<c:if test="조건" var="조건 처리 변수명" scope="범위">

			제어문 switch

	<c:choose>
	<c:when test="조건">처리내용</c:when>
	<c:otherwise> 처리 내용</c:otherwise>
	</c:choose>

			반복문

	<c:forEach items="객체명" begin="시작 인덱스" end="끝 인덱스" step="증감식" var="변수명" varStatus="상태변수">
			

			페이지 이동

	<c:redirect url="url">


			파라미터 전달

	<c:param name="파라미터명" value="값">

```
```
 	실제로 EL태그는 몰라도 상관없음
개발하는데 있어서 타인이 개발한 내용을 읽을 줄 알면 됨

EL태그를 잘 이용할 시 코드의 양이 줄어들고 가독성도 높일 수 있음

```

```
Core태그 라이브러리를 사용하기 위해서 반드시 선언을 해야함

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	

	Core태그 중 set(변수값 저장) 

var - 변수이름 | value - 변수에 저장되는 값 | scope - 범위지정

<c:set var="id" value="miyamoto" scope="page"/>

|| el 태그를 이용하여 저장
<c:set var="name" value="${'美奈'}}" scope="page"/>
<c:set var="age" value="${21}" scope="page"/>
<c:set var="height" value="${175}" scope="page"/>

```

```
ContextPath : 웹 어플리케이션 이름

pageContext내장객체를 이용하여 컨텍스트 이름(웹프로젝트 이름)을 변수contextPath에 미리 저장해 둘경우
경로를 설정하거나 경로 관련된 부분에 쉽게 적용할 수 있음

<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="application"/>

```

```
	useBean 액션태그를 이용하여 컬렉션 객체들을 가져옴

<jsp:useBean id="memberList" class="java.util.ArrayList"/>
<jsp:useBean id="memberMap" class="java.util.HashMap"/>

HashMap - 저장 : put

```
```

${empty name }  와 ${name==null}은 같음

★JSTL태그 라이브러리에서 특히 choose태그 구문내에서는 인식하는 주석문은 <%-- --%> 만 주석으로 인정★


	List<String> dataList = new ArrayList<>(); // 인터페이스의 다형성

```
			# forEach
```
	var: 변수이름, items: 반복할 객체이름, begin: 시작값, end: 종료값, step: 증감식 varStatus: 반복 상태 속성

**************************************************************************************
			varStatus속성 

index: 0부터 시작하고 items에서 정의한 항목을 가르키는 번호

count: 몇 번째 반복인지 나타내는 속성으로 1부터 시작

first: 첫 번째 반복인지 확인

last: 마지막 반복인지 확인

```
			### 구분자(delims)
```
	콤마를 이용하여 문자열을 분리해 출력

<c:set var="car" value="소나타, 그랜져, SM7, 아반떼"/>
	<c:forTokens var="token" items="${car}" delims=",">
		${token }<br/>
	</c:forTokens>

```
		# url 태그
```

var은 url 변수명 , value는 페이지의 url값을 설정

|| Get방식으로 넘어감..
<c:url var="url" value="PersonInfo_foreach_bean.jsp">
	<c:param name="id" value="Mina"></c:param>
	<c:param name="pw" value="1234"></c:param>
	<c:param name="name" value="美奈"></c:param>
	<c:param name="email" value="Test@test.com"></c:param>
</c:url>

|| 전달할 파라메터 값을  param태그를 이용해서 페이지 이동을 할때 사용할 수 있음

```
			# out태그
```

value는 출력값, default는 value에 지정된 값이 존재하지 않을 때 출력할 기본값,
exscaleXml는 escape문자를 변환여부 지정

	<td><c:out value="&lt" escapeXml="true"/></td>	||  &lt로 출력
	<td><c:out value="&lt" escapeXml="false"/></td>	||  < 로 출력
	<td><c:out value="&gt" escapeXml="true"/></td>	||  &gt로 출력
	<td><c:out value="&gt" escapeXml="false"/></td>	||  > 로 출력


```


```

<style type="text/css">
	.lst_type{
	overflow: hidden; 	|| 컨텐츠(이미지)의 요소가 너무커서 요소 내에 모두 보여주기 힘들 때 보여줄것을 결정
			|| visible : 기본값  , hidden: 넘치는 부분은 잘라냄
	}
</style>

```
