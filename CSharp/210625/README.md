
#닷넷 프레임워크와 C# 언어

```
.NET Framework
C# 언어에 대한 개요
정리
```
#### 운영체제와 닷넷 프레임워크

### 구성 요소
```
클래스 라이브러리와 CLR(Common Language Runtime)
		
		닷넷 프레임워크 구성

	Window Form 	ASP.NET

			ADO.NET

	기본 클래스 라이브러리 (BCL)

		공용언어런타임(CLR)
```

### 클래스 라이브러리

```
C# 언어 + 클래스 라이브러리
	= C# 프로그래밍

MSDN을 참고(msdn.Microsoft.com)

클래스 라이브러리

BCL(Basic Class Library) : 기본 클래스

Window Form : 윈도우 응용 프로그램 제작을 위한 클래스 라이브러리

ASP.NET : 웹 클래스 라이브러리

ADO.NET : 데이터베이스 클래스 라이브러리

```
### CLR (common Language Runtime)
```
역할: 컴파일된 C# 코드를 실행하는 역할

MSIL, IL (intermediate language), 중간언어

- Visual Studio 에서 C# 코드를 컴파일한 코드
- *.exe, *.dll (어셈블리, assembly)
- 닷넷 언어인 VB, C# 등의 공통언어

.NET Framework ==> 전부 통틀어서 이야기함

```

### CTS(Common Type System)와 CLS(Common Language Specification)

```
CTS는 공통 데이터형과 형식 정의

int --> System.Int32
float --> System.Single


CLS는 공통 언어 사양 정의
닷넷 언어가 지켜야 할 최소 코드 규칙

```

### C#언어 개요

```
C# 언어

C++ 언어 기반 + java 장점 
	= C#

C# 언어의 사용 범위

XML, Web, Network, 데이터베이스, 게임, IoT 등

C#은 거의 포인터를 사용하지 않음		(하드웨어 메모리 안에 있는 값 : C 와 C++  ||--> 포인터 활용)

 -> 메모리 관리자
 -> 객체 생성 new --> 해제 방법
 => 가비지 컬렉터 (Garbage Collector)에서 처리

```

### C#프로그램 실행과정

```
C# 소스파일	리소스
			  ↓
			참조
	↓		  ↓

	C# 컴파일러

		↓

관리되는 어셈블러(.exe or dll) MSIL
	  메타데이터
		↓ (CLR이 로드한 IL 메타데이터 및 참조)

.NET Framework
	공용 언어 런타임 보안 / 가비지 수집
	/ JIT 컴파일러	->(사용)		.Net Framework 클래스 라이브러리 

	 ↓ (네이티브 기계어로 전환)

	운영체제





	| C# 언어 (VS) -> 컴파일 | ->| MSIL (*.exe)  |-> CLR - > 실행

```
### 정리

```
닷넷 프레임워크의 구성 요소와 역할 이해

BCL , IL, CLR, JIT, CTS 등..  (CTS --> 데이터 타입...)

컴파일부터 실행까지의 과정을 이해

```

### C#프로그래밍의 기본구조

```
1. 솔루션과 프로젝트 생성
2. C# 프로그램의 시작
3. 표준 출력
4. C# 키워드
5. 정리

```

#### 솔루션과 프로젝트

```
 프로젝트
 	C#에서 필요로 하는 여러 파일에 대한 정보
 	및 컴파일 옵션 정보 등 포함

 솔루션 (.sln)
 	다수의 프로젝트를 하나의 솔루션 안에서
 	다룰수 있음

```

#### C#프로그램의 시작
```

자동 생성 코드


코드 구분

 1) using 부분 -> 프롤로그(prologue / prolog)
 2) namespace 부분 -> 프로그램 몸체


 using - 클래스의 네임스페이스를 선언하는 역할 : 네임스페이스 명시 없이 클래스 사용

 	Console.Write() ---> System.Console.Write()
 			네임스페이스명.클래스명

 C#은 하나 이상의 클래스 정의는 필수

  자동 생성 코드의 Program 클래스

  Program class의 Main == C/C++ main()
  객체 안에서의 static 메서드

  static void Main() // 기본형식
  {
  	.... 코드
  }

```

#### 표준 출력

```
C - 통화($, \ 등) 표시
D - 10진수 정수
E - 지수형태
F - 부동소수점
G - 기본출력
N - 콤마 출력
P - %단위로 출력
X - 16진수 출력
```
``` C#
///동화, 퍼센트, 16진수 출력

Console.WriteLine("{0:C},{1:P},{2:X}",123,123.45,123);
```

