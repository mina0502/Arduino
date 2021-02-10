# 필터

```

클라이언트와 서버 사이에서 request와 response 객체를 먼저 받아 사전/사후 작업 등 공통적으로 필요한 부분을 처리

클라이언트의 요청이 웹 서버의 서블릿, JSP, HTML 페이지 같은 정적 리소스에 도달하기 전과 반대로 정적 리소스에서 클라이언트로 응답하기 전에 필요한 전처리를 가능하게 함

필터는 HTTP 요청과 응답을 변경할 수 있는 코드로 재사용이 가능 || 클라이언트와 정적 리소스 사이에 여러 개의 필터로 이루어진 필터 체인을 제공하기도 함


1. JSP/Servlet에서 필터의 개념은 같지만 걸러내는 대상이 다름
2. JSP/Servlet에서의 필터는 서블릿 2.3 부터 추가된 기능으로 클라이언트(브라우저)가 서버로 요청을 보내올 때 요청이 서블릿으로 전달되기 전, 후에 필터링하기 위한 기술을 의미
3. JSP/Servlet 스펙에서 필터는 사용하기 쉽도록 java.servlet..Filter 인터페이스로 제공하고 있으며 이것을 구현하고 web.xml에 등록하기만 하면 간단하게 사용할 수 있음
4. 인터페이스의 구현 메서드는 서블릿의 service()메서드나 doGet(), doPost() 메서드와 유사하기때문에 매우 익숙하게 사용할 수 있음

필터의 필요성

필터가 필요한 이유는 웹 컴포넌트(Servlet,JSP)에서 공통적으로 처리해야할 일들을 필터를 통해 처리할 수 있기 때문
요청 데이터의 본문을 UTF-8로 인코딩 하는 부분은 거의 대부분의 웹 컴포넌트에서 처리하는 로직

request.setCharacterEncoding("utf-8");
String param= request.getParameter("param");

필터는 이런 상황에서 인코딩 처리 부분을 분리하여 개발을 빠르고 유지보수 측면에서 나중에 코드를 변경할 때도 쉽게 수정이 용이하게 해줌 || 인코딩 정책이 변경 될 경우 --> 필터부분 수정

```
### 필터 체인

```

1. 여러 개의 필터가 모여서 하나의 체인을 형성할 때 첫 번째 필터가 변경하는 요청 정보는 클라이언트의 요청 정보가 됨
2. 체인의 두번째 필터가 변경하는 요청 정보는 첫 번째 필터를 통해서 변경된 요청 정보가 됨
3. 응갑 정보의 경우도 요청 정보와 비슷한 과정을 거치며 차이점이 있다면 필터의 적용 순서가 요청 때와는 반대
4. 필터의 이러한 기능은 사용자 인증이나 권한 체크와 같은 곳에서 사용할 수 있음

```

## Filter 인터페이스의 구현 클래스

```

import javax.servlet.Filter;

public class 클래스 이름 implements Filter
{

}

```

```

Filter 인터페이스 메소드의 종류

init() - 필터 인스턴스의 초기화 메소드

doFilter() - 필터 기능을 작성하는 메소드

destory() - 필터 인스턴스의 종료 전에 호출되는 메소드


**********************************************************************************************

		init() 메소드


JSP 컨테이너가 필터를 초기화할 때 호출되는 메소드

public void init(FilterConfig filterConfig) throws ServletException

init() 메소드는 JSP 컨테이너 내에서 초기화 작업을 수행할 필터 인스턴스를 생성한 후 한 번만 호출

init() 메소드 JSP 컨테이너에 의해 호출되어 필터의 서비스가 시작되고 있음을 나타냄



**********************************************************************************************

FilterConfig 인터페이스 메소드의 종류

getFilterName() - web.xml 파일에 설정된 필터 이름을 반환

getInitParameter(String name) - web.xml 파일에 설정된 매개변수에 대한 매개변수 값을 반환

getInitParameterNames() - web.xml파일에 설정된 모든 매개변수 이름을 포함하는 Enumeration 객체 타입을 반환, 초기화 매개변수가 존재하지 않으면 비어 있는 Enumeration을 반환

getServletContext() - ServletContext 객체를 반환

init()메소드 사용

@Override
public void init(FilterConfig filterConfig) throws ServletException{
	System.out.println("필터 초기화...");
}



**********************************************************************************************

doFilter()메소드

JSP 컨테이너가 필터를 리소스에 적용할 때마다 호출되는 메소드
init() 메소드 후에 호출되며, 필터가 어떤 기능을 수행할 필요가 있을 때마다 호출

public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws java.io.IOException, ServletException

첫 번째 매개변수 ServletRequest 객체는 체인을 따라 전달하는 요청
두 번째 매개변수 ServletResponse 객체는 체인을 따라 전달할 응답
세 번째 매개변수 FilterChain 객체는 체인에서 다음 필터를 호출하는 데 사용

 - 필터가 체인의 마지막 필터이면 체인의 끝에서 리소스를 호출
  -- request 파라메터를 이용하여 요청 처리의 필터 작업을 수행하고 체인이 있다면 다음 체인의 필터를 처리


FilterChain 인터페이스 메소드의 종류

doFilter(ServletRequest request, ServletResponse response) - 체인의 다음 필터 또는 리소스로 제어를 전달

@Override
public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOExceptionm ServletException{
	System.out.println("JSP 처리 전 필터 수행...");
	filterChain.doFilter(request,response);
	System.out.println("JSP 처리 후 필터 수행...");
}


```
## 필터 체인

