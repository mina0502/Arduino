##### 데이터베이스
```
데이터베이스

여러 사람이 공유할 목적으로 통합하여 관리하는 데이터 집합

데이터베이스 관리 시스템(DBMS) : 
MS SQL Server , Oracle, MySQL

테이블 : 테이블은 실제 데이터를 저장하는 집합의 대표명, 레코드의 집합 
레코드 : 테이블의 각 행을 말하고 코드도 행이라는 명칭으로 많이 사용
필드 : 레코드는 다수의 항목으로 구성되며 이 항목을 필드라고 함
컬럼 : 컬럼은 필드(열)을 구분하기 위한 대표명

```
#### ADO.NET 개요
```
역할
 - 데이터베이스를 직접 접속(응용 프로그램은 코드만 제공)
 DBMS가 달라져도 코드에 영향 없음
 - 데이터베이스 관련 라이브러리 제공

 ADO.NET

 연결형 
  - 실시간으로 연결된 형태
  - 다수 접속시 서버 부하가 높음

 비연결형(메모리형 데이터베이스)
 데이터를 읽거나 쓸 때만 연결하는 형태

 필요에 따라 연결형과 비연결형 선택


 ADO.NET 구성요소

 Data Provider (데이터 공급자)
 DB 접속, 읽기, 조작에 관여

 Data Set(데이터셋)
 비연결형의 메모리형 데이터베이스

 ADO.NET Dataa Provider 구성요소

 SqlConnection
 SQL Server와 데이터베이스에 연결

 SqlCommand
 SQL명령 실행

 SlDataReader
 연결성 데이터베이스로 연결 및 순방향 읽기

 SqlDataAdapter
 비연결성 데이터베이스로 연결 및 DataSet에 데이터 저장


연결형식별 ADO.NET Data Provider 구성요소 조합

연결형 
SqlConnection, SqlCommand, SqlDataReader

비연결형
SqlConnection, DataAdapter, DataSet

ADO.NET 네임스페이스

System.Data
기본 네임 스페이스

System.Data.SqlClient
SQL Server 7.0 이상에서 지원하는 .NET Framework Data Provider

System.Data.SqlTypes
SQL Server 데이터형 클래스


SqlConnection 연결

생성자를 통해 연결
SqlConnection(String)

생성자 + ConnectionString
SqlConnection()

연결문자열 만들기
 - 대소문자 구분하지 않음
 - MSDN 참조
 - 기본적인 연결 문자열

SqlConnection 연결문자열

data source 또는 Server
data source = .\\SQLEXPRESS;
			 (local)\SQLEXPRESS;
			 (localhost)\SQLEXPRESS

initial catalog 또는 database
database= 데이터베이스명

SqlConnection 연결문자열

integrated security 또는 trusted_connection
- 사용자 ID와 암호 사용
integrated security=false
- 윈도우 인증
integrated security = true;
생략시에는 false로 기본 설정

SqlConnection 연결문자열

user id 또느 uid
SQL 로그인 계정

password 또는 pwd
비밀번호

connect timeout 또는 connection timeout 또는 timeout= 초
연결 대기시간으로 기본은 15초

기본적인 연결 문자열
"server=.\\SQLEXPRESS;database=test;uid=sa;pwd=12345;"

데이터베이스 연결 열기
public override void Open()

데이터베이스 버전 및 상태 출력
 - ServerVersion 속성
 - State
   public override ConnectionState State{get;}
   public enum ConnectionState
   ==> Broken, Open, Closed, Connecting, Executing

데이터베이스 연결 닫기
public override void Close()

접속 -> 열기 -> 처리 -> 닫기


연결형 데이터베이스 프로그래밍 (SqlCommand, SqlDataReader 사용)
ADO.NET --> class 라이브러리 제공

database <---- SqlConnection    -----------  SqlCommand     <  ----  > SqlDataReader
                                -----------  DataAdapter    <  ----  > DataSet

개념 정리
SqlCommand
SqlDataReader
실습

연결형 구조

SqlCommand 
역할
데이터베이스에 대해 SQL 문을 실행

SqlCommand SQL문 설정 방법

SqlCommand 생성 + CommandText 속성에 SQL문 설정
SqlCommand 생성할 때 SQL문 설정

생성자
SqlCommand()
SqlCommand(String)
SqlCommand(String, SqlConnection)
    SqlConnection 접속 -> String SQL 실행


SqlCommand 주요속성

CommandText
SQL 실행 및 저장 프로시저 읽기/설정

Connection
SqlConnection 설정 or 가져오기

CommandType
CommandText 속성을 다룰 형식으로 설정 or 가져오기
    - CommandTpre.Text : SQL문 <-- 기본값
    - CommandType.TableDirect : 테이블명령
    - CommandType.StoredProcedure : 프로시저 명령

** 프로시저: 어떤 업무를 수행하기위한 절차


SqlCommand 주요 메서드

ExecuteNonQuery()
 SQL문을 실행 했을 떄 실행된 행의 수를 리턴

ExecuteReader()
 CommandText의 SQL문을 Connection에 보내고 SqlDataReader를 생성

그외에 ExecuteXmlReader 등...


SqlDateReader 

역할 
 데이터베이스에서 전용 행 스트림으로 읽는 역할
 (삽입, 삭제등은 할 수 없음)


 SqlDataReader 주요 속성

 Connection
  SqlConnection과 연결된 SqlDataReader를 가져옴

 FieldCount
  현재 행의 열 수를 가져옴

HasRows
 SqlDataReader로부터 하나 이상의 행 포함 여부를 체크(true,false)

RecordsAffected
 변경, 삽입 및 삭제 된 행의 개수를 가져옴, 없으면 0

SqlDataReader 주요 메서드

public override bool Read()

다음 레코드로 이동하는 역할
처음 읽은 위치가 첫 번째 레코드 앞에 있으므로
Read()후에 데이터 읽으면 됨

Reader["Name"] or Reader[0]형식으로 읽음
레코드가 없으면 false 리턴

Close()
SqlDataReader 객체 닫기


SqlConnection, SqlCommand, SqlDataReader 관계


1. 데이터베이스 만들기
    데이터베이스명 --> school

create database school;
use school;


2. 테이블 만들기 

create table tblStudent
(
    varcha(10) name,
    number age,
    bit male
);

MS SQL --> tblStudent

nchar: 고정길이 유니코드 문자열(고정길이), 1~4000자

nvarchar: 가변길이 유니코드 문자열(문자열에 따라 가변길이), 1~4000자 안에서 길이지정, 2G까지 가능

3. 데이터 입력하기

insert into tblStudent values("아무개",20,0);
insert into tblStudent values("이태성",30,1);
insert into tblStudent values("나우",15,1);

Select * FROM tblStudent;




Console에서 출력

SqlConnrction 접속

SqlCommand SQL문

SqlDataReader 읽기

출력

```
```c#
static void Main(string[] args)
{
    SqlConnection Conn = new SqlConnection();
    Conn.ConnectionString="server=.\\SQLEXPRESS;database=school;uid=sa;password=12345";
    Conn.Open();
    SqlCommand Command = new SqlCommand("SELECT * FROM tblStudent",Conn);
    sqlDataReader Reader = Command.ExecuteReader();
    while(Reader.Read())
    {
        Console.WriteLine("{0} {1} {2}",Reader["Name"],Reader[1],Reader["Male"]);
    }
    Reader.Close();
    Conn.Close();
}
```
```
SQL 데이터 삽입 및 출력

SqlCommand 사용한 SQL

ExecuteNonQuery() : 삽입 실행

SqlDataReader 사용 : 읽기 -> 출력

```
```c#
static void Main(string args[] )
{
    SqlConnection Conn = new SqlConnection();
    Conn.ConnectionString = "server=.\\SQLEXPRESS;database=school;uid=sa;password=12345";
    Conn.Open();
    string strSQL1="INSERT INTO tblStudent VALUES('이민우',25,1)";
    string strSQL2="INSERT INTO tblStudent VALUES('김지우',41,0)";

    SqlCommand Command = new SqlCommand(strSQL1,Conn);
    Command.ExecuteNonQuery();
    Command.CommandText=strSQL2;
    Command.ExecuteNonQuery();

    Command.CommandText = "SELECT * FROM tblStudent";
    SqlDataReader Reader = Command.ExecuteReader();
    while(Reader.Read())
    {
        Console.WriteLine("{0} {1} {2}",Reader.["Name"],Reader[1],Reader[2]);
    }
    Reader.Close();
    Conn.Close();
}

```

