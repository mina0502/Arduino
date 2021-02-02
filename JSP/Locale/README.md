		# 다국어 처리의 개요

```

웹 브라우저를 사용하는 국가에 따라 다양한 언어 및 지역을 지원하는 서비스
다른 언어와 지역적 차이를 기술 변경 없이 소프트웨어에 바로 적용하는 것
JSP 페이지에 JSTL의 fmt태그를 이용하면 언어별로 페이지를 따로 만들 필요 없이 간단하게 다국어 지원할 수 있음

다양한 어어와 지역에 적용될 수 있도록 하는 국제화 (i18n)와 언어별 구성요소를 추가하여 특정 지역의 언어나 문화에 맞추는 지역화(L10n)를 포함

```
		##### 지역화

```

사용 국가별 환경에서 특정 언어와 지역에 맞게 적합화하는 것

L10n으로 표기

숫자,날짜,시간의 형식
화폐의 표시
키보드의 지원
문자열의 순서와 정렬
심벌, 아이콘, 색상
문화에 따라 오해의 소지가 있거나 의미가 없는 문자, 그림
지역별 법률의 차이

```
		##### 국제화
```

여러 국가에서 사용할 수 있도록 다국어를 지원하는 것
i18n으로 표기
국제화는 어느 국가에서나 사용할 수 있게 하는 지역화 기능을 포함

국제화 지원은 유니코드의 사용이나 기존의 인코딩을 적절히 처리하고
사용자 인터페이스에 표시할 문자열에는 문자 코드가 포함되지 않도록 설계 및 개발해야함

국제화를 처리하는 정보에 언어 정보를 포함하거나, 세로쓰기/가로쓰기/우측에서 좌측으로의 가로쓰기 등 언어의 특성을 반영하는 처리 등을 지원

날짜와 시간 표시, 지역의 달력, 숫자 표시, 리스트의 정렬과 표시, 인명이나 주소의 처리 등 언어의 특성

사용자의 요청이나 설정에 따라 필요시 사용되도록 지역화 정보를 코드와 분리

```

		## Locale 클래스를 이용한 다국어처리
```

특정 지리적,정치적,문화적 지역을 나타내는 클래스

사용자의 지역 환경에 따라 결정되는 지역적 문화(언어, 날짜, 시간 등)의 정보를 담고 있음

숫자, 날자, 시간 등을 표현

request 내장 객체를 이용하여 현재 웹 브라우저에 미리 정의된 언어나 국가 정보를 가져오는 방법

*****************************************************************************

java.util.Locale.request.getLocale();

*****************************************************************************

JSP페이지에 page 디렉티브 태그의 imoport 속성으로 패키지 java.util.Locale을 설정

```

		##### 로케일 감지하기

```

웹 브라우저에 설정된 국가와 언어 이름을 알아내는 것

메소드 종류

getDefault() - static Locale - 디폴트 로케일의 현재값을 가져옴

getCountry() - String - 현재 로케일의 국가/지역코드(대문자)를 가져옴

getDisplayCountry() - String - 현재 로케일의 국가 이름을 가져옴

getLanguage() - String - 언어 코드(소문자)를 가져옴

getDisplayLanguage() - String - 언어 이름을 얻어옴


```
		##### 로케일 감지 메소드 사용 예
```

Locale locale = request.getLocale();
String displayLanguage = locale.getDisplayLanguage();
String language = locale.getLanguage();
String displayCountry = locale.getDisplayCountry();
String country = locale.getCountry();

*******************************************************************************

		로케일 표현하기

response 내장 객체의 setHeader() 메소드 사용


예))

response.setHeader("Content-Language,"es");
String title= "Espa&ntilde;ol":

*******************************************************************************

		날짜와 시간 설정

<%@ page import="java.text.DateFormat"%>

Locale locale= request.getLocale();
String date = DateFormat.getDateTimeInstance(DateFormat,FULL,DateFormat.SHORT,locale).format(new Date());

*****************************************************************************
		통화와 숫자 설정

Locale locale= request.getLocale();
NumberFormat curency = NumberFormat.getCurrencyInstance(locale);
NumberFormat percentage = NumberFormat.getPercentInstance(locale);
Stirng fcureny = curency.format(1234567);
String fpercentage = percentage.format(0.25);

```
```

요청한 클라이언트의 Locale 정보를 가져오는 코드

Locale locale= request.getLocale();

*****************************************************************

DateFormat클래스는 정해진 포맷을 상수(FULL, LONG, MEDIUM, SHORT)로 제공하고 있는 클래스

DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.FULL,locale);

FULL --> [년 월 일 요일 을 포함]

*****************************************************************

SimpleDateFormat클래스는 DateFormat을 상속받았고 원하는 출력 형태를 직접 지정하고자 할 때 사용

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


*****************************************************************

Locale 클래스의 상수를 이용

Locale locale= Locale.US;	
*****************************************************************

<p>국가 : <%=locale.getDisplayCountry() %> 	|| 국가 코드
<p>국가 : <%=locale.getCountry() %>		|| 국가 이름
<p>국가 : <%=locale.getDisplayCountry() %>
<p>국가언어: <%=locale.getLanguage() %>
<p>국가언어: <%=locale.getDisplayLanguage(locale) %>
<p>언어와 국가: <%=locale.getDisplayName() %> 
<p>날짜 : <%=dateFormat.format(date) %>
<p>날짜 : <%=sdf.format(date) %>
<p>숫자(123456.78) : <%=numberFormat.format(123456.78) %>	|| 결과값 --> 123,456.78

```

			#  JSTL fmt 태그를 이용한 다국어 처리