#### C#키워드

```
총 77개

C 키워드 (26개)

break, case, char, const, continue,
default, do, double, else, enum,
extern, float, for, goto, if,
int, long, return, short, sizeof,
static, struct, switch, typeof, void, while


C++ 키워드 (19개)

bool, catch, class, false, finally,
namespace, new, private, protected,
explicit, operator, public, this, throw, true,
try, using, virtual, volatile

C# 키워드 (32개)

abstract, as, base, byte, checked, decimal,
delegate, event, fixed, foreach, in , interface,
internal, implicit, is, lock, null, object, out, override,
parames, readonly, ref, sbyte, sealed, string,
unit, ulong, unchecked, unsafe, ushort, volatile

```

#### 정리
```
VS를 다운 받고 설치 옵션으로 설치

C# 프로그래밍 구조를 이해하고 네임스페이스와 클래스의 관계를 이해

표준 출력인 Console.Write, Console.WriteLine()을 사용해 보고 MSDN에서 다양한 출력 형식을 살펴보자
```

### 데이터형

```
C#의 데이터형 object로부터 파생된 객체
System.Object == object

데이터형은 CTS에서 정의된 객체

정수형

bool : 	System.Boolean  	1byte
char : 	System.Char 		2byte
byte : 	System.Byte 		1byte
sbyte: 	System.SByte 		1byte
short: 	System.Int16 		2byte
ushort:	System.UInt16 		2byte
int :  	System.Int32 		4byte
uint : 	System.UInt32 		4byte
long : 	System.Int64 		8byte
uling: 	System.UInt64 		8byte

실수형

float : 	System.Single 		4byte
double : 	System.Double 		8byte
decimal : 	System.Decimal 		16byte

문자열형

string : 	System.String

```
#### bool형
```
true, false
true 와 false 대신 0과 그 외의 값은 사용 금지

```
#### char형
```
유니코드
2byte

char형의 암시적 값 변환
ushort, int, uint, long, ulong, float
double, decimal

int Number '7';
```
```C#
	char cha = '7';
    int Num=cha;
    Console.WriteLine("{0},{1}",Num+1,(char)(Num+1));
```

#### byte, sbyte 형

```
byte 유효 범위
부호없는 0~ 255

sbyte 유효 범위
-128 ~ 127

byte형 두 값을 더하고 그 값을 
int형 변수에 대입하여 출력
```

```C#
int Result;
byte x = 1, y = 2;
Result = x+y;
Console.WriteLine(Result);
```

#### short, ushort 형
```
short 유효 범위

-32768 ~ 32767

ushort 유효 범위

0 ~ 65535

short 형의 유효 범위 값을 출력

	유효 범위 확인 코드

public const short MinValue
public const short MaxValue
```

#### int, uint 형, float 형

```
int 유효값 범위

- 2,147,483,648 ~ 2,147,483,647

uint 유효값 범위

0 ~ 4,294,967,295

	float 형

	소수점형 뒤에 f F접미사 명사
	없을경우 double형
```

#### string 형

```
'+' : 문자열 연결
== : 문자열 비교
[인덱스] : 문자

문자열에 '\'를 포함하는 경우

@"C:\temp\test.txt"  	==> 주로 사용하는 표현법
"C:\\temp\\test.txt"
```

``` C#
string a = "hello ", b = "world", c = a + b;
            Console.WriteLine(c);
            Console.WriteLine(c[4]);
            if(c=="hello world")
            {
                Console.WriteLine("같음");
            }
            else
            {
                Console.WriteLine("다름");
            }
            Console.WriteLine("길이 : {0}", c.Length);
```

### 암시적 데이터 형 var

```
 대입되는 데이터에 따라 데이터형 결정

 var를 사용할 수 없는 예

 null값 초기화, 매개변수로는 사용 못함
 var는 지역변수로만 사용  -> 클래스 멤버로는 사용 못함
 연속적으로 초기화 하는 경우 -> var m = 10, n =20;
```

``` C#
var value1 = 3.14f;
            float value2 = 10.0f;
            float sum = value1 + value2;
            Console.WriteLine("{0}, {1:f1}, {2}", value1, value2, sum);

```
#### nullable 형
```
null을 허용하지 않는 데이터형이 null값을 허용

형식
 데이터형? 변수명;

int? Var1;
bool? Var2 = null; // (true , false , null)

속성

.HasValue // true, false
.Value // 읽기 전용

```
```c#
int? Num1 = null;
            if(Num1.HasValue)
            {
                Console.WriteLine("올바른 값");
            }
            else
            {
                Console.WriteLine("null값");
            }
            Console.WriteLine("Num1의 값: {0}", Num1);
```