```c#
// SQL 문 입력 받아 실행하는 툴 만들기
// 실행버튼
private void button1_Click(object sender, EventArgs e)
{
    SqlConnection Conn = new SqlConnection();
    Conn.ConnectionString = "server=.\\SQLEXPRESS;database=school;uid=sa;password=12345";
    Conn.Open();
    SqlCommand Comm= new SqlCommand(textBox1.Text,Conn);
    Comm.ExecuteNonQuery();
    Comm.CommandText="SELECT * FROM tblStudent";
    SqlDataReader Reader = Comm.ExecuteReader();
    listView1.Clear();

    string strRecord;
    while(Reader.Read())
    {
        strRecord= string.Format("이름:{0} 나이:{1} 성별{2}",Reader[0],Reader[1],Reader["male"]);
        listView1.Items.Add(strRecord);
    }
    Reader.Close();
    conn.Close();
}

/*
 SQL문
    INSERT INTO tblStudent VALUES('우차차',8,1);
                                                    실행
결과 보기

    이름:아무개 나이:20 성별:False
    이름:이태성 나이:30 성별:True
    이름:나우 나이:15 성별:True
    이름:우차차 나이:8 성별:False

*/
```

```
비연결형 데이터베이스(1)

개요
DataTable
DataGridView

구성요소

 SqlConnection : 연결

 SqlDataAdapter : 조회, 저장, 수정, 삭제
    SqlCommand : SQL 실행
 
 DataSet : DataTable 집합
    DataTable : 데이터베이스 테이블
    DataRow : 행(레코드)
    DataColumn : 열 (컬럼 단위)

DataSet ⊃ DataTable ⊃ DataRow, DataColumn


DataTable -> DataSet -> SqlDataAdapter


DataTable

개념
메모리형 데이터 집합

구조
데이터베이스의 테이블과 동일한 구조

역할
서버 테이블의 내용 저장 & 관리(수정,삽입,삭제)

DataTable

네임스페이스

System.Data


DataTable 생성과 해제

DataTable table = new DataTable("table1");

table.Dispose();

DataColumn : 개별항목
테이블의 항목과 데이터형 설정

DataColumn()
DataColumn(String)
DataColumn(String,Type)
DataColumn(String,Type,String)
DataColumn(String,Type,String,MappingType)



SQL 서버 타입   |   닷넷 타입
--------------------------------

INT            |    Int32

BIGINT         |    Int64

VARCHAR        |    String

DATETIME       |    DateTime

BIT            |    Boolean

DECIMAL        |    Decimal

VARBINARY      |    byte[]



DataColum : 개별항목

DataColumn 항목 생성과 설정

열 이름        Name          Age     Male
데이터 형식    varchar(10)   int     bit

static void Main(stirng[] args)
{
    DataTable table1= new DataTable("table1");
    DataColumn col1 = new DataColumn("Name",ytpeof(string));
    Col1.MacxLength=10;
    Col1.AllowDBNull=false;
    table1.Columns.Add(Col1);
    Col1=new DataColumn("Age",typeof(int));
    table1.Columns.Add(Col1);
    Col1= new DataColumn("Male",typeof(bool));
    table1.Columns.Add(Col1);

}
    DataRow: 레코드

    DataRow
    행 데이터

    DataRow 생성과 데이터 입력

    DataRow row = new table1.NewRow();// 테이블과 같은 속성
    row["Name"] ="철수";
    row["Male"] = 12;
    row["Male"]=true;
    talble1.Rows.Add(row);    --> DataTable.DataRowCollection


Datatable

DataRow 원소 다루기
배열 형식 + 컬럼명
row["컬럼명"] --> 결과는 모두 string형

```

```c#
// 행의 내용 출력

static void Main(string[] args)
{
    // 1단계 DataTable과 DataColumn 만들기

    DataTable table1 = new DataTable("Table1");
    DataColumn Col1 = new DataColumn("Name",typeof(string));
    table1.Colums.Add(Col1);
    Col1= new DataColumn("Age",typeof(int));
    table1.Columns.Add(Col1);
    Col1 = new DataColumn("Male", typeof(bool));
    table1.Columns.Add(Col1);

    // 2단계 행 생성 및 입력
    DataRow row = table1.NewRow();
    row.["Name"]="철수";
    row["Age"]=12;
    row["Male"]=true;
    talbe1.Rows.Add(row);

    row=table1.NewRow();
    row.["Name"]="수지";
    row.["Age"]=11;
    row.["Male"]=false;
    table1.Row.Add(row);

    row=table1.NewRow();
    row.["Name"]="차돌";
    row.["Age"]=9;
    row.["Male"]=true;
    table1.Row.Add(row);
    table1.AcceptChanges(); // 데이터 안에 변경됬다는 것을 알림

    foreach(DataRow PrintRow in table1.Rows)
    {
        string str;
        if(PrintRow["Male"].Tostring()=="True")
        {
            str="남자";
        }
        else
        {
            str="여자";
        }
        Console.WriteLine("이름:{0} 나이:{1:d2} 성별:{2}",PrintRow["Name"],PrintRow["Age"],str);
    }
}
```
```
DataTable 행 검색 #1

DataTable.Select()
    public DataRow[] Select(string filterExpression)

필터 만들기
 
 - 숫자는 비교문으로 문자열 만듬
 string Filter = "Age >= 12";

 - 문자열 비교는 작은 따옴표 명시
 string Filter = "Name = '철수'";
 string Filter ="Name='"+textBox1.Text+"'";


```
```c#
static void Main(string[] args)
{
    // 1단계 DataTable과 DataColumn 만들기

    DataTable table1 = new DataTable("Table1");
    DataColumn Col1 = new DataColumn("Name",typeof(string));
    table1.Colums.Add(Col1);
    Col1= new DataColumn("Age",typeof(int));
    table1.Columns.Add(Col1);
    Col1 = new DataColumn("Male", typeof(bool));
    table1.Columns.Add(Col1);

    // 2단계 행 생성 및 입력
    DataRow row = table1.NewRow();
    row.["Name"]="철수";
    row["Age"]=12;
    row["Male"]=true;
    talbe1.Rows.Add(row);

    row=table1.NewRow();
    row.["Name"]="수지";
    row.["Age"]=11;
    row.["Male"]=false;
    table1.Row.Add(row);

    row=table1.NewRow();
    row.["Name"]="차돌";
    row.["Age"]=9;
    row.["Male"]=true;
    table1.Row.Add(row);
    table1.AcceptChanges(); // 데이터 안에 변경됬다는 것을 알림

   DataRow[] SelectedRow = table1.Select("Age>=10");
   if(SelectedRow.Length>0)
   {
    foreach(DataRow PrintRow in SelectedRow)
    {
        string str;
        if(PrintRow["Male"].ToString()=="true")
        {
            str="남자";
        }
        else
        {
            str="여자";
        }
        Console.WriteLine("이름:{0} 나이:{1:d2} 성별:{2}",PrintRow["Name"],PrintRow["Age"],str);
    }
   }
}
```
```
DataTable 행 검색 #2

DataTable.Rows.Find()
 - DataTable.Select()에 비해 활용도가 낮음
 - 반드시 기본 키 값이 있어야만 함

기본키 설정
 - DataTable.PrimaryKey에 컬럼 설정
 public DataColumn[] PrimaryKey{get;set;}

```

