```

	JDBC

JAVA 프로그램에서 SQL문을 실행하여 데이터를 관리하기 위한 JAVA API
JDBC의 특징은 다양한 데이터 베이스에 대해서 별도의 프로그램을 만들 필요 없이, 데이터베이스의 JDBC를 이용하면 하나의 프로그램으로 데이터 베이스를 관리할 수 있음

```

```

JDBC : Java Data Base Connectivity : 자바전용

ODBC : Open Data Base Connectivity : MS사 개발

```

```

	JDBC를 사용한 DB연동 순서

JDBC를 사용한 JSP와 데이터베이스의 연동

1. java.sql.* 패키지 임포트
2. JDBC 드라이버 로딩
3. 데이터베이스 접속을 위한 Connection 객체 생성
4. 쿼리문을 실행하기 위한 Statement/PreparedStatement/CallableStatement객체 생성
5. 쿼리 실행
6. 쿼리 실행의 결과 값(int, ResultSet) 사용
7. 사용된 객체(ResultSet, Statement/PreparedStatement/CallvbleStatement,Connection) 종료

1. JDBC 드라이버 로드 --> 2. 데이터베이스 연결 --> 3. SQL문 실행 --> 4. 데이터베이스 연결해제

```
```

	JDBC 드라이버 로딩 및 DBMS 접속

********************************************************************

JDBC 드라이버 로딩

Class.forName() 메소드를 이용하여 JDBC 드라이버 로딩

Class.forName(String className);
<%
try{
	Class.forName("com.my.sql.jdbc.Driver");
}
catch(SQLException ex){
예외 발생처리
}
%>

JDBC 드라이버 로딩은 프로그램 수행 시 한 번만 하면됨

************************************************************

Connection 객체 생성하기

JDBC 드라이버에서 데이터베이스와 연결된 커넥션을 가져오기 위해 DrvierManager 클래스의 getConnection()메소드를 사용
DriverManager 클래스로 Connection객체를 생성할 때 JDBC 드라이버를 검색하고, 검색된 드라이버를 이용하여 Connection 객체를 생성한 후 이를 반환

static Connection getConncetion(String url)
static Connection getConncetion(String url,String user, Strion password)
static Connection getConncetion(String url,Properties inf)
<%
 Connection conn=null;
try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(
	"jdbc:mysql://localhost:3306/JSPBookDB?user=root&password=12345");
}
catch(SQLException ex){
예외 발생처리
}
%>

************************************************************************************

	Statement 인터페이스

정적인 쿼리에 사용
하나의 쿼리를 사용하고 나면 더는 사용할 수 없음
하나의 쿼리를 끝내면 close()를 사용하여 객체를 즉시 해제해야함
close()를 사용하여 객체를 즉시 해제하지 않으면 무시할 수 없는 공간이 필요, 페이지가 다른 작업을 수행하는 동안 멈추지 않음
복잡하지 않은 간단한 쿼리문을 사용하는 경우에는 좋음

executeQuery(String sql)  - ResultSet - SELECT 문을 실행할 때 사용 (ResultSet 객체 반환)  	|| SELECT
executeUpdate(String sql) - int - 삽입, 수정, 삭제와 관련된 SQL문 실행에 사용	 	|| DML 구문
close() - void - Statement 객체를 반환할 때 사용

***********************************************************************
	executeQuery()

ResultSe executeQuery(String sql) throws SQLException

<%
	Connection con=null;

Statment stmt = conn.createStatement();
String sql = "SELECT * FROM Member WHERE id = '1'";
ResultSet rs= stmt.executeQuery(sql);
stmt.close();
%>

*********************************************************************

	executeUpdate()

int executeUpdate(String sql) throws SQLException

<%
	Connection conn= null;

Statement stmt= conn.createStatement();
String sql = "INSERT INTO Member(id,name,passwd) VALUES ('1','mina','1234');
int rs = stmt.executeUpdate(sql);
%>

```
```

데이터베이스 연결 닫기

<%
	Connection conn = null;
try{
JDBC로딩 
Connection 객체 생성
}
catch(SQLException e){
예외발생 처리
}
finally{
if(conn !=null)
conn.close();
}
%>

데이터베이스 연결이 더 이상 필요하지 않을 경우 데이터베이스와 JDBC 리소스를 close()메소드로 생성한 Connetction 객체를 해제
--> 일반적으로 데이터베이스 리소스를 사용하지 않기 위해 사용을 끝내자마자 리소스를 해제하는 것이 좋음

	JDBC 예제

String driver = "com.mysql.jdbc.Driver";

String url="jdbc:mysql://localhost:3306/sql.db"
String id="root";
String pw="1234";
Stirng query= "select * form members order by name*;

try{
Class.forName(driver);
connection = DriverManager.getConnection(url,uid,upw);
statement = conneciton.createStatement();
resultSet = statement.executeQuery();

while(resultSet.next()){
String id=resultSet.getString("id");
String pw= resultSet.getString("pw");
String name= resultSet.getString("name");
String phone = resutlSet.getStirng("phone");

out.println("아이디: "+id+", 비밀번호: "+ pw+ ", 이름: "+name + ", 전화번호: "+phone +"<br/>");


	★중요★

1. Driver 로드
2. 드라이버 매니저 클래스로 부터 Connection 객체 얻기
3. 커넥션 객체로부터 쿼리를 실핼할 수 있게 하는 Statement객체 얻기
4. 쿼리 후, 결과를 얻는 ResultSet객체 얻기
5. 반복문으로 결과 출력


```