```

여러 개의 필터가 모여 하나의 체인(chain; 또는 사슬)을 형성되어 있는 것을 칭함

1. 여러 개의 필터가 모여서 하나의 체인을 형성할 때 첫 번째 필터가 변경하는 요청 정보는 클라이언트의 요청 정보가 됨
2. 체인의 두번째 필터가 변경하는 요청 정보는 첫 번째 필터를 통해서 변경된 요청 정보가 된다
3. 응답 정보의 경우도 요청 정보와 비슷한 과정을 거치며 차이점이 있다면 필터의 적용 순서가 요청 때와는 반대
4. 필터의 이러한 기능은 사용자 인증이나 권한 체크와 같은 곳에서 사용할 수 있음


**********************************************************************************************

destory()메소드

필터 인스턴스를 종료하기 전에 호출하는 메소드

public void destory()

JSP 컨테이너가 필터 인스턴스를 삭제하기 전에 청소 작업을 수행하는 데 사용되며, 이는 필터로 열린 리소스를 모두 닫을 수 있는 방법

destroy() 메소드는 필터의 수명 동안 한 번만 호출

destory() 메소드 사용 예

@Override 
 public void destory(){
	Systme.out.println("필터 해제...");
}


```

```

web.xxml 파일에 필터를 설정

필터를 사용하려면 어떤 필터가 어떤 리소스에 대해 적용되는지 JSP 컨테이너에 알려줘야함

<filter>와 <filter-mapping 요소를 사용
web.xml 파일에 여러 개의 필터가 설정되어 있으면 선언된 순서대로 실행

<filter>를 구성하는 하위 요소
 
<filter-name> 필터 이름을 설정
<filter-class> 자바 클래스 이름을 설정
<int-param> 매개변수와 값을 설정

<filter-mapping>을 구성하는 하위 요소

<filter-name> 필터 이름을 설정
<url-pattern> URL 패터을 설정


<filter> 요소

<filter> 요소는 웹 어플리케이션에서 자바 필터와 매개변수를 설정하는 데 사용


**********************************************************************************************
<init-param> 요소
 설정된 매개변수와 값을 자바 또는 JSP 코드에서 접근

String value= getServletConfig().getInitParameter("매개변수 이름");


**********************************************************************************************

<filter-mapping> 요소
특정 리소스에 대해 어떤 필터를 사용할지 설정하는 데 사용

```

```
	 >>>script <<<

confirm()함수는 사용자의 선택을 할 때 사용하면 됨

function addToCart() ---> 장바구니에 추가하기 위한 핸들러 함수

```


```
	addCart.jsp

String id = request.getParameter("id"); // 전송된 상품 id를 얻어옴

// 상품 id가 넘어오지 않았을 때 강제로 products.jsp로 이동 시키고 종료시킴

		if(id==null || id.trim().equals(""))
		{
			response.sendRedirect("products.jsp");
			return;
		}


// 상품 데이터 접근 클래스의 인스턴스를 받아오는 코드

ProductRepository dao= ProductRepository.getInstance();

// 해당 id값을 이용해서 상품상세정보를 얻어오는 코드

Product product= dao.getProductById(id);


// 해당 상품이 없을 때

if(product==null)
{
response.sendRedirect("exceptionNoProductId.jsp");
}

//모든 상품을 가져오고 있는 코드

ArrayList<Product> gooList=dao.getAllProducts();

// 상품리스트 중에서 사용자가 주문 한 상품과 일치하는 id의 코드를 얻어 Product에 대입

for(int i=0;i<goodList.size();i++)
{
goods=goodList.get(i);
if(goods.getProductID().equals(id))
{
break;		
}
}

//세션 속성의 이름이  cartlist(장바구니에 담긴 물건목록)인 세션 정보를 가져와 ArrayList에 대입하고 있음

ArrayList<Product> list= (ArrayList<Product>)session.getAttribute("cartlist");


//cartlist 값이 null이라면 새로운 ArrayList를 만들고 세션에 cartlist 이름으로 list라는 값을 대입하고 있음


if(list==null)
{
list=new ArrayList<Product>();
session.setAttribute("cartlist",list);
}


// 사용자가 주문한 상품이 장바구니에 이미 담긴 물품인지 검색해서 있다면 수량을 증가 시키는 코드

for(int i=0; i<list.size();i++){
goodsQnt= list.get(i);
if(goodsQnt.getProductID().equals(id))
{
cnt++;
int orderQuandity= goodsQnt.getQuantity()+1;
goodsQnt.setQuantity(orderQuandity);
}
}

// 사용자가 주문한 상품이 장바구니에 없을 경우 수량을 1로 바꿔주고 장바구니 역할을 하고 있는 ArrayList에 추가

if(cnt==0)
{
goods.setQuantity(1);
list.add(goods);
}

```

```
		# >>>cart.jsp<<<

bootstrap --> table table-hover는 마우스 포인터가 있는 행의 배경을 바꾸어 눈에 띄도록 만드는 클래스

장바구니인  cartlist에 등록된 모든 상품을 가져오도록 session내장객체의 getAttribute()를 사용
ArrayList<Product> cartlist=(ArrayList<Product>)session.getAttribute("cartlist");
```