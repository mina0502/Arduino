```
	 커넥션 풀(DataBaseConnectionPool) 	
*******************************************************************

DAO ( Data Access Object)  - DB에 직접 접근하여 DB와 관련된 일(로직)을 하는 객체

	데이터베이스에 접속해서 데이터 추가, 삭제, 수정 들의 작업을 하는 클래스
	JSP혹은 Servlet페이지 내에 로직을 함께 기술할 수 도 있지만
	유지보수 및 코드의 모듈화를 위해 별도의 DAO클래스를 만들어 사용

*******************************************************************

DTO (Data Transfer Object) - DAO가 DB에 접근하여 가져온 데이터를 클래스로 만들어서 가져오는 객체

	데이터베이스에서 데이터를 관리할 때 데이터를 
	일반적인 변수에 할당하여 작업할 수 있지만
	해당 데이터의 클래스를 만들어 사용

*******************************************************************

웹브라우저  ↔ 서버[ Servlet(JSP) ↔ DTO ↔ DAO ] ↔DataBase

```

```
	DBCP 

커넥션 풀을 이용한 DB연동

클라이언트에서 다수의 요청이 발생할 경우 데이터베이스에 부하가 발생

이러한 문제를 해결하기 위해 커넥션 풀 기법을 이용

스레드 풀과 비슷

미리 생성해두고 클라이언트들이 접속할 때 가져다 쓰는 개념 
 다 쓰고 난 커넥션 객체를 재활용함


```

```
	코드

tomcat컨테이너가 데이터베이스를 인증을 하도록 context.xml파일을 열어서 아래의 코드를 추가
publish를 해줘야함, 반드시 해당 프로젝트 lib 폴더에 jdbc 드라이버를 추가

[key:value] 로 이루어짐 || 파이썬의 딕셔너리

name - DataSource에 대한 JNDI 이름
auth - 인증 주체
driverClassName - 연결할 데이터베이스의 클래스 이름
factory - 연결할 데이터베이스의 ConnectionPool 생성 클래스
maxActive - 동시에 최대로 데이터베이스에 연결할 수 있는 Connection 수
maxdle - 동시에 idle 상태로 대기할 수 있는 최대 수
maxWait - 새로운 연결이 생길 때까지 기다릴 수 있는 최대 시간
user - 데이터베이스 접속 ID
password - 데이터베이스 접속 비밀번호
type - 데이터베이스 종류별 DataSource 
url - 접속할 데이터베이스 주소와 포트 번호 및 SID

주로 driverClassName, user, password, url 만 변경해서 사용

driverClassName ---> DB가 바뀌는 경우 || Oracle , Maria

```
```

	커넥션 풀 사용

Connection Pool 사용

********************************************************
try{
context = new InitialContext();
dataSource= (DataSource)context.lookup("java:comp/env/"+"jdbc/dbtool"");
conn= dataSource.getConnection();
System.out.println("DBCP 연동 성공");
}
catch (Exception e)
{
e.printStackTrace();
}

dataSource라는 클래스를 통해 connection을 얻어나감

*********************************************************

```
```

connector가 있을 경우, DBCP 연동해서 사용할 수 있음

```
```
	
	DBCP 사용하기 위한 연동 (context.xml)

서버에게 DBCP를 사용하겠다고 명시하는 코드를 기재하는 부분

    <Resource
    	name="jdbc/dbconn"			|| DataSource클래스의 이름
    	auth="Container"				|| 현재 Container
	driverClassName="com.mysql.jdbc.Driver"	|| Driver클래스 이름
	url="jdbc:mysql://localhost:3306/testdb"
    	username="root"
    	password="1234"
    	type="javax.sql.DataSource"			|| DataSource를 가져올 type 지정
	maxActive="50"				|| 접속이 많을 경우 부하가 걸리기 때문에 지정해줘야함
	maxIdle ="10"				|| 커넥션 객체가 쉬고 있음
	maxWait ="5000"				|| 다음 커넥션까지 기다림
    
    />

|| 작성 후 서버에 Publish 해줘야함

```

		#dbcptest.jsp
```

|| Context 인터페이스는 서버에 있는 컨텍스트 패스를 얻는것
|| 서버가 구동이 되면 이미 DBCP는 만들어졌기 때문에 가져다가 쓰면 됨
|| context의 lookup()사용하기 위해서 InitialContext()클래스로 대입을 해준다.

Context context= new InitialContext(); 
DataSource dataSource= (DataSource)context.lookup("java:comp/env/"+"jdbc/dbconn");

서버가 닫히고 다시 접속할 경우 
커넥션 객체는 다른것을 알 수 있음

		
		커넥션객체 확인

	Connection connection= dataSource.getConnection();
	out.println(connection.toString());
	out.println(Thread.currentThread().getName());

	첫번째 결과 : 244462218
	두번째 결과 : 811717225
	|| ★실무에서는 DBCP를 이용★
```

```

DTO는 Data Transfer Object로 DB로부터 가져오는 데이터를 클래스 형식으로 가져오는 객체 (빈과 동일)

```
```

DAO 

DataSource , Connection, PreparedStatement, ResultSet, Context

DBCP에서 Connection메서드를 반환하는 메서드

```

```
	MemberDAO

DB 및 ArrayList에 추가


```