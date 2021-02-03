			# 시큐리티의 개요
```

허가된 사용자만이 특정 웹 페이지에 접근할 수 있도록 제한하는 보안 기능

사용자가 권한이 없는 데이터에 접근하는 것을 막거나 웹 공격자가 전송데이터를 중간에 가로채는 것을 방지하는 등 중요한 역할


인증(authentication)

- 사용자가 웹 브라우저를 사용하여 웹 페이지에 접근할 때 JSP 컨테이너는 요청된 페이지에 보안 제약이 있는지 확인하고 사용자에게 사용자의 이름과 암호를 확인하여 수행

권한 부여(authorization)

- 특정 사용자가 해당 페이지에 접근할 수 있는지 확인하여 승인


시큐리티 처리 방법


선언적 시큐리티 - 코드 작성 없이 web.xml 파일에 보안 구성을 작성하여 사용자의 인증을 수행하는 방식

프로그래밍적 시큐리티 - request 내장 객체의 메소드를 통해 사용자의 권한 부여를 처리하는 프로그래밍 방식

```


		### 웹 서버에 역학과 사용자 구성

```

/톰캣 루트 / conf/ 폴더 내 tomcat-users.xml 파일

2개의 역할 tomcat, tole1을 가지고
3개의 사용자 tomca, both, role1이 서로 다른 역할에 매핑


**********************************************


<tomcat-users>
<role rolename="tomcat"/>
<role rolename="role1"/>
<user username="tomcat" password="<must-be-changed>" roles="tomcat"/>
<user username="both" password="<must-be-changed>" roles="tomcat,role1"/>
<user username="role1" password="<must-be-changed>" roles="role1"/>
</tomcat-users>

기존 인증 정보와 새로운 인증 정보를 추가하는 예


<tomcat-users>
<role rolename="tomcat"/>
<role rolename="role1"/>
<user username="tomcat" password="<must-be-changed>" roles="tomcat"/>
<user username="both" password="<must-be-changed>" roles="tomcat,role1"/>
<user username="role1" password="<must-be-changed>" roles="role1"/>
<role rolename="manager"/>
<user username="admin" password="admin1234" roles="manager"/>
</tomcat-users>

```

			# 선언적 시큐리티 처리
```

웹 어플리케이션 배포 설명자 web.xml 파일에 보안 구성을 작성하여 수행하는 방식

웹 어플리케이션의 보안을 달성하기 위해 별도의 코드를 작성할 필요 없이
web.xml파일에 보안 구성을 작성하여 사용자가 웹 페이지에 접근할 수 있게함

web.xml 파일에는 보안 역할, 보안 제약 사항, 인증 처리 등을 설정하여 보안을 구성


		시큐리티 역할 설정

	<security-role>
		<role-name>역할 이름</role-name>
	</security-role>


	<security-role> 사용 예

	<security-role>
		<role-name>manager</role-name>
	</security-role>
	<security-role>
		<role-name>employee</role-name>
	</security-role>


************************************************************************************

		시큐리티 제약 사항 설정

 사용자의 요청 URL에 대한 접근 권한을 정의하는데 사용

 web.xml 파일에 접근 권한 내용을 구성

	<security-constraint>
		<web-resource-collection>....</web-resource-collection>
		<auth-constraint>....</auth-constraint>
		<user-data-constraint>...</user-data-constraint>
	</security-constraint>

************************************************************************************
<web-resource-collection> - 웹 자원에 대한 접근을 설정

<auth-constraint> - 웹 자원에 접근할 수 있는 인증된 사용자를 설정

<user-data-constrain> - 데이터 전송 시 데이터 보호를 설정


	<web-resource-collection> 요소

 웹 자원에 대한 접근을 설정하는 요소

 <url-pattern>, <http-method>,<web-source-name>등의 하위 요소로 구성


<web-source-name> - 웹 자원의 이름을 설정하며 생략할 수 있음

<url-pattern> - 접근 제한을 요청할 URL 목록을 설정, 자원에 대한 접근을 제한하지 않는 경우 생략할 수 있음

<http-method>또는 <http-method-omission> http 메소드를 설정함(GET 또는 POST)


		<web-resource-collection> 요소 사용 예
	
	<security-constraint>
		<web-resource-collection>
			<web-resource-name>WebMarket</web-resource-name>
			<url-pattern>cart/*</url-pattern>
		</web-resource-collection>
	</security-constraint>

리소스명 : WebMarket
url-pattern : cart/*  

사용자가 http://localhost:8080/WebMarket/index.jsp 로 접근하면 누구든지 접근 가능하지만
http://localhost:8080/WebMarket/cart/index.jsp은 권한이 있는 사용자만 가능하다고 설정

```
```
	<auth-constraint>를 구성하는 하위 요소

<description> - 권한 부여 제약 사항에 대한 설명을 기술

<role-name> - 권한이 부여된 사용자의 이름을 대문자와 소문자를 구분하여 설정, 이때 반드시 tomcat-users.xml에
		등록된 역할과 사용자여야함
		모든 사용자에게 권한을 부여하려면 *로 표시
		<role-name>요소를 생략하면 <url-pattern>요소에 설정된 접근 제한 URL에 대한 사용자의 요청을 허용하지 않음
```