```C#
static void Main(string[] args)
{
    // 1단계 DataTable과 DataColumn 만들기

    DataTable table1 = new DataTable("Table1");
    DataColumn Col1 = new DataColumn("Name",typeof(string));
    table1.Colums.Add(Col1);
    table.PrimaryKey = new DataColumn[] {Col1};

    Col1= new DataColumn("Age",typeof(int));
    table1.Columns.Add(Col1);
    Col1 = new DataColumn("Male", typeof(bool));
    table1.Columns.Add(Col1);

    // 2단계 행 생성 및 입력
    DataRow row = table1.NewRow();
    row.["Name"]="철수";
    row["Age"]=12;
    row["Male"]=true;
    talbe1.Rows.Add(row);

    row=table1.NewRow();
    row.["Name"]="수지";
    row.["Age"]=11;
    row.["Male"]=false;
    table1.Row.Add(row);

    row=table1.NewRow();
    row.["Name"]="차돌";
    row.["Age"]=9;
    row.["Male"]=true;
    table1.Row.Add(row);
    table1.AcceptChanges(); // 데이터 안에 변경됬다는 것을 알림

    DataRow FindRow = table1.Rows.Find("철수");
    if(FindRow !=null)
    {
        string str;
        if(PrintRow["Male"].Tostring()=="True")
        {
            str="남자";
        }
        else
        {
            str="여자";
        }
        Console.WriteLine("이름:{0} 나이:{1} 성별:{2}",PrintRow["Name"],PrintRow["Age"],str);
    }
}
```
```
DataGridView

표에 데이터를 표시하는 컨트롤
지정한 DataTable의 모든 내용을 표에 출력

주요 속성

DataGridView.DataSource

출력할 DataTable 설정

DataGridView1.DataSource = table1;

DataGridView 행 선택 모드 변경

DataGridView를 이용한 행 삭제
 - DataRow를 삭제하는 방법

 1) DataRow.Delete()
        해당 행의 RowState속성을 Deleted로 바꿀뿐
        삭제 하지 않음, 삭제 취소가 가능
    --> AcceptChanges()호출 : 영구 삭제

DataGridView를 이용한 행 삭제
 - DataGridView에서 삭제하는 방법
 -DataGridView와 DataTable이 서로 연동


 DataGridViewRow로 삭제
 DataGridView.Rows.Remove()



```

#### 비연결형 데이터베이스(2)
```
DataSet

SqlDataAdapter

DataSet.Fill() 와 DataSet.Update()

SqlCommand 와 SqlCommandBuilder

관계형데이터베이스 처리



DataSet

다수의 테이블 관리 -> DataSet.DataTables 컬렉션

특징 
  테이블명 대소문자 구별
  XML 형식으로 데이터 읽기/ 출력 가능
  데이터 관게 설정 가능(DataRelation)

DataSet 테이블 관계 설정 방법

  코드
  마법사(Wizard) --> 코드


네임스페이스
 System.Data

 주요 속성

 DataSetName: 데이터셋 이름 설정

 Tables
    public DataTableCollection Tables{get;}

DataSet생성
    public DataSet(string dataSetName)

Table 추가
    public DataTableCollection Tables{get;}

DataTableCollection.Add()
:   public void Add(DataTable table)


DataSet에 Table, 컬럼 설정

DataSet1 = new DataSet("Info")
DataSet1.Tables.Add(new DataTable("Table1"));
DataSet1.Tables.Add(new DataTable("Table2"));

DataColumn Col;
Col= new DataColumn("id",typeof(string));
Col.MaxLength = 10;
Col.Unique = true;
DataSet1.Tables[0].Columns.Add(Col);
DataSet1.Tables[0].PrimaryKey = new DataColumn[]{Col};

Col= new DataColumn("pwd",typeof(string));
Col.MaxLength=8;
DataSet1.Table[0].Columns.Add(Col);
Col= new DataColumn("name",typeof(string));
Col.MaxLength= 15;



관계형 데이터베이스

개요
테이블 사이에 중복된 데이터를 줄이기 위해 
관계를 설정하여 테이블을 다루는 데이터베이스

기본키(Primary key)와 외래 키(Foreign Key)
기본키 : 중복되지 않는 테이블의 대표 컬럼
외래키 : 기본키와 관계를 맺을 수 있는 컬럼

삭제 --> 자식부터 삭제

DataSet

기본키 설정
Table.PrimaryKey 속성에 설정

DataColumn Col;
Col= new DataColumn("id",typeof(string));
Col.MaxLength= 10;
Col.Unique=true;
DataSet1.Tables[0].Columns.Add(Col);
DataSet1.Tables[0].PrimaryKey = new DataColumn[]{Col};


외래키 설정
ForeignKeyConstraint 클래스 사용

public ForeignKeyConstraint(string constraintName, DataColumn parentColumn, DataColumn childColumn)

외래 키 설정 소스
생성 후에 DataSet.Table.Constraints.Add()에 컬럼 설정

ForeignkeyConstraint Fk = new ForeignkeyConstraint("FK",Parent Column, Child Column);
DataSet.Tables[1].Constraints.Add(FK);  

```

``` C#
Col = new DataColumn("id",typeof(string));
Col.MaxLength = 10;
DataSet1.Tables[1].Columns.Add(Col);
ForeignKeyConstraint FK = new ForeignKeyConstraint("FK", DataSet1.Tables[0].Columns["id"],Col);
DataSet1.Tables[1].Constraints.Add(FK);

Col= new DataColumn("fruit_name",typeof(string));
Col.MaxLength=20;
DataSet1.Tables[1].Columns.Add(Col);
```
```
관게형 데이터베이스 실습 Table 구조

1. DataSet, DataTable, DataColumn, PrimaryKey, Foreign Key 설정

2. 버튼에 따른 기능 코드 작성

```

