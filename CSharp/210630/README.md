
### 클래스
```
클래스 형식과 접근 한정자
객체 생성과 멤버 접근
생성자와 소멸자
정적 멤버 선언과 사용
클래스 참조
this

클래스 : 변수와 메서드를 그룹화 한 것

 - 그룹화를 위해 class 키워드와 형식 사용
 - new 연산자로 생성하여 사용
 - new를 사용하지 않으면 같은 클래스 참조할 수 있는 변수가 됨(클래스 참조 변수)
 - 클래스를 new를 통해 생성하면 객체가 됨


 인스턴스와 객체의 관계

 인스턴스 : 본질
 객체 : 실물인 형상

 A test1 = new A();
 A test2 = new A();
(object)  (instance)

'같은 A 인스턴스를 가지는 test1 과 test2 객체'


클래스 형식과 접근 한정자

클래스 형식과 구조체 형식은 유사

struct struct_name
{}

class class_name
{}

xxx.멤버 변수, xxx.멤버 메서드

구조체 선언은 값형　|| 메모리 공유 안함
클래스 선언은 참조형|| 메모리 공유 --> 객체 (new)로 만들어서 사용


형식

class class_name
{
    variable 선언;
    method 선언
//member
}

class Date
{
    int Year,Month,Day;
    void Print()
    {
        Console.WriteLine("{0} {1} {2}",Year,Month,Day);
    }
}

접근한정자 (access modifier)

클래스 멤버에 대한 접근 권한 설정

접근 한정자
private, protected, public, internal,
protected internal

클래스 자체에 적용하는 접근 한정자

public -> 명시적

internal -> 암시적

형식

[접근 한정자] class class_name
{
	[접근 한정자] variable 선언;
	[접근 한정자] method 선언;
}

public
 - 클래스 내외부에서 모두 접근 가능
 - 상속관계에서도 위와 동일하게 접근 가능


private
 - 클래스 또는 구조체 안에서만 멤버에 접근
 - 클래스 외부에서 사용 안됨

protected
 - 클래스 안에서는 pricate와 같은 역할
 - 하위 클래스 안에서는 상위 protected 멤버에 접근 가능 (private와 동일한 역할)

```
``` C#
namespace ConsoleApplication1
{
    class Date
    {
        int Day;
        protected int Year;
        public int Month;

        public void Print()
        {
            Console.WriteLine("{0} {1} {2}", Year, Month, Day);
        }

    }
    class Program
    {
        static void Main(string[] args)
        {
            Date Test = new Date(); 
        }
    }
}
```

```
internal
 - 같은 어셈블리(exe, dll)안에 있을 때만 내 외부에서 멤버에 접근가능
 - 클래스 서두에 접근 한정자 생략은 internal 생략한 것

 class Test
 {

 }

 protected internal
  - 같은 어셈블리(exe,dll)안에서는 internal과 동일
  - 서로 다른 어셈블리 안에서 상속관계일 때 하위 클래스는 상위 클래스의 protected internal 멤버에 접근할 수 있음  (외부에서 접근 불가)
```

#### 객체생성과 멤버
```
객체 생성 키워드
new
객체 해제는 가비지 컬렉터에서 함

ex) Console.WriteLine();

접근 한정자에 따라 접근 제한
객체의 멤버는 '.'과 함께 표기
object_name.variable
object_name.method

visual studio 의 인텔리센스 기능 활용
	
```
```C#
namespace ConsoleApplication1
{
    class MyClass
    {
        public int Year, Month, Day;
        public void Print()
        {
            Console.WriteLine("{0}년 {1}월 {2}일",Year,Month,Day);
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            MyClass test = new MyClass();
            test.Year = 2021;
            test.Month = 2;
            test.Day = 24;
            test.Print();
        }
    }
}
```
```
개념

생성자 constructor
객체를 생성할 때 자동으로 호출되는 메서드

소멸자 destructor
객체가 소멸될 때 호풀되는메서드

호출되는 시기

생성자 -> new
소멸자 -> 가비지 컬렉터

기본 생성자
- 클래스명과 같은 이름
- 리턴형 없음
- 접근 한정자는 public
```