```
	<user-data-constaint> 요소

 클라이언트와 서버 간에 데이터를 전송할 때 데이터를 보호하는 방법을 설정하는 요소

<user-data-constaint>
	<transport-guarantee>NONE/INTEGRAL/CONFIDENTIAL</transport-gurantee>
</user-data-contraint>



NONE - 기본 데이터를 보호하지 않겠다는 의미

INTEGRAL - 전송 중 데이터가 변경되지 않았음을 보장한다는 의미

CONFIDENTIAL - 전송중 데이터를 아무도 훔쳐보지 않았음을 보장한다는 의미


		<user-data-constraint>
		
		<security-constraint>
			<user-data-constraint>
				<transport-guarantee>CONFIDENTIAL</transport-guarantee>
			</user-data-constraint>
		</security-constraint>

```
		### 시큐리티 인증 설정
```

	인증 처리를 위한 로그인 페이지나 오류 페이지를 호출하는 데 사용

	web.xml 파일에 인증 관련 내용을 구성


<auth-method>  - 웹 자원에 대한 인증 처리 방식을 설정
<realm-name> - 웹 자원에 접근할 수 있는 인증된 사용자를 설정
<form-login-config> - 데이터 전송 시 데이터 보호를 설정



<auth-method> 요소

웹 어플리케이션 인증 처리 기법을 설정하는 요소

인증 처리 기법 : BASIC , DIGEST, FORM, CLIENT-CERT 등으로 이 중 하나를 <auth-method> 요소에 설정



BASIC - 웹 자원을 보호하는 간단하고 일반적인 방법

DIGEST - 암호화 메커니즘을 이용하여 전송 / 많이 사용되지 않는 암호화 기법으로 JSP 컨테이너가 반드시 지원하지 않을 수도 있음

FORM - 일반적인 폼 페이지를 이용하여 로그인 정보를 서버에 전송하는 방식, 암호화되지 않은 로그인 정보를 그대로 전송

CLIENT-CERT - 클라이언트가 인증서를 가지고 공인 키 인증 방식을 사용하여 로그인 하는 방식. 클라이언트가 인증서를 가지고 있어야만 로그인 되므로 비즈니스 환경에서만 사용가능



FORM기반 인증 시 로그인 페이지의 요구사항

form 태그의 action속성 - j_securtiy_check

사용자의 name속성 - j_username

비밀번호의 name속성 - j_password



		FORM기반 인증 시 로그인 페이지의 예
	
	<form action="j_securtiy_check" method="psot">
		아이디 : <input type="text" name="j_username">
		비밀번호: <input type="password" name="j_password">
		<input type="submit" value="로그인">
	</form>


FORM기반 인증 처리를 사용하려면 정해진 규칙을 따라야함
 FROM기반 인증 처리는 웹 브라우저가 인증 처리에 직접적으로 관여하지 않으므로
 사용자가 로그인 페이지에 인증정보를 직접 입력해야 전달됨
 action속성, input태그의 name속성을 줘야함


		시큐리티 인증 설정하기

	<realm-name> 요소
 기본 인증의 영역 이름을 설정하는 요소

<realm-name>요소에 설정된 영역 이름은 대개 웹 브라우저의 로그인 대화상자에 표시

<realm-name> 요소는 <login-config>요소에 대한 설명 속성이 없으므로 데이터를 문서화 하는데 일반적으로 사용

	<login-config>
		<realm-name>login</realm-name>
	</login-config>


***********************************************************************************
	<form-login-config> 요소

인증 처리를 위한 로그인 및 오류 페이지를 설정하는 요소

<auth-method> 요소가 FORM 기반 인증 처리 기법으로 설정되었을 때 사용

<form-login-page>,<form-error-page>등의 하위 요소로 구성
로그인 및 오류 페이지의 경로는 웹 어플리케이션 이름을 기준으로 설정


<form-login-page> - 인증을 위한 로그인 페이지를 설정

<form-error-page> - 인증 실패 시 표시할 오류 페이지를 설정

```

			# 프로그래밍적 시큐리티 처리

```

	프로그래밍적 시큐리티(programmatic security)

웹 어플리케이션의 보안을 위해 코드를 작성하여 사용자의 권한 부여를 처리하는 방식

선언적 시큐리티의 보안으로 충분하지 않을때 request 내장 객체의 메소드를 사용하여 사용자를 승인하는 방법


내장 객체 메소드

getRemoteuser() - 사용자의 인증상태를 반환 (String)

getAuthType() - 서블릿을 보호하는 데 사용되는 인증 방식의 이름을 반환 (String)

isUserInRole(java.lang.String role) - 현재 인증된 사용자에게 설정된 역할이 있는지 확인. 설정된 경우 true를 반환하고 그렇지 않은 경우 false를 반환 (boolean)

getProtocol() - 웹 브라우저의 요청 프로토콜을 가져옴 (String)

isSecure() - 웹 브라우저에서 https 요청으로 request가 들어왓는지 확인 웹 브라우저에서 https로 접근하면 true를 반환, http로 접근하면 false를 반환

getUserPrinciple() - 현재 인증한 사용자의 이름을 포함하여 java.security.Principle 객체를 반환 (Principle)




**********************************************************************************

<% if (request.isUserInRole("admin")){%>
	<a href="admin/addProduct.jsp">상품 등록</a>
	<a href="admin/member.jsp">회원 관리</a
<% } % >

사용자의 역할이 admin 인지 확인하여 승인된 사용자만 addProduct.jsp와 member.jsp파일에 접근할 수 있음

```
