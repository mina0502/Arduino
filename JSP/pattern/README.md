		# 포워딩 기법과 디자인 패턴

```
		*포워딩*


	RequestDispatcher 클래스 || request 재생성

서블릿 또는 JSP에서 요청을 받은 후 다른 컴포넌트로 요청을 동일하게 위임할 수 있음

RequestDispatcher클래스의 경우 요청받은 요청객체를 위임하는 컴포넌트에 동일하게 전달할 수 있음

웹 브라우저에서 사용자가 전달한 정보를 request.getParameter()로 받아 이것을 다른 컴포넌트로 전달하면 똑같이 속성을 받을 수 있음


	HttpServletResponse 클래스  || request 소멸

RequestDispatcher 클래스와 동일하게 요청을 위임하는 클래스

RequestDispatcher 클래스와 차이점은 요청 받은 요청객체를 위임 받은 컴포넌트에게 새로운 요청객체를 생성

브라우저에서 요청이 날라오면 서블릿에서 응답을 하고 다시 응답 받은 브라우저는 다시 새로운 request로 요청하기 때문에 이 두 request는 서로 다른 객체
속성을 참조하여 사용할 수 없음// 매우 중요한점

클라이언트에서 요청받은 컴포넌트의 request객체는 클라이언트에서 위임 받은 컴포넌트의 request와는 다른 request객체임// 따라서 set을 해서 get을 위임 받은 컴포넌트에서는 사용할 수 없음


sendRedirect() 와 포워딩의 차이점

포워딩 : URL이 변하지 않음

sendRedirect() : URL이 변함, request와 response객체가 새롭게 생성됨


	url-pattern(디렉토리 패턴, 확장자 패턴)

디렉토리 패턴 - 디렉토리 형태로 서버의 해당 컴포넌트(서블릿)를 찾아서 실행하는 구조
/hello 로 매핑된 서블릿을 찾아가서 실행


확장자 패턴 - 확장자 형태로 서버의 해당 컴포넌트(서블릿)를 찾아서 실행하는 구조

*.do로 끝나는 요청을 동일한 do서블릿으로 찾아가게 맵핑



	FrontController 패턴

클라이언트의 다양한 요청을 한곳으로 집중시켜, 개발 및 유지보수에 효율성을 극대화함

한곳에 집중도는 높아지지만 관리하기엔 어려움이 있음

다른 Servlet으로 보내 분산하여 관리 ---> Command 패턴


	Command 패턴

클라이언트로부터 받은 요청들에 대해 서블릿이 작업을 직접 처리하지 않고 해당 클래스가 처리하도록 함

★ 클라이언트로부터 받은 요청들에 대해 FrontController역할을 하는 서블릿이 작업을 직접 처리하지 않고
해당 담당 서블릿으로 분산을 시켜 직접 처리
===> FrontController패턴과 Command패턴을 합쳐놓은 프로그램이 가독성이 좋음
|| MVC패턴 핵심



		MVC 패턴

클라이언트 -- 요청 --> Controller ---> Command ---> DAO <=DTO=> DB  

```