#### 변환

```
 ToString 

 기본형데이터.Parse()  

 Covert.ToInt32()
 Convert.ToSingle()
 Convert.ToXXXX()

```

```c#
int val1 = 127;
            string str1 = val1.ToString();
            Console.WriteLine(str1);

            int val2 = Convert.ToInt32(str1);
            Console.WriteLine(val2);

            string str2 = "3.14";
            float val3 = float.Parse(str2);
            float val4 = Convert.ToSingle(str2);
            Console.WriteLine("{0}, {1}", val3, val4);

```

#### 박싱과 언박싱

```
박싱 (boxing)

데이터형을 최상위 object 형으로 변환ㄴ하여
힙(heap)메모리에 저장

int m = 123;
object obj = m;

언박싱 (unboxing)

힙에 저장된 형식을 다시 원래의 형식으로 변환

int n = (int)obj;
```

```c#
int i = 123;
            object obj = i;
            Console.WriteLine("{0}", (int)obj);

            int j = 123;
            object o = j;
            j = 1234;
            Console.WriteLine("{0},{1}", j, (int)o);

```

#### 표준입력

```
Console.ReadKey()
사용자가 눌린 키 한 문자 정보를 리턴하는 메소드

함수원형

public static ConsoleKeyInfo ReadKey()
public static ConsoleKeyInfo ReadKey (bool intercept)	|| true : 화면 출력 안함 , flase : 화면 출력

ConsoleKeyInfo
키의 문자와 Shift, Alt, Ctrl 보조키 상태 포함

- ConsoleKeyInfo.Key
ConsoleKey 열거형 값
ConsoleKey.A, ConsoleKey.Escape 등..
MSDN에서 찾아 볼 것

- ConsoleKeyInfo.KeyChar

눌린 키의 유니코드를 얻는 속성으로
대소문자 등을 모두 구분할 수 있음 

```

``` c#
ConsoleKeyInfo KeyInfo;
            do
            {
                KeyInfo = Console.ReadKey(true);
                if(KeyInfo.KeyChar=='a')
                {
                    Console.Write("a눌림");
                }
                Console.Write(KeyInfo.KeyChar);
            }while(KeyInfo.Key !=ConsoleKey.Escape);
```

```
Console.ReadLine()
 엔터키가 눌려질 때까지 입력 받은 문자열을 리턴하는 메소드

 활용 
  입력받은 문자열을 숫자로 사용할 때는 
  Conver.ToInt32() 등의 메서드를 사용

```
``` c#
int Kor, Eng, Math, Total;
            float Average;
            Console.Write("국어 점수를 입력해 주세요: ");
            Kor = Convert.ToInt32(Console.ReadLine());
            Console.Write("영어 점수를 입력해 주세요: ");
            Eng = Convert.ToInt32(Console.ReadLine());
            Console.Write("수학 점수를 입력해 주세요: ");
            Math = Convert.ToInt32(Console.ReadLine());
            Total = Kor + Eng + Math;
            Average = Total / 3.0f;
            Console.WriteLine("국어 : {0}, 영어 : {1}, 수학 : {2}, 총 점수 : {3}, 평균 : {4:f1}", Kor, Eng, Math, Total, Average);
```
#### 사용자 지정형
```
struct, enum, class, interface

형식

public struct 구조체명
{
    // 멤버, 속성, 메서드
}
```
#### 제한사항
```
구조체에 선언된 const, static 변수만 초기화 가능

구조체 안에 선언할 수있는 생성자는 매개변수가 반드시 있어야 함

구조체를 같은 구조체에 대입하게 되면 값이 복사 || 주소 메모리 공유하지 않음

구조체는 값 형식이고 클래스는 참조 형식임

구조체는 값 형식이므로 선언만으로도 사용 가능

구조체는 구조체 또는 클래스에 상속할 수 없음

구조체는 인터페이스를 상속하여 메서드를 구현할 수 있음
```
``` c#
//구조체에 선언된 const, static 변수만 초기화 가능 
public struct MyStruce //구조체 선언
        {
            public const float PI = 3.14f;
            public const int Age = 12;
        }

        static void Main(string[] args)
        {
            Console.WriteLine("{0} {1}", MyStruce.PI, MyStruce.Age);
        }

```