```c#
namespace ConsoleApplication1
{
    class MyClass
    {
        string Message;

        public MyClass()
        {
            Message = "Hello World!!";
        }
        public void Print()
        {
            Console.WriteLine(Message);
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            MyClass test = new MyClass();
            test.Print();
        }
    }
}
```
```
생성자
 - 매개변수가 있음
 - 리턴형은 없음
 - 접근 한정자는 public
```
```c#
namespace ConsoleApplication1
{
    class MyClass
    {
        string Message;

        public MyClass(string InputMessage)
        {
            Message = InputMessage;
        }
        public void Print()
        {
            Console.WriteLine(Message);
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            MyClass test = new MyClass("Happy!");
            test.Print();
        }
    }
}
```

```
소멸자 형식

- 클래스명과 같음
- 리턴형 없음
- 접근 한정자 없음
- ~ 시작함
- class MyClass{
	~MyClass(){

	}
}

소멸자는 클래스에만 있음
소멸자는 오직 하나
소멸자는 상속 또는 오버로딩 될 수 없음
소멸자는 임의로 호출 불가
소멸자는 접근 한정자나 매개변수 없음
```
```c#
namespace ConsoleApplication1
{
    class MyClass
    {
        ~MyClass()
        {
            Console.WriteLine("소멸자 호출");
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            MyClass test = new MyClass();
        }
    }
}
```

```
언어에 따른 static 역할 비교

C: 변수 값 유지
C++ : 객체 안에서 변수 공유
C# : 객체를 생성하지 않고 멤버 사용
Console.WriteLine()
```
```c#
namespace ConsoleApplication1
{
    class MyClass
    {
        public static int number = 12;
        public static void Print() { Console.WriteLine("Hello World!"); }
    }
    class Program
    {
        static void Main(string[] args)
        {
            MyClass.Print();
            Console.WriteLine(MyClass.number);
            MyClass.number = 200;
            Console.WriteLine(MyClass.number);
        }
    }
}
```
```c#
//Main() 안에서 같은 멤버를 호출할 때

namespace ConsoleApplication1
{
    
    class Program
    {
        static string Message = "Hello World!";
        static void Print() { Console.WriteLine(Message); }
        static void Main(string[] args)
        {
            Print();
        }
    }
}
```
```
클래스 형태

선언한 클래스 -> 참조형 클래스 변수
MyClass MyRefTest;

new를 통한 생성한 클래스 -> 객체
MyClass MyTest = new MyClass();
MyRefTest = MyTest; // 참조
```
```c#
namespace ConsoleApplication1
{
    class MyClass
    {
        public int number;
        public MyClass()
        {
            number = 12;
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            MyClass MyTest = new MyClass();
            MyClass RefClass = MyTest;
            RefClass.number = 7;
            Console.WriteLine(MyTest.number);
        }
    }
}
```
#### this
```
객체 자신을 참조하는 키워드

사용 형식
this.member

메서드의 매개변수와 멤버 변수명이 같을 때
this.member_variable = 매개변수;
this.number = number;
----------	 --------
(멤버)		  (매개변수)


```
```c#
namespace ConsoleApplication1
{
    class MyClass
    {
        public int number;
        public MyClass(int number)
        {
            this.number = number;
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            MyClass MyTest = new MyClass(12);
            Console.WriteLine(MyTest.number);
        }
    }
}
```
#### 속성과 인덱서
```
속성의 의미와 역할
형식
예제
인덱서 의미와 역할
형식
예제

속성

- 속성의 일반적인 개념 : 사물의 특징이나 성질

역할

- 클래스 안의 멤버변수에 값 읽기 또는 저장

- 속성의 대상이 되는 멤버변수
 - private로 선언된 멤버변수

keyword
get,set,value,return

형식

변수와 동일하게 사용
대입연산자와 연산을 동일하게 사용가능


get, set 형식

속성 값 읽기와 저장 형식

[접근 한정자] 데이터형 속성명
{
	get{return 멤버변수;}
	set{멤버변수 = value;}
}

public int Count
{
	get{return count;}
	set{count=value;}
}

```

```c#
namespace ConsoleApplication1
{
    class A
    {
        private int number;
        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public int Number
        {
            get { return number; }
            set 
            {
                if(value <0 || value>9)
                {
                    number = 0;
                }
                else
                {
                    number = value;
                }
            }
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            A test = new A();
            test.Name = "Microsoft C#";
            test.Number = 9;
            Console.WriteLine("{0} {1}", test.Name, test.Number);
            test.Number = -7;
            Console.WriteLine(test.Number);
        }
    }
}
```
#### 인덱서 indexer
```
인덱스 : 색인
- 어떤 것을 뒤져서 찾아내거나 필요한 정보를 밝힘

역할

클래스 내의 배열 또는 컬렉션을 외부에서 접근할 수 있도록 하는 역할

키워드

속성 형식 	+ 	배열 형식
(get,set,return,value = this[int index])

사용방법

배열과 같이 사용
객체명[인덱스] = 값 또는 변수;
변수 = 객체명[인덱스];

형식

[접근 한정자] 데이터형 this[int index]
{
	set{}
	get{}
}
```
```c#
namespace ConsoleApplication1
{
    class A
    {
        private int[] number = new int[5];
        public int this[int index]
        {
            get { return number[index]; }
            set { number[index] = value; }
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            A test = new A();
            for(int i=0; i<5;i++)
            {
                test[i] = i;
                Console.Write(test[i]+ " ");
            }
        }
    }
}

```