```c#
namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {
        DataSet DataSet1;
        DataRelation Relation1;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            DataSet1 = new DataSet("Info");
            DataSet1.Tables.Add(new DataTable("Table1"));
            DataSet1.Tables.Add(new DataTable("Table2"));

            // 테이블1
            DataColumn Col;
            Col = new DataColumn("id",typeof(string));
            Col.MaxLength=10;
            Col.Unique=true;
            DataSet1.Tables[0].Columns.Add(Col);
            DataSet1.Tables[0].PrimaryKey = new DataColumn[]{Col};

            Col= new DataColumn("pwd",typeof(string));
            Col.MaxLength=8;
            DataSet1.Tables[0].Columns.Add(Col);
            Col= new DataColumn("name",typeof(string));
            Col.MaxLength= 15;
            DataSet1.Tables[0].Columns.Add(Col); 

            DataRow Row;
            Row = DataSet1.Tables[0].NewRow();
            Row["id"]="12345";
            Row["ppwd"]="12345";
            Row["name"]="대한";
            DataSet1.Tables[0].Rows.Add(Row);

            Row=DataSet1.Tables[0].NewRow();
            Row["id"]="22222";
            Row["pwd"]="12345";
            Row["name"]="민국";
            DataSet1.Tables[0].Rows.Add(Row);

            // 테이블2

            Col= new DataColumn("id",typeof(string));
            Col.MaxLength=10;
            DataSet1.Tables[1].Columns.Add(Col);
            ForeignKeyConstraint FK = new ForeignKeyConstraint("FK",DataSet1.Tables[1]);
            DataSet1.Tables[1].Constraints.Add(FK);

            Col= new DataColumn("fruit_name",typeof(string));
            Col.MaxLength=20;
            DataSet1.Tables[1].Columns.Add(Col);

            Row = DataSet1.Tables[1].NewRow();
            Row["id"]="22222";
            Row["fruit_name"]="수박";
            DataSet1.Tables[1].Rows.Add(Row);

            Row=DataSet1.Tables[1].NewRow();
            Row["id"]="12345";
            Row["fruit_name"] = "딸기";
            DataSet1.Tables[1].Rows.Add(Row);

            Row=DataSet1.Tables[1].NewRow();
            Row["id"]="12345";
            Row["fruit_name"] = "메론";
            DataSet1.Tables[1].Rows.Add(Row);

            //객체를 통한 관계 설정

            Relation1 = new DataRelation("Test",DataSet1.Tables[0].Columns["id"],DataSet1.Talbes[1].Columns["id"]);
            DataSet1.Relations.Add(Relation1);
            dataGridView1.DataSource = DataSet1.Tables[0];
            dataGridView2.DataSource= DataSet1.Tables[1];

            // 과일 보기
            private void button1_Click(object sender, EventArgs e)
            {
                string id = (string)dataGridView1.CurrentRow.Cells[0].Value;
                DataRow[] People = DataSet1.Tables[0].Select("id ='"+ id+ "'");
                DataRow[] Item = People[0].GetChildRows("Test");
                string Fruit;
                if(Item.Length>0)
                {
                    foreach(DataRow row in Item)
                    {
                        Fruit = row["fruit_name"].ToString();
                        MessageBox.Show(Fruit);
                    }
                }
            }

            // 이름 보기
            private void button2_Click(object sender, EventArgs e)
            {
                string id = (string)dataGridView2.CurrentRow.Cells[0].Value;
                DataRow[] People = DataSet1.Tables[1].Select("id = '"+id+"'");
                DataRow Item = People[0].GetParentRow("Test");
                MessageBox.Show(Item["name"].Tostring());
            }



        }
    }
}

```

```
SqlDataAdapter

SqlDataAdapter 역할
 - 데이터베이스 연결
 - DataSet를 채우기
 - SQL Server 데이터베이스 업데이트

 ※ SqlDataAdapter에 SqlConnection 연결시 Open(),Close() 불필요


 SqlDataAdapter
 연결과 생성

 연결

 SqlConnection 사용

 SqlConnection Conn = new SqlConnection();
 Conn.ConnectionString = "server=.\\SQLEXPRESS; database=school;uid=sa;pwd=12345";

 SqlDataAdapter 생성
    SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT * FROM tblInfo",Conn);


DataSet 채우기

Fill()메소드
 - 저장한 레코드의 수를 리턴, 생성되지 않으면 0을 리턴

★public int Fill(DataSet datset, string srcTable)★

public int Fill(DataTable dataTable)

public override int Fill(DataSet dataSet)


 DataSet 채우기

 SqlDataAdapter.Fill() 메소드 역할
 - SelectCommand의 SQL문 실행
 - 데이터베이스 서버의 레코드를 DataSet에 채우는 역할
 (읽기 또는 조회)

```


```c#
// 데이터베이스의 테이블의 내용을 읽어 데이터 그리드뷰에 출력
public partial class Form1: Form{
    SqlConnection Conn;
    public Form1(){
        InitializeComponent();
    }

    private void button1_Click(object sender, EventArgs e)
    {
        SqlDataAdapter DataAdapter1 = new SqlDataAdapter("SELECT * FROM tblInfo",Conn);
        DataSet dataSet1  = new DataSet();
        DataAdapter1.Fill(dataSet1,"tblInfo");
        dataGridView1.DataSource = dataSet1.Tables[0];
    }

    private void Form1_Load(object sender , EventArgs e)
    {
        Conn = new SqlConnection();
        Conn.ConnectionString = "server=.\\SQLEXPRESS;database=school;uid=sa;pwd=12345";
    }
}
```

```
SqlDataAdapter에 SQL문 설정과 실행

SQL 설정

SelectCommand(조회), InsertCommand(삽입),
DeleteCommand(삭제), UpdateCommand(갱신)
속성에 SQL문 할당

SQL 실행

 Fill()로 DataSet 채우기(database -> DatSet)
  - SelectCommand 실행
 
 Update()로 SQL DataBase 업데이트
                        (DataSet -> database)

 - InsertCommand, DeleteCommand, UpdateCommand 실행




SqlDataAdapter

속성으로 SQL 설정

SelectCommand : 선택된 데이터베이스 테이블의 레코드를 DataSet에 저장

DeleteCommand : DataSet 테이블의 레코드와 일치하도록 데이터베이스 테이블의 레코드 삭제

InsertCommand : DataSet 테이블의 레코드와 일치하도록 데이터베이스 테이블의 레코드 입력

UpdateCommand : DataSet 테이블의 수정된 내용과 일치하도록 데이터베이스 테이블의 레코드 수정

SqlCommand : SQL문 설정

SqlDataAdapter에 적용



SelectCommand

속성

public SqlCommand SelectCommand{get;set;}

```