```c#
//구조체 안에 선언할 수있는 생성자는 매개변수가 반드시 있어야 함
public struct MyStruct
        {
            public int Age;
        }

        static void Main(string[] args)
        {
            MyStruct TestStruct1,TestStruct2;
            TestStruct2.Age = 10;
            TestStruct1 = TestStruct2;
            Console.WriteLine("{0}", TestStruct1.Age);
        }
```
```C#
//구조체를 같은 구조체에 대입하게 되면 값이 복사 || 주소 메모리 공유하지 않음
//구조체는 값 형식이고 클래스는 참조 형식임
// new를 사용했을 때만 생성자가 호출 -> 기본값으로 초기화
public struct MyStruct
        {
            public int Age;
        }
        class MyClass
        {
            public int Age;
        }

        static void Main(string[] args)
        {
            MyStruct test1 = new MyStruct();
            test1.Age = 12;
            MyStruct test2 = test1;
            test2.Age = 24;
            Console.WriteLine("{0} {1}", test1.Age, test2.Age); // 12  24

            MyClass test3 = new MyClass();
            test3.Age = 12;
            MyClass test4 = test3;
            test4.Age = 24;
            Console.WriteLine("{0} {1}", test3.Age, test4.Age); // 24  24
        }

```
```c#
//구조체는 값 형식이므로 선언만으로도 사용 가능
  public struct MyStruct
        {
            public int Age;
            public float Num2;
            public bool IsReady; 
        }
        
        static void Main(string[] args)
        {
            MyStruct test = new MyStruct();
            Console.WriteLine("{0} {1} {2}", test.IsReady, test.Age, test.Num2);
        }
```

### 예제

```c#
//국어, 영어, 수학점수를 구조체 멤버 변수로 입력하고 Compute()메서드를 호출하면 평균과 총점이 계산되도록 프로그래밍
public struct MyStruct
        {
            public int kor;
            public int eng;
            public int math;

            public void Compute()
            {
                int total = kor + eng + math;
                Console.WriteLine("{0} {1}", total / 3.0f, total);
            }
        }
        
        static void Main(string[] args)
        {
            MyStruct test = new MyStruct();
            test.kor = 90;
            test.eng = 91;
            test.math = 92;
            test.Compute();
        }
```

#### 열거형
```
상수를 문자열로 대치하여 선언
상수에 의미 부여

형식

enum 열거형 명칭 {문자열1,문자열2};
enum 열거형 명칭 {문자열1 = 상수, 문자열2 = 상수};
enum 열거형 명칭 {문자열1 = 상수, 문자열2};

기본은 int형이지만 char 형을 제외한 형식 지정할 수 있음

enum Days:byte{Sun =0 , Mon ,Tue,Wed,Thu};

열거형 변수가 아닌 변수에 열거형 값을 대입할 때는 데이터형을 명시할 것
```
```C#
enum Days { Sun = 1, Mon, Tue, Wed, Thu, Fri, Sat };

    class Program
    {
        static void Main(string[] args)
        {
            int nValue = (int)Days.Mon;
            Days day = Days.Tue;
            Console.WriteLine("{0} {1}",nValue, day);
        }
    }
```
#### 값 형식

```
System.Object + System.ValueType 에서 파생

변수가 직접 값을 저장하는 형

기본 데이터형, 구조체, 열거형

선언 vs 생성(new)

```

``` C#
int nVal1 = 12;
            int nVal2 = new int(); // Object라는 객체를 통해 상속을 받고 있기 때문에 new 를 통한 객체를 생성해서 사용가능
            Console.WriteLine("{0} {1}", nVal1, nVal2);
```

#### 참조 형식

```
참조 형식 : 한 객체를 참조형 변수가 사용할 때 참조형에 의해 내용이 바뀌면 객체에 영향을 줌

class, interface, delegate, 배열, string

객체와 참조형 사이의 개입은 객체의 메모리 주소가 복사 됨

```

``` c#
 int[] Array1 = { 1, 2, 3 };
            int[] RefArray;
            RefArray = Array1;
            RefArray[1] = 20;
            Console.WriteLine("{0} {1} {2}", Array1[0], Array1[1], Array1[2]);
```

### 정리