```
인덱서 사용

컬렉션 ArayList
```
```c#
namespace ConsoleApplication1
{
    class A
    {
        ArrayList List = new ArrayList();
        public string this[int index]
        {
            get {
                if(index>=0 && index <List.Count)
                {
                    return (string)List[index];
                }
                else
                {
                    return null;
                }
            }
            set { 
                if(index >=0 && index<List.Count)
                {
                    List[index] = value;
                }
                else if(index == List.Count)
                {
                    List.Add(value);
                }
            }
        }
            public void Print(){
                foreach(string m in List)
                {
                    Console.Write(m +" ");
                }
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            A test = new A();
            test[0] = "A";
            test[1] = "B";
            test[2] = "C";
            test[3] = "D";
            test.Print();
            test[1] = "Hello World";
            test.Print();
        }
    }
}
```
#### 정리
```
속성

외부에서 접근하기 어려운 private, protected 멤버변수르 ㄹ외부에서 사용할 수 있도록 하기 위함
변수 수준

인덱서

- 멤버 중에서 배열 또는 컬렉션 등을 속성 형식으로 외부에서 사용할 수 있도록 하기 위함
속성 + 배열 = 인덱서


```

### 배열 형식 비교
```
일차원 배열 선언과 값 할당
int[] array; // 변수 (참조형)
array = new int[3] {1,2,3};
-----------------------------
int[] array = new int[]{1,2,3};
-----------------------------
int[] array= {1,2,3};


이차원, 다차원 배열 선언

int[,] array1 = new int[2,3];
int[,,] array2 = new int [2,3,2];

선언과 동시에 값 할당
int[,] array1 = new int[,]{{1,2},{3,4}};
int[,,] array2 = new int[,,]{
	{{1,2},{3,4}},
	{{5,6},{7,8}}
};


고정 배열 사용
array[1,0]=3;
array[0,1,3] =12;

가변 배열

형식
int[][] array = new int[2][];
array[0] = new int[4];
array[1] = new int[3];

array[0] = new int[]{1,2,3,4};
array[1]= new int[] {5,6,7};

선언과 동시에 값 할당
int[][] array = new int[][]{
	new int [3]{1,2,3},
	new int [2]{4,5}
};

int [][] array = new int[][]{
	new int[] {1,2,3},
	new int[] {4,5}
};

사용 형식
array[0][1]=12;
array[1][2][3]=13;

클래스 배열

형식
class A{....}

A[] TestArray = new A[3];
TestArray[0] = new A();
TestArray[1] = new A();
TestArray[2] = new A();

```

#### 델리게이트 (delegate) 와 이벤트 (event)
```
델리게이트의 의미
델리게이트의 형식과 사용
멀티캐스트 multicast 델리게이트
이벤트의 의미
이벤트의 형식과 사용
델리게이트와 이벤트의 비교


델리게이트 :  위임하다(권한, 임무들) 대리자, - 델리게이트의 본질은 메서드 참조형임

역할 

 복수 또는 단일 메서드를 대신하여
 호출하는 역할
 - > 같은 형식이어야함

 - 메서드만 호출 가능

 - 외부에서 호출 가능
 (privat, protected 메서드는 호출 불가)

 델리게이트 선언
 [접근 한정자] delegate return형 델리게이트형명(메서드 매개변수);
 delegate int DelegateType(string Name);

 사용
 델리게이트 생성(c#1.0 이상에서 사용)
 델리게이트형 델리게이트명 = new 델리게이트형명(호출할 메서드명)
 DelegateType DelegateMethod  = new DelegateType(Function);

 델리게이트 선언 (C# 2.0 이상에서 사용)
 델리게이트형 델리게이트명 = 호출할 메서드명;

 DelegateType DelegateMethod = Function;
```