```

String url = "jdbc:mysql://localhost:3306/testdb";

mysql서버에 접속하기 위한 경로 설정 (jdbc:mysql -> 프로토콜, localhost -> 도메인 , 3306 : 포트번호 , testdb 접속할 db명)

String id="root";

접속 ID

String pw="1234";

접속 PW

String driver = "com.mysql.jdbc.Driver";
Class.forName(driver);

try{ || 드라이버명을 주고 동적객체를 생성, 이 과정을 지나면 비로소 driver가 DriverManager에 등록 되어 연결 객체를 얻을 수 있음
		Class.forName(driver);
		connection=DriverManager.getConnection(url, id, pw);
		out.println("Database Connect Success");
		}
		catch(Exception e){
			out.println("Database Connect Fail <br/>");
			out.println(e.getMessage()+"<br/>"); || 웹페이지 출력
		e.printStackTrace(); || 콘솔 출력
		}
		finally{
			if(connection !=null)
			{
				connection.close();
			}
		}
```

```
dbconn.jsp

페이지 모듈화를 하기 위해 연결 부분을 따로 파일로 만듬

Statement stmt = null; || 쿼리문 실행 Statement 객체 선언

(불편함) || 쿼리문 작성
String sql = "insert into members (id,pw,username) values('"+id+"','"+pw+"','"+username+"')";

stmt= connection.createStatement(); || Connection객체로 부터 Statement객체를 얻어내는 코드

*********************************************************************

	쿼리문을 DB에 날리는 코드
stmt.executeUpdate(sql);
out.println("members테이블에 정상적으로 삽입 되었습니다");

********************************************************************

finally	|| 자원 해제
		{
			if(stmt!=null)
			{
			stmt.close();
			}
			if(connection!=null)
			{
				connection.close();
			}
		}
```

```

액션태그 <jsp:include> --> 페이지를 모듈화시키고 동적으로 만들어 처리 결과물이 나올경우 사용
페이지 지시자 <%@include file="dbconn.jsp" %> -->소스의 텍스트로 들어옴 [정적인 파일 || footer 등]  

```
```
	ResultSet rs = null; || select 한 결과를 받아오는 객체



ResultSet 객체가 닫히는 경우

ResultSet의 결과물을 가지고 온 Statement객체가 닫힐 경우에 ResultSet객체도 함께 닫힘

******************************************************************

	ResultSet

next() : 다음 레코드로 이동
precvious(): 이전 레코드로 이동
first() : 처음으로 이동
last() : 마지막으로 이동
get메소드 ( getString, getInt)

******************************************************************

```