```C#
// Console

public static void Main(string args[])
{
    string strConn = "server=.\\SQLEXPRESS;database=school;uid=sa;pwd=12345";
    SqlConnection Conn = new SqlConnection(strConn);
    SqlDataAdapter dataAdapter = new SqlDataAdapter();
    dataAdapter.SelectCommand = new SqlCommand("SELECT * FROM tblInfo",Conn);

    DataSet ds = new DataSet();
    dataAdapter.Fill(ds,"tblInfo");
    foreach(DataRow row in ds.Tables[0].Rows)
    {
        Console.WriteLine("{0} {1} {2}",row["id"],row["pwd"],row["name"]); 
    }
}
```
```
SqlCommand.Parameter
 SQL문 안에 사용할 매개변수를 정의

SqlCommand.Parameters.Add()
    
    public SqlParameter Add(
        string parameterName,
        SqlDbType sqlDbType,
        int size,
        string sourceColumn
        )

SqlDbType.NVarchar
SqlDbType.Int .....


동적 SQL 문을 위한 Parameter

SQL 문에 매개변수 사용

SqlDataAdapter.SelectCommand.CommandText = "SQL 문"
or
SqlDataAdapter.SelectCommand= new SqlCommand("SQL문",SqlConnection);

SQL문 구성
"SELECT * FROM table 명 where name= @name"

@name에 대한 정의

SqlDataAdapter.SelectCommand.Parameters.Add("@name",SqlDbType.NVarChar,20,"name")

SQLParameter 매개변쉥 값 할당
 - SqlDataAdapter,SelectCommand.Parameters["@name"].Value="홍길동"

 or
 
 - SqlDataAdapter.SelectCommand.Parameters.AddWithValue("@name","홍길동");  // 정의와 할당을 동시에 함

```

```c#

namespace 동적SQLForm{
    public partial class Form1: Form
    {
        string strConn = "server=.\\SQLEXPRESS;daabase=example;uid=sa;pwd=12345";
        Sqlconnection Conn;
        SqlDataAdapter dataAdapter;
        DataSet dataset;

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string strSelectSQL = "SELECT * FROM tblEx01 WHERE name = @name";
            dataAdapter.SelectCommand= new SqlCommand(strSelectSQL,Conn);
            dataAdapter.SelectCommand.Parameters.Add("@name", SqlDbType.NVarchar,15,"name");
            dataAdapter.SelectCOmmand.Parameters["@name"].Value=textBox1.Text;
            dataSet.Clear();
            if(dataAdapter.Fill(dataSet,"tblEx01")==0)
            {
                MessageBox.Show("찾는 데이터가 없습니다");
            }
            else
            {
                dataGridView1.DataSource= dataSet.Tables["tblEx01"];
            }
        }

        private void Form1_Load(object sender, EventArgs e){
            Conn = new SqlConnection(strConn);
            dataAdapter = new SqlDataAdapter();
            dataSet = new DataSet();
        }
    }
}
```
```
InsertCommand


속성

public SqlCommand insertCommand{get;set;}

SQL 문

INSERT INTO table명(컬럼1, 컬럼2...) VALUES (값1, 값2)

SQL Insert 실행 방법

동적 SQL문을 활용한 방법
DataSet과 Update()호출

 동적 SQL문을 활용한 방법

 SqlDataAdapter.InsertCommand.Parameters.Add()
 SqlDataAdapter.InsertCommand.Parameters["@매개변수"].Value="값";

```

```c#
namespace 동적SQLInsertForm
{
    public partial class Form1: Form
    {
        SqlConnection Conn;
        SqlDataAdapter dataAdapter;
        DataSet dataSet;
        string strConn = "server=.\\SQLEXPRESS;database=example;uid=sa;pwd=12345";
    }

    public Form1()
    {
        InitializeComponent();
    }

    private void button1_Click(object sender, EventArgs e)
    {
        /*
         동적 SQL문 처리 1
         */
         Conn.Open();
         dataAdapter.InsertCommand = new SqlCommand("INSERT INTO tblEx01 (name,age) VALUES (@name,@age)",Conn);
         dataAdapter.InsertCommand.Parameters.Add("@name",SqlDbType.NVarChar,15,"name");
         dataAdapter.InsertCommand.Parameters.Add("@age",SqlDbType.Int,0,"age");
         dataAdapter.InsertCommand.Parameters["@name"].Value=textBox1.Text;
         dataAdapter.InsertCommand.Parameters["@age"].Value=int.Parse(textBox2.Text);

         dataAdapter.InsertCommand.ExecuteNonQuery();

         dataSet.Clear();
         dataAdapter.Fill(dataSet,"tblEx01");
         dataGridView1.DataSource= dataSet.Tables["tblEx01"];
         Conn.Close();
         dataAdapter.InsertCommand.Dispose();
    }

    private void Form1_Load(object sender, EventArgs e)
    {
        Conn = new SqlConnection(strConn);
        dataAdapter = new SqlDataAdapter("SELECT * FROM tblEx01",Conn);
        dataSet = new DataSet();
        dataAdapter.Fill(dataSet,"tblEx01");
        dataGridView1.DataSource= dataSet.Tables["tblEx01"];
    }
}
```
```
SQLInsert 실행 - Update() 활용

Update()를 실행하기 위한 과정

1. SQL문 정의
 - SqlDataAdapter.InsertCommand.Parameters.Add("@변수명",...);

 2. DataSet 다루기

 - Fill(): 채우기
 - DataSet.Rows.NewRow()로 레코드 생성
 - DataSet.Tables["table명"].Rows.Add() 레코드 입력
 - SqlDataAdapter.Update()호출

 "DataSet의 변화를 SQL문을 통해 실행하므로 직접적인 데이터 입력할 필요가 없음"
 "@매개변수와 외부 입력을 직접할 필요가 없음" 
```

```c#
namespace 동적SQLInsertForm
{
    public partial class Form1: Form
    {
        SqlConnection Conn;
        SqlDataAdapter dataAdapter;
        DataSet dataSet;
        string strConn = "server=.\\SQLEXPRESS;database=example;uid=sa;pwd=12345";
    }

    public Form1()
    {
        InitializeComponent();
    }

    private void button1_Click(object sender, EventArgs e)
    {
         Conn.Open();
         dataAdapter.InsertCommand = new SqlCommand("INSERT INTO tblEx01 (name,age) VALUES (@name,@age)",Conn);
         dataAdapter.InsertCommand.Parameters.Add("@name",SqlDbType.NVarChar,15,"name");
         dataAdapter.InsertCommand.Parameters.Add("@age",SqlDbType.Int,0,"age");

         DataRow NewRow = dataSet.Tables["tblEx01"].NewRow();
         NewRow["name"]= textBox1.Text;
         NewRow["age"]= textBox2.Text;
         dataSet.Tables["tblEx01"].Rows.Add(NewRow);
         dataAdapter.Update(dataSet,"tblEx01");

         dataSet.Clear();
         dataAdapter.Fill(dataSet,"tblEx01");
         dataGridView1.DataSource= dataSet.Tables["tblEx01"];   
  
  }

    private void Form1_Load(object sender, EventArgs e)
    {
        Conn = new SqlConnection(strConn);
        dataAdapter = new SqlDataAdapter("SELECT * FROM tblEx01",Conn);
        dataSet = new DataSet();
        dataAdapter.Fill(dataSet,"tblEx01");
        dataGridView1.DataSource= dataSet.Tables["tblEx01"];
    }
}
```

```
DeleteCommand


public SqlCommand DeleteCommand{get;set;}

삭제SQL문
DELETE table명 WHERE 조건

삭제단계 

 - 기본키(primarykey)검색 -> where
 - 삭제 SQL 실행 
 - 결과 출력

 SQL Delete 실행 방법
  동적 SQL문을 사용
  DataSet과 Update() 사용

동적 SQL문 작성
"DELETE FROM table명 WHERE id = @id";

매개변수 정의
SqlDataAdapter.DeleteCommand.Parameters.Add()

SQL문 실행
SqlDataAdapter.DeleteCommand.ExecuteNonQuery()
```