### 멀티캐스트 델리게이트(multicast delegate)
```
역할
다수 또는 단일 메서드 호출

+=, -=

호출할 메서드 포함 또는 제거
```

```c#
namespace ConsoleApplication1
{
    delegate void DelegateType();
    class A
    {
        public void PrintA()
        {
            Console.WriteLine("PrintA");
        }
        public void PrintB()
        {
            Console.WriteLine("PrintB");
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            A Test = new A();
            DelegateType DelFunc = Test.PrintA;
            DelFunc += Test.PrintB;
            DelFunc();
            DelFunc -= Test.PrintB;
            DelFunc();
        }
    }
}
```
### event
```
특정 상황이 발생했을때 알리고자 하는 용도(호출을 의미+ 데이터)

델리게이트를 기반으로 함(메서드 호출)
이벤트는 메서드 안에서만 사용가능
```
```c#
namespace ConsoleApplication1
{
    delegate void DelegateType(string Message);
    class A
    {
        public event DelegateType EventHandler;
        public void Func(string Message)
        {
            EventHandler(Message);
        }
    }
    class B
    {
        public void PrintA(string Message)
        {
            Console.WriteLine(Message);
        }
        public void PrintB(string Message)
        {
            Console.WriteLine(Message);
        }
    }
    
    class Program
    {
        static void Main(string[] args)
        {
            A Test1 = new A();
            B Test2 = new B();

            Test1.EventHandler += new DelegateType(Test2.PrintA);
            Test1.EventHandler += new DelegateType(Test2.PrintB);
            Test1.Func("Good");
            Test1.EventHandler -= Test2.PrintB;
            Test1.Func("Hi~~");
            Test1.EventHandler -= Test2.PrintA;

            Test1.EventHandler += Test2.PrintA;
            Test1.EventHandler += Test2.PrintB;
            Test1.Func("Hello world");
        }
    }
}
```

### 이벤트 핵심

```
이벤트 핸들러에 객체의 메서드를 연결
이벤트 핸들러는 객체 메서드에서 호출
이벤트 핸들러를 포함하는 객체 안의 메서드를
통해 다른 객체 또는 같은 객체의 메서드를 호출하기 위한 방법(같은 데이터 전달)

```
```c#
namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.button1.Text = "Hi";
        }
        private void Test(object sender, EventArgs e)
        {
            MessageBox.Show("이벤트 테스트입니다");
        }
    }
}
```

###델리게이트와 이벤트 비교

```
공통점: 객체의 메서드 호출

델리게이트 차이점

델리게이트로 호출
델리게이트에 연결

이벤트 차이점

이벤트를 포함한 메서드에서 호출
이벤트 핸들러에 연결


속성 	인덱서

공통점: 객체의 멤버 변수를 R/W

속성 차이점

변수

인덱스 차이점

배열
```
#### 상속

