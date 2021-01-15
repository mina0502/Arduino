```
	자바스크립트로 서블릿 요청

실무에선 자바스크림트에서 먼저 입력한 값에 대해서 유효성 검사를 한 후 자바스크립트에서 서블릿에 요청
자바스크립트 함수에서 <form> 태그에 접근하여 값 입력 여부를 체크한 후 action 속성에 전송할 서블릿 이름을 지정함

```

```
	서블릿 초기화 파라미터 : ServletConfig

특정 Servlet이 생성될 때 초기에 필요한 데이터들이 있음 || 특정 경로, 아이디 정보( 초기화 파라미터)




******************************************************************

1. web.xml에 기술 - web.xml파일에 init-param태그를 이용해서 
   		Sevlet파일에서 가져와서 쓸 수 있음 || 특정 Servlet파일에 국한



	Servlet클래스 제작
		↓
	web.xml파일에 초기화 파라미터 기술
		↓
	SevletConfig(인터페이스) 메소드 이용해서 데이터 불러옴


*****************************************************************


2. servlet파일에 직접 기술	- 직접 어노테이션을 이용하여 적용


	Servlet 클래스 제작
		↓
	@WebInitParam에 초기화 파라미터 기술
		↓
	ServletConfig 메소드 이용해서 데이터 불러오기


************************************************************

	데이터 공유 : ServletContext

여러 Servlet에서 특정 데이터를 공유해야 할 경우 context parameter를 이용해서 web.xml에 데이터를 기술하고
Servlet에서 공유하면서 사용할 수 있음

	Servlet 클래스 제작  - context-param 태그는 servlet태그와 별로도 만듦
		↓
	web.xml파일에 context parameter 기술 
		↓
	ServletContext 메소드 이용해서 데이터 불러오기

*************************************************************** 

		※중요※

	1. 특정 서블릿 : initParam [관리자]
	2. 모든 서블릿 : contextParam [전체 데이터 공유 / 프로젝트]

**************************************************************

	웹 어플리케이션 감시 : ServletContextListener

웹어플리케이션의 생명주기(LifeCycle)를 감시하는 리스너가 있음 || ServletContextListener
리스너의 해당 메소드가 웹 어플리케이션의 시작과 종료시 호출


	리스너 클래스를 따로제작(ServletContextListener를 구현해야함)

				↓
	      	  web.xml파일에 리스너 클래스 기술


*****************************************************************

			리스너 클래스 제작
				↓
			@WebListener 추가  (어노테이션)

```

```

			hidden 

클라이언트에게 숨겨진 내용으로 서버에 전송하고자 할 때 사용 (로그인 시간, IP 등)


			button

button이 클릭 되었을 경우, onclick에 있는 함수가 자동으로 호출이 됨 
(자바스크립트로 함수를 만들어서 유효성이나 반드시 입력 되어야 하는 부분 등 확인하는 함수)

```

```
특정 서블릿에만 적용되는 부분 servlet파일을 지정할 때 그안에 초기화 파라메터를 기술
(init-param태그 이용)
<servlet>
	<servlet-name>Servlet_Name</servlet-name>
	<servlet-class>Package_Name</servlet-class>

	<init-param>
		<param-name>id</param-name>
		<param-value>View_id</param-value>
	</init-param>

	<init-param>
		<param-name>pw</param-name>
		<param-value>View_pw</param-value>
	</init-param>
	
</servlet>
```


```
		Servlet-mapping

	<servlet-mapping>
		<servlet-name>initParam</servlet-name>
		<url-pattern>/IP</url-pattern>
	</servlet-mapping>
```


	###initParam -> 상속계층도 쉽게 보기

[Java API (ctrl+t) ] (https://javaee.github.io/javaee-spec/javadocs/)

```
	getServletContext()를 이용해서 web.xml파일의 context-param 값들을 가져다가 쓸 수 있음

	context-param : 하나의 프로젝트 안에 여러 서블릿 파일에서 함께 공유하면서 사용할 수 있도록함
		==> 특정 서블릿을 매핑하는 코드가 없는 것을 알 수 있음

*********************************************************************************

	Context-param과 init-param이 동시에 사용 되었을 경우

※getServletContext().getInitParameter("")※ 일 경우에는 context-param의 값을 가져옴

※this.getInitParameter("")일 경우에는 init-param의 값을 가져옴※

```

```
		리스너 지정
<listener>
<listener-class>sec_exam04.ServletContextListener</listener-class>
</listener>

************************************************************
서버가 중지될 때나 서버가 시작될 때 자동 호출
[web.xml]에 리스너를 지정하면 모든 Servlet이 서버를 통해 시작되기에 호출이 됨

콜백 메서드 (contextDestoryed, contextInitialized)는 다른 웹어플리케이션과 같이 실행 되기때문에
확인을 할 필요가 있음 [프로젝트 적용]

어노테이션을 이용한 리스너 지정 가능 @WebListener


```

```
		순서

	   contextInitialized() 
	      	↓ 
	      생성자 호출 
		↓ 
	initPostConstructor() 선처리 
		↓
	            init() 
		↓ 
	          doGet()  
		↓
	 contextDestroyed() 
		↓
	        destory()
		↓
	destroyPredestroy() 후처리

```