```c#
namespace 동적SQLDeleteForm
{
    public partial class Form1: Form
    {
        SqlConnection Conn;
        SqlDataAdapter dataAdapter;
        DataSet dataSet;
        string strConn = "server=.\\SQLEXPRESS;database=example;uid=sa;pwd=12345";
    }

    public Form1()
    {
        InitializeComponent();
    }

    private void button1_Click(object sender, EventArgs e)
    {
         Conn.Open();
         dataAdapter.DeleteCommand = new SqlCommand("DELETE FROM tblEx01 WHERE id=@id",Conn);
         dataAdapter.DeleteCommand.Parameters.Add("@id",SqlDbType.Int,0,"id");
         dataAdapter.DeleteCommand.Parameters["@id"].Value=(int)dataGridView1.CurrentRow.Cells["id"].Value;
         dataAdapter.DeleteCommand.ExecuteNonQuery();

     

         dataSet.Clear();
         dataAdapter.Fill(dataSet,"tblEx01");
         dataGridView1.DataSource= dataSet.Tables["tblEx01"];
         conn.Close();
         dataAdapter.DeleteCommand.Dispose();   
  
  }

    private void Form1_Load(object sender, EventArgs e)
    {
        Conn = new SqlConnection(strConn);
        dataAdapter = new SqlDataAdapter("SELECT * FROM tblEx01",Conn);
        dataSet = new DataSet();
        dataAdapter.Fill(dataSet,"tblEx01");
        dataGridView1.DataSource= dataSet.Tables["tblEx01"];
    }
}
```

```C#
namespace 동적SQLDeleteForm
{
    public partial class Form1: Form
    {
        SqlConnection Conn;
        SqlDataAdapter dataAdapter;
        DataSet dataSet;
        string strConn = "server=.\\SQLEXPRESS;database=example;uid=sa;pwd=12345";
    }

    public Form1()
    {
        InitializeComponent();
    }

    private void button1_Click(object sender, EventArgs e)
    {
         Conn.Open();
         int id=(int)DataGridView1.CurrentRow.Cells["id"].Value;

         dataAdapter.DeleteCommand= new SqlCommand("DELETE FROM tblEx01 WHERE id=@id",Conn);
         dataAdapter.DeleteCommand.Parameters.Add("@id",SqlDbType.Int,0,"id");

         string strFilter = "id="+id;
         DataRow[] FindRow = dataSet.Tables["tblsEx01"].Select(strFilter);
         FindRow[0].Delete();

         dataAdapter.Update(dataSet,"tblEx01");
         dataSet.Clear();
         dataAdapter.Fill(dataSet,"tblEx01");
         dataGridView1.DataSource = dataSet.Tables["tblEx01"];  
  }

    private void Form1_Load(object sender, EventArgs e)
    {
        Conn = new SqlConnection(strConn);
        dataAdapter = new SqlDataAdapter("SELECT * FROM tblEx01",Conn);
        dataSet = new DataSet();
        dataAdapter.Fill(dataSet,"tblEx01");
        dataGridView1.DataSource= dataSet.Tables["tblEx01"];
    }
}
```

```
UpdateCommand

public SqlCommand UpdateCommand{get;set;}

갱신 SQL문
UPDATE table명 SET 컬럼 =@매개변수, ... WHERE 조건

갱신과정

 - 기본키(primary key)검색 -> where
 - 갱신 SQL 실행
 - 결과출력



동적 SQL문 작성

"UPDATE table명 SET 컬럼1 =@매개변수1 WHERE 조건"

매개변수 정의

SqlDataAdapter.UpdateCommand.Parameters.Add()

SQL문 실행

SqlDataAdapter.UpdateCommand.ExecuteNonQuery()

```

```c#
 namespace 동적SQLDeleteForm
{
    public partial class Form1: Form
    {
        SqlConnection Conn;
        SqlDataAdapter dataAdapter;
        DataSet dataSet;
        string strConn = "server=.\\SQLEXPRESS;database=example;uid=sa;pwd=12345";
    }

    public Form1()
    {
        InitializeComponent();
    }

    private void button1_Click(object sender, EventArgs e)
    {
         Conn.Open();
         dataAdapter.UpdateCommand = new SqlCommand("UPDATE tblEx01 SET name=@name,age=@age WHERE id=@id",Conn);
         dataAdapter.UpdateCommand.Parameters.Add("@name",SqlDbType.NVarChar,20,"name");
         dataAdapter.UpdateCommand.Parameters.Add("@age",SqlDbType.Int,0,"age");
         dataAdapter.UpdateCommand.Parameters.Add("@id",SqlDbType.Int,0,"id");

        int id= (int)dataGridView1.SelectedCells[0].Value;
        string strFilter = "id="+id;
        DataRow[] FindRow = dataSet.Tables["tblEx01"].Select(strFilter);
        FindRow[0]["name"] = textBox1.Text;
        FindRow[0]["age"]= int.Parse(textBox2.Text);

        dataSet.Clear();
        dataAdapter.Fill(dataSet,"tblEx01");
        dataGridView1.DataSource = dataSet.Tables["tblEx01"];

        conn.Close();
        dataAdapter.UpdateCommand.Dispose();   
  
  }

    private void Form1_Load(object sender, EventArgs e)
    {
        Conn = new SqlConnection(strConn);
        dataAdapter = new SqlDataAdapter("SELECT * FROM tblEx01",Conn);
        dataSet = new DataSet();
        dataAdapter.Fill(dataSet,"tblEx01");
        dataGridView1.DataSource= dataSet.Tables["tblEx01"];
    }
}
```

```
SQL Command 한꺼번에 다루기

SelectCommand, InsertCommand, UpdateCommand, DeleteCommand



SqlCommand 설정 방법

 - SqlDataAdapter에 SqlCommand 설정을 모아서 처리

 - SqlCOmmandBuilder 를 통해 자동생성

    제약사항

    - 하나의 테이블만 읽어서 처리
    - Join된 쿼리문은 처리 불가
    - 기본 키가 반드시 있어야 함
    - SqlDataAdapter를 생성할 때 Select문 반드시 명시

    과정

    하나의 함수 안에 SqlCommand를 모두 설정

    Fill()과 Update()를 사용하여 처리 --> DataSet 사용

```