```
의미
형식
상속 관계에서 생성자와 소멸자 호출
base, sealed
override 와 overload
추상 클래스
다형성
박싱과 언박싱

대상: 클래스

목적 : 클래스의 재사용 :(코드량 줄이기)

상속 클래스의 역할

부모 클래스 : 상속을 하는 클래스
(base class, parent class, 상위 클래스)

자식 클래스 : 상속을 받는 클래스
(child class, deriverd class, 파생 클래스)

상속 관계 표시 및 형식

Parent class
	  ↑			class A{...}
Child class
				class B:A{}

상위 클래스 접근제한

class A
{
	private 
	protected
	public
}

class B:A
{
	// B에서 접근 가능한 것: protected, public
	// Main과 같은 외부에서 접근 : public
}
```
```C#
namespace ConsoleApplication1
{
    class A
    {
        private void PrintPrivate()
        {
            Console.WriteLine("private");
        }

        protected void PrintProtected()
        {
            Console.WriteLine("protected");
        }
        public void PrintPublic()
        {
            Console.WriteLine("public");
        }
    }

    class B :A 
    {
        public void Print()
        {
            //PrintPrivate();
            PrintProtected();
            PrintPublic();
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            B Test = new B();
            Test.Print();
            Test.PrintPublic();
        }
    }
} 
```
```
상속 관계에서 생성자, 소멸자 호출

생성자 호출
상위 -> 하위

소멸자 호출
하위 -> 상위

base 키워드

역할

상위 클래스의 생성자 또는 멤버 변수 및 메서드 호출

활용

멤버 이름의 중복
하위에서 상위 설정 등(생성자 위주) 
```
#### Sealed
```
sealed
사용 의미
상속 불가에 대한 명시 (멤버변수, 메서드)

sealed 사용 형식

sealed class A{...}

class A{ sealed public void Print();}

class B:A{}
```
#### 오버라이드 Override
```
C#에서의 override 의미
상위 메서드를 무시하고  하위에서 재정의 하는 것

override 대상
클래스 메서드 > 속성, 인덱서, 이벤트

overrid 사용 형식

상위 클래스에서는 virtual 명시
하위 클래스에서는 override 명시
```
```c#
namespace ConsoleApplication1
{
    class A
    {
        public virtual void Print()
        {
            Console.WriteLine("A Print");
        }
    }
    class B:A
    {
       public override void Print()
        {
            Console.WriteLine("B Print");
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            B Test = new B();
            Test.Print();

            A Test1 = Test;
            Test1.Print();
        }
    }
} 
```
#### 오버로드 overload
```
역할 
하나의 메서드명에 다양한 매개변수 적용

장점
하나의 메서드로 다양한 값을 대입

형식
메서드명만 동일
매개변수는 임의로 적용

호출
메서드명과 매개변수로 호출

형식

class A
{
    public void Print(){...}
    public void Print(int number){...}
    public void Print(int num, float Pi){...}
}
Main(){}
 
```
#### 추상 클래스
```
의미
구현하려는 메서드의 형태만 존재하는 클래스

역할

추상 클래스는 구현 형태만 제공
실제 구현은 하위에서 구현

제한 사항
 추상클래스는 상속으로만 사용
 new를 통해 생성할 수 없음
 abstract가 있는 상위 메서드만 하위에서 모두 구현

 형식
 abstract class A
 {
    public abstract void Print();
    ...
 }

 class B:A
 {
    public override void Print()
    {
        구현..
    }
 }
```
#### 다형성
```
상위에서 하위 호출
class A
{
    public virtual void Print(){...}
}

class B:A
{
    public override void Print(){...}
}
A Test = new B();
Test.Print();
```

#### 박싱(boxing) 언박싱(unboxing)
```
박싱

값 형식을 object 형 변환(int, double, float...)

언박싱

object 형을 다시 값 형식으로 변환
cast를 사용하여 형을 

형식(1)
int a= 7;
object obj = a;
int result = (int)obj;

형식(2)
구조체도 값 형식이므로 박싱과 언박싱 됨
```
```c#
namespace ConsoleApplication1
{
  struct DATA
  {
      public string name;
      public int number;
      public DATA(string name, int number)
      {
          this.name = name;
          this.number = number;
      }
  }
    class Program
    {
        static void Main(string[] args)
        {
            int num = 3;
            object obj = num;
            int result = (int)obj;
            Console.WriteLine("{0} {1}", num, result);
            // ------------------------------------------

            DATA Test = new DATA("test", 3);
            object obj1 = Test;
            DATA Test1 = (DATA)obj1;
            Console.WriteLine("{0} {1}", Test1.name, Test1.number);
        }
    }
} 
```
```
클래스는 상속 관계에 있으므로 참조변환이 됨
(Upcasting, Downcasting)

박싱과 언박싱 구별
```
```c#

```
### 인터페이스

```
의미와 역할
특징 
형식

의미 : 접점, 접속
역할 : 모든 구현은 하위에서
형식 + 구현 = 상속

특징

구현 없이 형식만 포함
다중 상속 가능
상속으로만 사용하고 생성은 불가
이벤트, 인덱서, 메서드, 속성을 포함
기본 권한은 public

형식

관례적으로 대문자 I를 인터페이스명에 붙임

interface I인터페이스명
{
	.......
}

interfaceITest{
	void Print();
}

단일 상속 형식

interfaceITest{
	void Print();
}

class B: IA
{
	public void Print(){
		Console.WriteLine("interface");
	}
} 
```

``` c#
namespace ConsoleApplication1
{
      interface IA
      {
          void PrintA();
      }
    interface IB
    {
        void PrintB();
    }
    class C : IA, IB
    {
        public void PrintA()
        {
            Console.WriteLine("interface A");
        }
        public void PrintB()
        {
            Console.WriteLine("interface B");
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            C test = new C();
            test.PrintA();
            test.PrintB();
        }
    }
} 
```
#### 윈도우 프로그래밍
```
윈도우 폼과 코드 구조
자동 생성 코드 분석
Form 클래스

윈도우 폼

Program.cs : 윈폼 생성과 실행
Form.cs : 폼 프로그래밍
Form.Desinger.cs : 자동생성코드(이벤트처리, 컨트롤 속성 등..)

```
#### 이벤트 핸들러 & 출력