```
기본 데이터형과 CTS 형식을 익혀둠
데이터형에 관한 검증 코드를 작성
값 형식과 참조 형식의 차이점을 이해

값 형식: 기본 데이터형, struct, enum

참조 형식: class, interface, delegate,배열,string

```
#### C# 기본문법
```
연산자
제어문
반복문
점프문
예외처리문
```

#### 연산자
```C#
/*
    단항 연산자

    +,-,!,~,++,-- 등
    !은 bool형에만 사용
*/

bool bFlag = false;
Console.WriteLine("{0} {1} {2}", !bFlag, !true, !false);
```
```C#
/* 
    산술 연산자

    *,/,%,-,+
string에서 + 는 문자열 열결

정수/부동 + "문자열" = "문자열"
*/
string str ="3"+".14";
Console.WriteLine(+5);
Console.WriteLine(5 +5);
Console.WriteLine(5+.5);
Console.WriteLine("5"+"5");
Console.WriteLine(5.01f+"5");
Console.WriteLine(3.14f+"5");
Console.WriteLine(str);
```

```
    시프트 연산자와 관계 연산자

    <<,>>,>=,<=,>,==,! =

    관계 연산자의 결과 --> true || false
```

```C#
/*
    is 연산자

    형식 호환을 조사하는 연산자
    A(변수) is B(Class형 || 데이터형)
    결과 : true / false
    박싱/언박싱 변환, 참조 변환에서 사용
*/
            int nValue = 10;
            if(nValue is float)
            {
                Console.WriteLine("호환");
            }
            else
            {
                Console.WriteLine("호환 안됨");
            }

            if(nValue is object) // boxing 호환
            {
                Console.WriteLine("호환");
            }
            else
            {
                Console.WriteLine("호환 안됨");
            }
            object obj = nValue;
            if(obj is int)
            {
                Console.WriteLine("호환");
            }
            else
            {
                Console.WriteLine("호환 안됨");
            }
```
```C#
/*
    as 연산자

    역할 
        형변환과 변환조사
        캐스트 연산자의 역할과 불변환은 null 리턴

    참조, 박싱, 언박싱, null형에 사용

    형식
        결과형 = 참조형,언박싱, 박싱 as 변환형
*/
            string str1 = "123";
            object obj = str1;
            string str2 = obj as string;
            Console.WriteLine(str2);

            A test1 = new A();
            object obj1 = test1;
            B test2 = obj1 as B;
            if(test2==null)
            {
                Console.WriteLine("형변환 실패");
            }
            else
            {
                Console.WriteLine("형변환 성공");
            }
```

```
비트 연산자와 논리 연산자

&,^,|,&&,||,? :
```

```C#
/*
null 병합 연산자

? ? (null 조사)

C = A ?? B

A가 null이 아니면 A를 C에 대입
A가 null이면 B를 C에 대입
*/

            int? x = null; // nullable 형석, null 저장 가능
            int y = x ?? -1;
            Console.WriteLine(y);

            x = 10;
            y = x ?? -1;
            Console.WriteLine(y);
```

#### 제어문

```
선택문

if ~ else

switch, case
- 정수, 문자상수, 문자열
- 모든 case와 default에는 break가 반드시 있어야 함

```
```C#
// if문
            if(true)
            {
                Console.WriteLine("Hello world");
            }
            else
            {
                Console.WriteLine("C Sharp Programming");
            }
```
``` C#
// switch문

            int nNum = 1;
            switch(nNum)
            {
                case 1: // 진행하지 않음
                    Console.WriteLine("1");
                    break;
                case 2: Console.WriteLine("2");
                    break;
            }
```

```
반복문

for

for(;;) --> 무한반복

while , do ~ while

while(true) --> 무한반복

foreach
처음부터 끝까지 순차적으로 값을 반복하여 읽는 역할 --> 읽기 전용

foreach(데이터형 변수 in 배열명(컬렉션명))
{

}
```
```C#
// foreach 문
            int[] Array1 = {1,2,3,4};
            foreach(int nValue in Array1)
            {
                Console.WriteLine(nValue);
            }
```
```C#
            ArrayList List = new ArrayList();
            List.Add(1);
            List.Add(2);
            List.Add(3);

            foreach(int m in List)
            {
                Console.WriteLine(m);
            }
```

```
점프문
goto, continue, return , break
```

