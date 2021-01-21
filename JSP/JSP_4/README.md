```
	 bean (클래스 - 속성과 기능)

반복적인 작업을 효율적으로 하기 위해 빈을 사용함

JAVA언어의 데이터(속성)와 기능(메소드)으로 이루어진 클래스

빈을 사용하는 궁극적 목적은 디자인 부분과 비즈니스 로직부분을 분리하고
복잡한 JSP코드들을 줄이고, 프로그램의 재사용성을 증가시키기 위함

빈을 만든다 -> 데이터 객체를 만들기 위한 클래스


	빈즈의 작성 규칙

1. 자바 클래스는 java.ioSerializable 인터페이스를 구현해야함
2. 인수가 없는 기본 생성자가 있어야함
3. 모든 멤버 변수인 프로퍼티 private 접근 지정자로 설정해야함
4. 모든 멤버 변수인 프로퍼티는 getter/setter()메소드가 존재해야함


	빈 관련 액션태그 (useBean)

업데이트(수정) : setProperty()
데이터 읽어옴 : getProperty()

특정 bean을 사용한다고 명시할 때 사용
	<jsp:useBean id="[student]" class="sec01_exam.Student" scope="page"/>

자바코드: Student [student] = new Student();

scope

page: 생성된 페이지 내에서만 사용 가능(기본값 설정) 페이지가 바뀌면 빈 객체가 공유유지가 되지 않음

request: request요청을 받고 처리를 완료할 때까지 생존되는 scope

session: 클라이언트당 하나씩 할당되는 영역 || 클라이언트가 브라우저를 종료하기 전까지 유지

application: 사이트 전체의 범위를 가짐 || 서버가 종료되기 전까지 계속 유지

```

```

	빈 관련 액션태그

id - 자바 빈즈를 식별하기 위한 이름

class - 패키지 이름을 포함한 자바빈즈 이름 || 자바빈즈는 인수가 없는 기존 생성자가 있어야하고 추상클래스 사용불가

scope - 자바빈즈가 저장되는 영역을 설정. page(기본 값),request,session,application 중 하나의 값을 사용

```

```
setProperty (자바 - setter)

<jsp:setProperty name="빈 이름" property="name" value="데이터값"/>

************************************************************

getProperty (자바 - getter)

<jsp:getProperty name="빈 이름" property="name"/>

```

```
	빈 관련 액션태그(setProperty)

name - useBean태그에 id 속성 값으로 설정된 자바빈즈를 식별하기 위한 이름

property - 자바빈즈의 프로퍼티 이름 || 프로퍼티 이름에 '*'를 사용시 모든 요청 파라미터가 자바빈즈 프로퍼티의 setter()메소드에 전달됨

value - 변경할 자바빈즈의 프로퍼티 값 || 프로퍼티 값이 null이나 존재하지 않을 경우 setProperty 액션태그가 무시

param - 프로퍼티 값을 전달하는 용청 파라미터 이름 || param과 value 동시 사용 불가

```
```
	빈 관련 액션태그(getProperty)

name - useBean 태그에 id 속성 값으로 설정된 자바빈즈를 식별하기 위한 이름

property - 자바빈즈의 프로퍼티 이름 || 프로퍼티 이름에 '*'를 사용하면 모든 요청 파라미터가 자바빈즈 프로퍼티의 getter()메소드에 전달됨

```
```
source - Generate Getter and Setter

클래스 만듬 --> JSP에서 빈을 만들었다고 함

useBean 액션태그를 이용하여 데이터를 저장, 수정, 읽기 가능해짐
```

```
	useBean 액션 태그

<jsp:useBean id="student" class="sec01_exam.Student" scope="page"/>
id는 자바에서의 참조변수와 같은 역할을 함
class 속성은 참조변수의 원본 클래스의 패키지명.클래스명으로 지정해줘야함
자바에서 new연산자로 객체(인스턴스)를 생성한 것과 동일한 개념이 되는 것

```

```
<jsp:setProperty property="*" name="student"/> || 기본값 지정

jsp액션태그중 setProperty를 이용해서 name에 bean의 id값, property는 빈의 속성(멤버변수), value는 실제 값을 주어 저장하는 것
setProperty가 student클래스의 setter메서드를 호출하는 태그

<jsp:setProperty property="name" name="student" value="mina"/> || student 객체안에 있는name에"mina"값을 넣음
<jsp:setProperty property="age" name="student" value="12"/>
<jsp:setProperty property="grade" name="student" value="5"/>
<jsp:setProperty property="studentNum" name="student" value="21"/>

```
```
	getProperty가 student 클래스의 getter메서드를 호출하는 태그
이름 : <jsp:getProperty property="name" name="student"/><br/>
나이 <jsp:getProperty property="age" name="student"/><br/>
학년 : <jsp:getProperty property="grade" name="student"/><br/>
번호 : <jsp:getProperty property="studentNum" name="student"/><br/>
```

```
DAO -저장, 표식, 메서드 추가 등 비지니스 로직이 분리되는 부분
```