```
이벤트
개념 
delegate -> event
(외부)        (객체의 메서드 안)

윈도우 메시지에 따라 호출되는 이벤트는 결정 -> 자동생성 & 호출

WM_PAINT
-> event PaintEventHandler Paint
-> this.Paint += new System.Windows.Forms.PaintEventHandler(this.Form1_Paint)

속성창의 이벤트 아이콘
자동 생성 코드 사용

자동생성코드는 이벤트 핸들러는 속성창내에서 삭제
--> 내가 작성한 코드는 따로 삭제

자동생성코드 -> 툴에서 수정/삭제
내가 작성한 코드 -> 직접 삭제


```
#### 이벤트 핸들러 매개변수

```
위녿우 이벤트 핸들러는 모두 같은 형식

private void Form1_Paint(object sender, PaintEventArgs e)

- sender
  이벤트를 호출하는 객체 참조
  object는 최상위 클래스
        -> boxing -> unboxing

- e
 이벤트에 관련된 정보를 제공하는 클래스

 System.Object
    System.EventArgs

화면 출력 과정
WM_PAINT -> Paint event
-> paint event handler
-> 이벤트 처리 메서드
Form1_Paint()
{
    ....
}

Graphics
- 출력객체
- e.Graphics 를 통해 get
public Graphics Graphics{get;}

DrawString()기본
DrawString(string s, Font font, Brush brush, float x, float y)
font : Control.Font 속성 설정
brush : Brushes.Black 


도형 출력

Graphics에서 제공
선: DrawLine()
원형 : DrawEllipse()
사각형 : DrawRectangle()

Pen 선그리기 객체

```

#### 키보드
```
키 이벤트 처리

keyDown
KeyPress

동작: 눌림과 놓임

키 구분

문자키 : A~Z , a~z , 0~9, Space bar, + 등
기능키 : F1 ~ F12, Ctrl, Shift, Alt, Insert 등

키 관련 메시지
WM-CHAR, WM_KEYDOWN,WM_KEYUP

키 관련 이벤트
KeyDown, KeyUp, KeyPress

키 눌림 이벤트
KeyDown

문자키 눌림 이벤트(대소문자 구분)
KeyPress

메시지 박스 활용
각종 값 또는 이벤트를 확인하기 위해 사용

MessageBox.Show("문자열");

키 눌림과 문자키 입력 확인

- KeyDown + MessageBox(키 눌림)
- KeyPress + MessageBox(문자키 눌림)

KeyDown 이벤트

키 눌림을 위한 이벤트
Keys 열거형으로 키 구분

Keys 열거형

MSDN 검색
문자키는 모두 대문자
Keys.A, Keys.B

키 구분

이벤트 형식
Form1_KeyDown(object sender,KeyEventArgs e)
Alt
control
Shift
KeyCode : KeyDown 또는 KeyUp에 대한 Keys 열거값 Control, Alt,Shift 키 정보가 없음
KeyData : 동시에 누른 키의 조합 ==> '|' 연산자로 조합
KeyModifiers : Control, Alt, Shift 키 조합 --> '|' 연산자로 조합


KeyCode

 키보드 키에 대한 Keys 열거값

 Keys.A, Keys.D0, Keys.F1 등
 Alt,Control,Shift 정보가 없음

 KeyCode의 Alt, Control, Shift 보완?
 
 - KeyEventArgs 속성 활용
 e.Alt, e.Control, e.Shift
 && 와 || 로 조합

 Modifiers
 보조 플래그 Alt, Control, Shift 조합

 KeyCode 키와 Alt, Control, Shift 조합
 e.Modifiers
 비트연산자 '|'로 키 조합
 e.Modifiers==(Keys.Shift|Keys.Control) 

 KeyData

 키 값과 Alt, Control, Shift 정보 포함
 키 값과 보조 플래그의 조합은 '|' 사용

 KeyPress

 이벤트 형식

 Form1_KeyPress(object sender, KeyPressEventArgs e)

 문자키의 대소문자를 구분
 문자 ASCII값과 유니코드 값이 같음
 WM_CHAR 메시지 발생
 이벤트 메서드
 private void Form1_KeyPress(object sender, KeyPressEventArgs e)
 {

 }

 KeyChar 속성

 public char KeyChar{get; set;}
 ASCII 값을 리턴
 문자키를 입력받아 화면에 출력
```