```
★예외 처리문★

예외란?
    런타임 시에 발생할 수 있는 오류

예외 처리 방법

if ~ else

try ~ catch 문 사용

try
{
    // 예외가 발생할 수 있는 코드
}
catch (예외처리객체 e)
{
    // 예외 처리
}
System.Exception 파생 객체만 사용

System.Exception 파생 객체

OverFlowException
FormatException
DivideByZeroException
FileNotFoundException

IndexOutOfRangeException

```
``` C#
            int[] array = { 1, 2, 3 };
            try
            {
                array[3] = 10;
            }
            catch(IndexOutOfRangeException e)
            {
                Console.WriteLine("배열 인데스 에러 발생");
                Console.WriteLine(e.ToString());
                array[2] = 10;
            }
            foreach(int i in array)
            {
                Console.WriteLine(i);
            }
```

### 정리

```
대부분의 연산자는 C, C++언어와 같음
C#에서 새롭게 등장한 연산자
is연산자, as연산자, null 병합 연산자(??)

for, while, do ~ while

foreach

예외처리문

try ~ catch ~ finally

throw
```
#### 배열

```
일차원 배열

기본개념 : 같은 데이터형+ 변수명 + 순차적인 메모리 나열

 참조형 : new를 통해 생성

 Array로부터 파생된 참조형

 foreach 사용 가능

선언 형식

데이터형[] 배열명;
int[] array_name;

생성과 초기화

int[] array;

array = new int[] {1,2,3};
array = new int[3] {1,2,3};

int[] array = new int[3]{1,2,3};
int[] array = new int[]{1,2,3};

int[] array = {1,2,3};

Array.Length 속성

foreach 사용(읽기 전용) 
------------------------------------------------------

이차원 및 다차원 배열

행과 열, 면은 콤마(,)로 구분

선언형식
    데이터형[,] 배열명;
    데이터형[,,] 배열명;
------------------------------------------------------

가변 배열

형식 : 데이터형[][] 배열명
int[][] array_name;

사용 예(1)

int[][]  array = new int[3][];
array[0]=new int[2];
array[1]=new int[3];
array[2]=new int[4];

사용 예(2)

int[][] array = new int [3][];
array[0]=new int[2]{1,2};
array[1]=new int[3]{3,4,5};

사용 예(3)

int[][] array = new int[][]
{
    new int[]{1,2,3},
    new int[]{4,5,6},
    new int[]{7,8,9}
}

사용 예(4)

int[][] array={
    new int[]{1,2,3},
    new int[]{4,5,6},
    new int[]{7,8,9}   
}

배열을 인수로 전달
배열을 리턴하는 메서드
배열의 메서드
```
``` c#
 static int[] CreateArray1(int nSize)
        {
            int[] Array1 = new int[nSize];
            for (int i =0; i<Array1.Length;i++)
            {
                Array1[i] = i+1;
            }
                return Array1;
        }

        static int[,] CreateArray2(int nRow,int nCol)
        {
            int idx = 0;
            int[,] Array2 = new int[nRow, nCol];
            for(int i=0; i<nRow;i++)
            {
                for (int j = 0; j < nCol; j++)
                {
                    Array2[i, j] = ++idx;
                }
            }
            return Array2;
        }
        static void Main(string[] args)
        {
            int[] nArray1;
            int[,] nArray2;

            nArray1 = CreateArray1(5);
            nArray2 = CreateArray2(2, 3);

            for (int i=0; i<nArray1.Length;i++)
            {
                Console.Write(nArray1[i]);
            }
            Console.WriteLine();
            for(int i=0;i<2;i++)
            {
                for(int j=0;j<3;j++)
                {
                    Console.Write(nArray2[i, j]);
                }
            }
                Console.WriteLine();
        }

```

### 배열의 메서드

```
배열
Array 클래스로부터 파생된 객체

배열 초기화 메서드

public static void Clear(
    Array array, int index, int lenght)

    Clear(배열이름, 시작인덱스,길이(갯수)) 

배열 복사

배열 복사 메소드
public Object Clone()
<메모리 복사 안함>
```

``` c#
int[] nArray1 = { 1, 2, 3, 4 };
            int[] nCloneArray = (int[])nArray1.Clone();

            nCloneArray[2] = 30;
            foreach (int m in nArray1)
                Console.Write(m);
            Console.WriteLine();

            foreach (int m in nCloneArray)
                Console.Write(m);
            Console.WriteLine();

            string[] Days = { "일", "월", "화", "수", "목", "금", "토" };
            string[] DaysClone = (string[])Days.Clone();
            foreach (string str in DaysClone)
                Console.Write(str);
            Console.WriteLine();
```