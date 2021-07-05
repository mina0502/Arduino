```C#
/*
	SQL 서버 데이터 액세스
		- ADO.NET: 		(ActiveX Data Object) + .NET
		- LINQ(Language Integrated Query) to SQL: SQL에 대한 LINQ, ORM을 편리하게 사용할 수 있도록 한 기능을 지원	
		- Entitiy Framework:	 .NET에서 ORM을 전문적으로 사용할 수 있도록 한 프레임워크
		
		[ADO.NET 클래스]
		- SQL Server Provider (System.DataSqlClient 네임스페이스)
		Sqlconnection 
			-- SQL Server를 접속하기 위한 클래스
			   클라이언트 프로그램에서 서버와 접속하기 위해 사용하는 클래스
			   접속시 필요한 것: Connection String

			-- Connection String : 서버명, 초기DB명, 인증방법을 담고 있음


		 >> string strConn="Data source=(localdb)\\uinstanceName;InitialCatalog=MyDB; Integrated Security=true";
			try{
			  SqlConnection String dbcon = new SqlConnection();
			  dbcon.Open()
			}catch(Exception e)
			{
				throw;
			}
			finally
			{
			  dbcon.Close(); 
			}
		 ...............................



		SqlCommand
			-- SQL 서버에 명령을 내리기 위해서 사용하는 클래스
					
					DML

				SELECT: 테이블로부터 데이터를 가져오기
				INSERT: 테이블에 데이터를 삽입
				UPDATE: 테이블에 데이터를 갱신
				DELETE: 테이블에서 데이터를 삭제

		사용 예>> string sql = "SELECT * FROM test";
			SqlConnection dbconn = new SqlConnection(strConn);
			dbconn.Open();

			SqlCommand cmd = new SqlCommand(sql,dbconn);

			SqlDataReader reader = cmd.ExecuteReader();

	-----------------------------------------------------------
	SqlCommand의 주요 메소드
			- ExecuteNonQuery() : INSERT, UPDATE, DELETE 사용시
			- ExecuteReader() : 데이터를 서버에서 가져올 때 사용

			서버에서 데이터를 한꺼번에 가져온 후, 연결을 끊는 경우에는 SqlDataAdapter를 이용한다


			연결 상태에서 데이터를 가져오는 경우에는 SqlDataReader 객체로 리턴한다.
			(Connection-base 방식)

			- ExecuteScalar() : 리턴되는 데이터가 단 하나인 경우
			  이때의 리턴 타입은 Object, 필요시 casting 하여 사용

			- ExecuteXmlReader() : XL형태로 데이터를 리턴 받는 경우 사용
			  XMLReader 객체를 리턴



		[ SqlDataReader ]
		  - SQL Server와 연결을 유지한 상태에서 한번에 한 레코드씩 데이터를 가져올 때 사용


		[ SqlDataAdapter ]
		 
		 - 가져온 데이터를 메모리상의 할당하는데 그 객체를 DataSet이라 함
		 
		 - DataSet객체는 DataGridView 컨트롤의 바인딩 소스로 사용할 수 있음
		 
		 - 가져온 데이터가 많은 경우, 그리드뷰에서는 스크롤바를 이용해서 데이터를 보게 됨
		 	==> 페이징 기능을 이용하면 편리하게 데이터를 볼 수 있음


		[ SqlParameter ]
		 - SqlCommand 객체에 파라미터가 필요한 경우 사용되는 클래스
		 @name
		 	ex) string sql = "SELECT * FROM Memberr WHERE Address=@addr";
		 		SqlCommand cmd= new SqlCommand(sql,dbConn);

		 		SqlParameter pAddr = new SqlParameter("@addr",SqlDbType.NVarChar,255);
		 		pAddr.Value="seoul";

		 		cmd.Parameters.Add(pAddr);
		...
*/
namespace DataEx1
{
	public partial class Form1:Form
	{
		public Form1()
		{
			InitializeComponent();
		}

		private void button1_Click(object sender, EventArgs e)
		{
			string conStr = "Data Source=(localdb)\\ProjectsV13;Initial Catalog=MyDB;Integrated Security=true";
			SqlConnection dbCon = new SqlConnection();
			dbCon.Open(); // db 연결
			MessageBox.Show("데이터베이스 연결");
		}
	}
}
```