#### 마우스
```
이벤트 처리
좌표 출력
삼각형 출력
드래그

click vs MouseClick

Click : 마우스 클릭

MouseClick : 컨트롤 위에서 마우스 클릭

폼도 컨트롤을 상속하므로 폼위에서 클릭은
click() -> MouseClick()

마우스의 좌표 출력

MouseMove 이벤트
MouseEventArgs X, MouseEventArgs.Y

이벤트 발생 순서

MSDN
폼에서 발생하는 클릭 이벤트 순서

마우스 클릭

MouseDown -> Click -> MouseClick -> MouseUp

마우스 더블 클릭

MouseDown -> Click -> MouseClick -> MouseUp-> MouseDown -> DoubleClick -> MouseDoubleClick -> MouseUp
```

```C#
namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        string strMousePos;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_MouseMove(object sender, MouseEventArgs e)
        {
            strMousePos = "X:" + e.X + " Y:" + e.Y;
            Invalidate();
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
            e.Graphics.DrawString(strMousePos, Font, Brushes.Black, 10, 10);
        }
    }
}

```

```c#
//삼각형 출력

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        List<Point> ListPoint = new List<Point>();
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
            if(ListPoint.Count==3)
            {
                e.Graphics.DrawLine(Pens.Black, ListPoint[0], ListPoint[1]);
                e.Graphics.DrawLine(Pens.Black, ListPoint[1], ListPoint[2]);
                e.Graphics.DrawLine(Pens.Black, ListPoint[2], ListPoint[0]);
            }
        }

        private void Form1_MouseDown(object sender, MouseEventArgs e)
        {
            Point pt = new Point(e.X, e.Y);
            if(ListPoint.Count==3)
            {
                ListPoint.Clear();
            }
            ListPoint.Add(pt);
            Invalidate();
        }
    }
}

```

```
MouseEventArgs 속성

 누른 마우스 버튼의 값을 가져옴
 MouseButtons 열거형
 Left,Middle,None, Right

 X,Y
  마우스의 x,y 좌표

 Location
  마우스의 위치

 Delta
  마우스 휠의 회전수
```

```c#
// 마우스 드래그

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        Rectangle rectMouse;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
            string str =
                "legt: " + rectMouse.X +
                "top: " + rectMouse.Y +
                "right: " + rectMouse.Right +
                "bootom: " + rectMouse.Bottom;
            e.Graphics.DrawRectangle(Pens.Black, rectMouse);
            e.Graphics.DrawString(str,Font,Brushes.Black,10,10);
        }

        private void Form1_MouseDown(object sender, MouseEventArgs e)
        {
            rectMouse.X = e.X;
            rectMouse.Y = e.Y;
            rectMouse.Width = 0;
            rectMouse.Height = 0; 
            Invalidate();
        }

        private void Form1_MouseMove(object sender, MouseEventArgs e)
        {
            if(e.Button == MouseButtons.Left)
            {
                rectMouse.Width = e.X - rectMouse.X + 1;
                rectMouse.Height = e.Y - rectMouse.Y + 1;
                Invalidate();  
            }
        }
    }
}
```