```C#
 namespace SqlCommand모아처리
{
    public partial class Form1: Form
    {
        string strConn = "server=.\\SQLEXPRESS;database=example;uid=sa;pwd=12345";
        SqlConnection Conn;
        SqlDataAdapter dataAdapter;
        DataSet dataSet;
    }

    public Form1()
    {
        InitializeComponent();
    }
    private void SqlCommandInit()
    {
        string strSelectSQL ="SELECT * FROM tblEx01";
        dataAdapter.SelectCommand = new SqlCommand(strSelectSQL,Conn);

        string strInsertCommand = "INSERT INTO tblEx01 (name,age) VALUES(@name,@age)";
        dataAdapter.InsertCommand = new SqlCommand(strInsertCommand,Conn);
        dataAdapter.InsertCommand,Parameters.Add("@name",SqlDbType.NVarChar,15,"name");
        dataAdapter.InsertCommand,Parameters.Add("@age",SqlDbType.int,0,"age");

        strSQL2 strDeleteCommand = "DELETE FROM tblEx01 WHERE id =@id";
        dataAdapter.DeleteCommand = new SqlCommand(strDeleteCommand,Conn);
        dataAdapter.DeleteCommand.Parameters.Add("@id",SqlDbType.Int,0,"id");

        string strUpdateCommand = "UPDATE tblEx01 SET name=@name,age=@age WHERE id= @id";
        dataAdapter.UpdateCommand= new SqlCOmmand(strUpdateCommand,Conn);
        dataAdapter.UpdateCommand.Parameters.Add("@name",SqlDbType.NVarChar,20,"name");
        dataAdapter.UpdateCommand.Parameters.Add("@age",SqlDbType.Int,0,"age");
        dataAdapter.UpdateCommand.Parameters.Add("@id",SqlDbType.Int,0,"id");
    }

  //입력
    private void button1_Click(object sender, EventArgs e)
    {
         dataSet.Clear();
         dataAdapter.Fill(dataSet,"tblEx01");
         
         DataRow NewRow = dataSet.Tables["tblEx01"].NewRow();
         NewRow["name"]= textBox1.Text;
         NewRow["age"]= textBox2.Text;
         dataSet.Tables["tblEx01"].Rows.Add(NewRow);
         dataAdapter.Update(dataSet,"tblEx01");

         dataSet.Clear();
         dataAdapter.Fill(dataSet,"tblEx01");
         dataGridView1.DataSource= dataSet.Tables["tblEx01"];
    }
    // 수정
    private void button2_Click(object sender, EventArgs e)
    {
        int id= (int)dataGridView1.SelectedCells[0].Value;
        dataSet.Clear();
        dataAdapter.Fill(dataSet,"tblEx01");

        string strFilter = "id="+id;
        DataRow[] FindRow = dataSet.Tables["tblEx01"].Select(strFilter);
        FindRow[0]["name"] = textBox1.Text;
        FindRow[0]["age"]= int.Parse(textBox2.Text);

        dataAdapter.Update(dataSet,"tblEx01");
        dataSet.Clear();
        dataAdapter.Fill(dataSet,"tblEx01");
        dataGridView1.DataSource = dataSet.Tables["tblEx01"];
    }
    // 삭제
    private void button3_Click(object sender, EventArgs e)
    {
        int id= (int)dataGridView1.SelectedCells[0].Value;
        dataSet.Clear();
        dataAdapter.Fill(dataSet,"tblEx01");


        string strFilter = "id="+id;
        DataRow[] FindRow = dataSet.Tables["tblEx01"].Select(strFilter);
        FindRow[0].Delete();

        dataAdapter.Update(dataSet,"tblEx01");
        dataSet.Clear();

        dataAdapter.Fill(dataSet,"tblEx01");
        dataGridView1.DataSource = dataSet.Tables["tblEx01"];

    }
    // 새로고침

    private void button4_Click(object sender, EventArgs e)
    {
        dataSet.Clear();
        dataAdapter.Fill(dataSet,"tblEx01");
        dataGridView1.DataSource= dataSet.Tables["tblEx01"]; 
    }
    private void Form1_Load(object sender, EventArgs e)
    {
        Conn = new SqlConnection(strConn);
        dataAdapter = new SqlDataAdapter();
        dataSet = new DataSet();
        SqlCommandInit();
        dataAdapter.Fill(dataSet,"tblEx01");
        dataGridView1.DataSource= dataSet.Tables["tblEx01"];
    }
}
```

```
SqlCommandBuilder의 SqlCommand 처리

SqlCommandBuilder
 - JOIN이 없는 일반적인 SQL문을 유틸리티로 해결
 - 연결된 SQL Server 데이터베이스와 DataSet의 변경 내용을 조정하는 데 사용되는 단일 테이블 명령을 자동으로 생성

 생성자
  - public SqlCommandBuilder(SqlDataAdapter adapter)

```

```c#
namespace SqlCommand모아처리
{
    public partial class Form1: Form
    {
        string strConn = "server=.\\SQLEXPRESS;database=example;uid=sa;pwd=12345";
        SqlConnection Conn;
        SqlDataAdapter dataAdapter;
        DataSet dataSet;
        SqlCommandBuilder cmdBuilder;
    }

    public Form1()
    {
        InitializeComponent();
    }
    
    private void Form1_Load(object sender, EventArgs e)
    {
        Conn = new SqlConnection(strConn);
        dataAdapter = new SqlDataAdapter("SELECT * FROM tblEx01");
        dataSet = new DataSet();
        cmdBuilder = new SqlCommandBuilder(dataAdapter);

        dataAdapter.Fill(dataSet,"tblEx01");
        dataGridView1.DataSource= dataSet.Tables["tblEx01"];
    }
    
  //입력
    private void button1_Click(object sender, EventArgs e)
    {         
         DataRow NewRow = dataSet.Tables["tblEx01"].NewRow();
         NewRow["name"]= textBox1.Text;
         NewRow["age"]= textBox2.Text;
         dataSet.Tables["tblEx01"].Rows.Add(NewRow);
         dataAdapter.Update(dataSet,"tblEx01");

         dataSet.Clear();
         dataAdapter.Fill(dataSet,"tblEx01");
         dataGridView1.DataSource= dataSet.Tables["tblEx01"];
    }

    // 수정
    private void button2_Click(object sender, EventArgs e)
    {
        int id= (int)dataGridView1.SelectedCells[0].Value;

        string strFilter = "id="+id;
        DataRow[] FindRow = dataSet.Tables["tblEx01"].Select(strFilter);
        FindRow[0]["name"] = textBox1.Text;
        FindRow[0]["age"]= int.Parse(textBox2.Text);

        dataAdapter.Update(dataSet,"tblEx01");
        dataGridView1.DataSource = dataSet.Tables["tblEx01"];
    }
    // 삭제
    private void button3_Click(object sender, EventArgs e)
    {
        int id= (int)dataGridView1.SelectedCells["id"].Value;

        string strFilter = "id="+id;
        DataRow[] FindRow = dataSet.Tables["tblEx01"].Select(strFilter);
        FindRow[0].Delete();

        dataAdapter.Update(dataSet,"tblEx01");
        dataGridView1.DataSource = dataSet.Tables["tblEx01"];

    }
    // 새로고침

    private void button4_Click(object sender, EventArgs e)
    {
        dataSet.Clear();
        dataAdapter.Fill(dataSet,"tblEx01");
        dataGridView1.DataSource= dataSet.Tables["tblEx01"]; 
    }
}
```