```
JSTL fmt 태그

다국어 문서 처리를 위한 국제화 및 지역화 태그

날짜와 숫자 등을 형식화하는 기능을 제공하는 JSTL 라이브러리인 JSTL fmt 태그는 특정 지역에 따라 다른 메세지를 출력할 때 사용

 - 한글 웹 브라우저는 한글 메세지를 출력할 때, 영문 웹 브라우저는 영문 메세지를 출려할 때 유용



********************************************************************

JSTL fmt 태그 라이브러리 사용방법

<%@ taglib prefx="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

jstl.jar 파일 필요



***************************************************

 JSTL fmt 태그의 종류


Locale 설정 

setLocale 로케일을 설정

requestEncoding - 요청 파라미터의 문자 인코딩을 설정

****************************************************************

메세지 처리

bundle - 사용할 리소스번들을 설정

message - 리소스번들에서 로케일에 맞는 메세지를 가져와 출력

setBundle - 리소스번들을 읽어와 특정 변수에 저장


******************************************************************

날짜

formatDate - 날짜 형식을 표현

parseDate - 문자열에서 원하는 패턴의 날짜 형식으로 변환

******************************************************************

숫자

parseNumber - 문자열에서 원하는 패턴의 숫자 형식으로 변환

formatNumber - 숫자 형식을 표현

******************************************************************

시간

setTimeZone - 특정 범위의 시간대를 설정

timeZone - 시간대를 설정

```

		## 메세지 처리 태그의 기능과 사용법

```

리소스번들

- 메세지 처리 태그에서 사용하는 파일로 메세지 번들이라고 함

WEB-INF/classes 폴더에 있음

- 리소스번들은 java.util.Properties클래스에 정의된 방법으로 메세지를 읽어오기 때문에 확장자가 properties인 파일이 반드시 있어야 함

 java.util.Properties 클래스는 알파벳이나 숫자, 라팅 문자 외의 언어를 유니코드 값으로 표현

리소스번들로 사용하는 *.properties 파일의 종류

파일이름.properties - 기본메세지
파일이름.ko.properties - 한글메세지
파일이름.en.properties - 영어메세지


```
```

*.properties 파일의 내용은 한글로 입력하면 안됨, 유니코드로 입력
한글자씩 입력할 때 마다, 유니코드를 찾아야하는 불편함이 발생
ResourceBundle Editor가 그 불편함을 해소해주기에 이클립스에서 플러그인을 설치

```

```

fmt태그 라이브러리를 사용하기 위해 페이지 지시자를 통해 uri를 설정

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 가져올 번들을 resourceBundle변수에 저장

<fmt:setBundle basename="bundle.myBundle_ko" var="resourceBundle"/>



<p>제목 :<fmt:message key="title" bundle="${resourceBundle}"/>


 userame의 키를 주면 value값 관리자를 리턴하는데 그 값을 user변수에 저장하고 있음

<p><fmt:message key="username" var="user"  bundle="${resourceBundle}"/>
	이름: ${user}


 로케일 지정

<fmt:setLocale value="en"/>



천단위 구분자 : groupingUsed || 기본적으로 groupingUsed속성이 true로 되어 있어 천자리에 ,로 구분
<p>숫자: <fmt:formatNumber value="4545000" groupingUsed="false" />


setLocale태그를 이용하여 로케일을 정해주면 그에 맞는 숫자,통화가 그 로케일에 맞게끔 출력이 됨

<fmt:setLocale value="en_US"/>



minIntegerDigits 은 최대 자릿수를 의미
minFractionDigits 은 소수점자리를 나타냄

<p><fmt:formatNumber value="4545000" minIntegerDigits="10" minFractionDigits="2" />


pattern은 자릿수를 계산 [0 은 유효숫자(자리수를 차지), #은 있으면 출력, 없으면 출력하지 않음]

<p><fmt:formatNumber value="4545000.12" pattern=".###"/>



jsp:useBean액션태그를 이용하여 Date객체를 생겅하고 now를 참조변수로 만드는 코드

<p><jsp:useBean id="now" class="java.util.Date"/>

```