#### GDI+
```
GDI+
Graphics
Color
Pen
Brush


GDI
(Graphics Device Interface) -> OS의 영역
GDI+ -> .NET은 Graphics가 담당

Graphics 사용 방법 2가지
- paint() 이벤트
e.Graphics()

- CreateGraphics() 사용
 Graphics 참조 변수 생성

 CreateGraphics() 언제 사용?
 paint 이베트 외의 메서드

 Graphics 개체를 만들려면

 폼또는 컨트롤의 Paint이벤트에서 PaintEventArgs의 일부로 Graphics 개체에 대한 참조를 받음.
 이방법은 대개 컨트롤을 그리는 코드를 작성할 때 Graphics 개체에 대한 차조를 가져오는데 사용
 마찬가지로 PrintDocument에 대한 PrintPage 이벤트를 처리할 때 PrintPageEventArgs의 속성으로 그래픽 개체를 가져올 수 있음

 폼 또는 컨트롤의 CreateGraphics 메서드를 호출하여 해당 폼이나 컨트롤의 그리기 화면을 나타내는 Graphics 개체에 대한 참조를 가져옴.
 이미 있는 폼이나 컨트롤에서 그리려는 경우 이 방법을 사용

CreateGraphics()사용

원형
public Graphics CreateGraphics()

namespace -> System.Windows.Forms

사용한 후에는 되도록 Graphics.Dispose() 호출

사용하는 방법

Graphics 객체를 참조
Graphics 메서드로 출력

```
```c#
// 마우스 클릭마다 원 출력(Paint)

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        Point[] ptCircle;
        int nCount;
        public Form1()
        {
            InitializeComponent();
            ptCircle = new Point[100];
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
            for(int i=0;i<nCount;i++)
            {
                e.Graphics.DrawEllipse(Pens.Black, ptCircle[i].X - 10, ptCircle[i].Y - 10, 20, 20);
            }
        }

        private void Form1_MouseClick(object sender, MouseEventArgs e)
        {
            ptCircle[nCount].X = e.X;
            ptCircle[nCount].Y = e.Y;
            nCount++;
            Invalidate();
        }

    }
}

```
```C#
//CreateGraphics 메서드이용
namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        Point[] ptCircle;
        int nCount;
        public Form1()
        {
            InitializeComponent();
            ptCircle = new Point[100];
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
            for(int i=0;i<nCount;i++)
            {
                e.Graphics.DrawEllipse(Pens.Black, ptCircle[i].X - 10, ptCircle[i].Y - 10, 20, 20);
            }
        }

        private void Form1_MouseClick(object sender, MouseEventArgs e)
        {
            ptCircle[nCount].X = e.X;
            ptCircle[nCount].Y = e.Y;

            Graphics g = CreateGraphics();
            g.DrawEllipse(Pens.Black, ptCircle[nCount].X - 10, ptCircle[nCount].Y - 10, 20, 20);
            nCount++;
            g.Dispose();
        }

    }
}
```
#### Color 구조체

```
Color Struct

사용 용도

펜,브러시의 색상 설정에 사용

Color 속성 사용하여 색상 설정

AliceBlue,AntiqueWhite,Aqua 등..

속성을 통한 색상 설정, Color 리턴

사용자 정의할 수 있는 색상
FromArgb()
FromArgb(int alpha,int red,int green, int blue);

시스템 색상에서 A,R,G,B 가져오기
Color.색상.A, Color.색상.R, Color.색상.G,Color.색상.B

public byte A{get;}
public byte R{get;}
public byte G{get;}
public byte B{get;}
```
```c#
namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        Point[] ptCircle;
        int nCount;
        public Form1()
        {
            InitializeComponent();
            ptCircle = new Point[100];
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
            string str =
                "Alpha: " + Color.Blue.A +
                " Red: " + Color.Blue.R +
                " Green: " + Color.Blue.G +
                " Blue: " + Color.Blue.B;
            e.Graphics.DrawString(str, Font, Brushes.Black, 10, 10);
        }

    }
}

```

```
Pen

Pen -> 생성
Pens -> 기본 제공 펜

Pen 생성자
Pen(Brush), Pen(Color)
Pen(Brush,Single), Pen(Color,Single)

Pen 해제
Dispose()

Pen과 Pens 사용 예

```
```c#
namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
            Color myColor = Color.FromArgb(255, 0, 0);
            Pen newPen = new Pen(myColor);
            newPen.Width = 5.0f;
            e.Graphics.DrawLine(newPen, 10, 10, 100, 10);
            e.Graphics.DrawLine(Pens.Blue, 10, 20, 100, 20);
            newPen.Dispose();
        }
    }
}
```

```
펜 스타일

DashStyle 속성 사용
public System.Drawing.Drawing2D.DashStyle DashStyle{get; set;}

using System.Drawing.Drawing2D 선언

DashStyle 열거형 리턴
Cystom
Dash
DashDot
DashDotDot
Dot
Solid

```

```c#
namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
            Pen myPen = new Pen(Color.Black, 3.0f);
            myPen.DashStyle = DashStyle.DashDot;
            e.Graphics.DrawLine(myPen, 10, 10, 200, 10);
            myPen.DashStyle = DashStyle.Dot;
            e.Graphics.DrawLine(myPen, 10, 20, 200, 20);
            myPen.DashStyle = DashStyle.DashDotDot;
            e.Graphics.DrawLine(myPen, 10, 30, 200, 30);
        }
    }
}

```

```
브러쉬

역할
도형 내부를 색 또는 패턴으로 채우는 역할


브러시 종류

SolidBrush, HatchBrush 등..

브러시를 요구하는 메서드의 공통점
Fill~~~ 로 시작


SolidBrush : 단색 브러시

도형 전체를 하나의 색으로 채움

HatchBrush : 패턴 브러시

격자 패턴으로도형을 채우는 브러시

```