```
DataSet

관계 설정

MS SQL 
primary key, foreign key

레코드 삭제할 때 주의할 점
- 부모테이블의 내용을 삭제할 때는 자식 테이블의 내용부터 먼저 삭제할 것

```
```C#
namespace RelationWinForm
{
    public partial class Form1: Form
    {
        string strConn= "server=.\\SQLEXPRESS;database=exmaple02;uid=sa;pwd=12345";
        SqlConnection Conn;
        SqlDtaAdapter PeopleAdapter, FruitAdapter;
        SqlCommandBuilder PeopleBuilder, FruitBuilder;
        DataSet dataSet; // 1개의 DataSet안에 여러 개의 테이블을 생성할 수 있음

        public Form()
        {
            InitializeComponent();
        }

        private void SqlCommandInit()
        {
            Conn = new SqlConnection(strConn);
            PeopleAdapter= new SqlDataAdapter("SELECT * FROM tblPeople",Conn);
            FruitAdapter = new SqlDataAdapter("SELECT * FROM tblFruit",Conn);
            dataSet = new DataSet();

            PeopleBuilder= new SqlCommandBuilder(PeopleAdapter);
            FruitBuilder = new SqlCommandBuilder(FruitAdapter);

            PeopleAdapter.Fill(dataSet,"tblPeople");
            FruitAdapter.Fill(dataSet,"tblFruit");

            //Relation 설정
            DataRelation dataRelation = new DataRelation("FK_tblPeople_tblFruit",dataSet.Tables["tblPeople"].Columns["no"],dataSet.Tables["tblFruit"].Columns["no"]);
            dataSet.Relations.Add(dataRelation);

            dataGridView1.DataSource = dataSet.Tables["tblPeople"];
            dataGridView2.DataSource = dataSet.Tables["tblFruit"];

            if(dataSet.Talbes["tblPeople"].Rows.Count>0)
            {
                textBox3.Text=(string)dataGridView1.CurrentRow.Cells["name"].Value;
            }

            private void Form1_Load(object sender, EventArgs e)
            {
                SqlCOmmandInit();
            }

            // 입력
            private void button1_Click(object sender, EventArgs e)
            {
                DataRow row = dtaSet.Tables["tblPeople"].NewRow();
                row["name"]= textBox1.Text;
                row["age"]= int.Parse(textBox2.Text);
                dataSet.Tables["tblPeople"].Rows.Add(row);

                PeopleAdapter.Update(dataSet,"tblPeople");
                dataSet.Tables["tblPeople"].Clear();
                PeopleAdapter.Fill(dataSet,"tblPeople");
            }
            // 삭제
            private void button2_Click(object sender, EventArgs e)
            {
                int no = (int)dataGridView1.SelectRows[0].Cells["no"].Value;
                string strFilter = "no ="+no;
                DataRow[] FindPeopleRow = dataSet.Tables["tblPeople"].Select(strFilter);
                DataRow[] FindFruitRow=FindPeopleRow[0].GetChildRows("FK_tblPeople_tblFruit");
                if(FindFruitRow.Length>0)
                {
                    foreach(DataRow dr in FindFruitRow)
                    {
                        dr.Delete();
                    }
                }
                FindPeopleRow[0].Delete();
                FruitAdapter.Update(dataSet,"tblFruit"); // 종속관계의 것을 먼저 업데이트
                PeopleAdapter.Update(dataSet,"tblPeople");
            }

            //수정
            private void button3_Click(object sender,EventArgs e)
            {
                int no=(int)dataGridView1.SelectedCells[0].Vlaue;
                string strFilter = "no="+no;
                DataRow[] FindRow = dataSet.Talbes["tblPeople"].Select(strFilter);
                FindRow[0]["name"]= textBox1.Text;
                FindRow[0]["age"]= int.Parse(textBox2.Text);

                PeopleAdapter.Update(dataSet,"tblPeople");
                dataGridView1.DataSource=dataSet.Tables["tblPeople"];
            }

            //과일 입력
            private void button5_Click(object sender, EventArgs e)
            {
                DataRow row = dataSet.Tables["tblFruit"].NewRow();
                row["no"]=(int)dataGridView1.SelectedRows[0].Cells["no"].Value;
                row["fruit"]=textBox4.Text;
                dataSet.Tables["tblFruit"].Rows.Add(row);

                FruitAdapter.Update(dataSet,"tblFruit");
                dataSet.Tables["tblFruit"].Clear();
                FruitAdapter.Fill(dataSet,"tblFruit");
                dataGridView2.DataSource = dataSet.Tables["tblFruit"];
            }

            // 삭제

            private void button6_Click(object sender,EventArgs e)
            {
                int id=(int)dataGridView2.SelectedRows[0].Cells["id"].Value;
                string strFilter= "id="+id;
                DataRow[] FindRow = dataSet.Tables["tblFruit"].Select(strFilter);
                FindRow[0].Delete();

                FruitAdapter.Update(dataSet,"tblFruit");
                dataGridView2.DataSource=dataSet.Tables["tblFruit"];
            }

            private void dataGridView1_CleeClick(object sender,EventArgs e)
            {
                textBox3.Text=dataGridView1.SelectedRows[0].Cells["name"].Value.toString();
            }

            //과일보기
            private void button9_Click(object sender, EventArgs e)
            {
                StringBuilder FindFruit = new StringBuilder();
                int no = (int)dataGridView1.SelectedRows[0].Cells["no"].Value;
                string strFilter = "no="+no;
                DataRow[] FindPeopleRow = dataSet.Tables["tblPeople"].Select(strFilter);
                DataRow[] FindFruitRow = FindPeopleRow[0].GetChildRows("FK_tblPeople_tblFruit");
                if(FindFruitRow.Length>0)
                {
                    foreach(DataRow dr in FindFruitRow)
                    {
                        FindFruit.Append(dr["fruit"].ToString());
                        FindFruit.Append('\n');
                    }
                    MessageBox.Show(FindFruit.toString());
                }
            }

            // 수정

            private void button7_Click(object sender, EventArgs e)
            {
                int id=(int)dataGridView2.SelectedCells[0].Value;
                string strFilter="id="+id;
                DataRow[] FindRow = dataSet.Talbes["tblFruit"].Select(strFilter);
                FindRow[0]["fruit"]= textBox4.Text;

                FruitAdapter.Update(dataSet,"tblFruit");
                dataGridView2.DataSource=dataSet.Tables["tblFruit"];
            }

        }
    }
}
```
#### Wizard 마법사
```
Wizard 사용하는 이유
 - 코딩의 수고를 덜 수 있음
 ---> parameter과 관계 설정 등

Wizard 사용의 단점
 - 에러코드 발생하면 수정이 쉽지 않음

 데이터베이스 연결

 서버 탐색기 -> 데이터 연결

프로젝트 -> 새 데이터 소스 추가 -> 데이터베이스 -> 데이터 집합 (dataSet) -> 데이터 연결 선택 ->예, 중요한 데이터를 연결 문자열에 포함

TableAdapter는 SqlDataAdapter 업그레이드 객체
DataAdapter는 TalbeAdapter에 비해 명확한 코드

TableAdapter를 사용하여 DataSet 채우기

TableAdapter로 DataSet 채우는 방법
데이터 소스에서 테이블을 폼으로 드래그앤 드롭

DataGridView 자동생성

```

```C#
//자동생성코드

private void tblPeopleBindingNavigatorSaveItem_Click(object sender, EventArgs e)
{
    this.validate();
    this.tblPeopleBindingSource.EndEdit();
    this.tableAdapterManager.UpdateAll(this.example02.DataSet);
}

private void Form1_Load(object sender,EventArgs e)
{
    this.tblPeopleTableAdapter.Fill(this.example02DataSet.tblPeople);
}
```

```
쿼리 추가

tblPeopleTableAdapter 오른쪽클릭 - 추가 - 쿼리 - SLQ문 사용 - 행을 반환하는 SELECT ...

```

```
C# 기본 문법 -> 필요한 부분만 우선

C# 윈폼 윈도우 프로그래밍 -> 실제 프로그래밍

C# 데이터베이스 프로그래밍 -> 데이터 다루기
```