```

	PreparedStatement 객체 (Superinterface) || Statement객체 상속받음 CallableStatment


동적인 쿼리에 사용

- PreparedStatment객체는 하나의 객체로 여러 번의 쿼리를 실행할 수 있고, 
동일한 쿼리문을 특정 값만 바꾸어서 여러 번 실행해야 할 때, 매개변수가 많아서 쿼리문을 정리해야 할 때 유용함
PreparedStatement parepareStatement(String sql) throws SQLException


메서드

setString (int parameterIndex, String x) 
setInt (int parameterIndex, int x)
setLong(int parameterIndex, long x)
setDouble(int parameterIndex, double x)
setFloat(int parameterIndex,float x)
setObject(int parameterIndex, Object x)
setDate(int parameterIndex, Date x)
setTimestamp(int parameterIndex, Timestamp x)


executeQuery() - ResultSet || SELECT 문을 실행할 때 사용

executeUpdate() - int  || 삽입, 수정, 삭제와 관련된 SQL문 실행에 사용 ||DML

close(); || Statement 객체를 반환할 때 사용

****************************************************************************
	
	executeQuery() 메서드로 데이터 조회

int executeQuery() throws SQLException

****************************************************************************

		선택

<%
	String sql= "SELECT * FROM members where id=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,"1"); ||  [? 의 첫번째 인덱스 , 값]
	ResultSet rs= pstmt.executeQuery(sql);
	pstmt.close();
%>


*********************************************************************************

		삽입

<%
	String sql= "INSERT INTO members (id,username,pw) VALUES (?,?,?);
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,"1"); ||  [? 의 첫번째 인덱스 , 값]
	pstmt.setString(2,"mina");
	pstmt.setString(3,"1234");
	pstmt.executeUpdate();
	pstmt.close();
%>


```

```

	ResultSet객체

Statement 또는 PreparedStatement 객체로 SELECT 문을 사용하여 얻어온 레코드 값을 테이블 형태로 가진 객체


*******************************************************************************************
		
		Statement 객체를 사용하는 경우

	ResultSet.executeQuery(String sql) throws SQLException

/////////////////////////////////////////////////////////////////////////////////////////////

		PreparedStatement 객체를 사용하는 경우
	ResultSet.executeQuery() throws SQLException

********************************************************************************************

```

```

	ResultSet 객체 메서드

getXXX ==> 설정한 필드 값을 설정한 XXX형으로 가져옴

absolute(int row) ==> 설정한 row 행으로 커서를 이동

beforeFirst() ==> 첫 번째 행의 이전으로 커서를 이동

afterLast() ==> 마지막 행의 다음으로 커서를 이동

first() ==> 첫 번째 행으로 커서를 이동

last() ==> 마지막 행으로 커서를 이동

next() ==> 다음 행으로 커서를 이동

previous() ==> 이전 행으로 커서를 이동

close();  ==> ResultSet 객체를 반환할 때 사용

```

```
★pstmt= connection.prepareStatement(sql); ★
  
		쿼리문을 DB에 날리는 코드
pstmt.executeUpdate(); || 단 쿼리문을 매개변수로 넣지 않도록 해야함, 이미 쿼리문으로 prepareStatement 객체가 생성됨


```


```
	bootstrap

bootstrap -> col 12개

col-md-갯수

badge badge-danger

jumbotron --> 다양한 컴포넌트 (텍스트, 이미지, 회사로고 등)가 들어감

form-horizontal --> 폼요소들이 수평적으로 배치되도록 함

form-group row --> 하나의 행으로 나열

col-sm-2 --> 12개의 컬럼에서 2칸을 사용 || 화면크기가 768px 이상일때 col-sm-?가 적용, 
	     div요소의 block특성에 의해  100% 너비를 가지면 수직으로 쌓이게 만들어줌

col-sm-offset-2 col-sm-10 || off

```

```
	String을 숫자로 변환

Integer.valueOf(String i)

```
```

ProductRepository 인스턴스를 하나만 공유하게끔 싱글톤 패턴을 이용함

private static ProductRepository instance= new ProductRepository(); || 인스턴스를 만듬
	
	public static ProductRepository getInstance() {     	|| 인스턴스를 리턴 getter
		return instance;
	}

```


```

	상품 추가하는 역할을 하는 메서드

	public void addProduct(Product product)
	{
		listOfProducts.add(product);
	}

```

```
	ProductRepository

```