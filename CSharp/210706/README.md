#### DataSet 클래스
```
클라이언트 메모리에 존재하는 데이터 (일종의 메모리상에 있는 데이터베이스)
-> 이 데이터는 테이블 형태의 데이터 (서버와의 연결을 유지하지 않는 상태)
-> DataSet 클래스는 개발자가 직접 테이블 구조를 만들고 데이터 삽입도 가능

** 서버에서 데이터를 가져올 경우 DataAdapter를 이용 (SqlDataAdapter 이용)
** 가져온 데이터는 메모리상의 DataSet에 할당하여 사용

DataTable 클래스 : 메모리상에 테이블을 표현하는 클래스, 보통 DataSet.Tables 컬렉션에 포함하여 사용

DataSet은 여러개의 DataTable들을 갖고 있는 형태
이러한 DataSet에 있는 DataTable에 접근하기 위해서는 Index를 이용하여 접근 가능
DataSet.Tables[0]와 같이 접근

	ex) DataSet dataSet = new DataSet();
		adapter.Fill(dataSet,"Table1");
		DataTable dataTable= dataSet.Tables["Table1"];

DataView 클래스 : DataTable객체를 정렬, 필터링, 편집, 검색 등을 할 때 사용되는 클래스
 DataTable에는 기본적인 DefaultView라는 속성을 가지고 있는데, 이 속성은 DataView라고 할 수 있음



DB : 여러개의 테이블들로 이루어져 있는 데이터
DataSet : DB처럼 안에 테이블들을 가질 수 있음


```

```C#
// 클래스를 만들어서 데이터를 가져옴
namespace DataEx2
{
	class DataSetDemo 
	{
		string connstr = "Data Source=(localdb)\\ProjectsV13;Initial Catalog=MyDB;Integrated Security=true";

		public DataSet GetUserData()
		{
			SqlConnection conn = new SqlConnection(connstr); // using System.Data.SqlClient;
			conn.Open();

			DataSet dataSet = new DataSet();
			string sql = "SELECT * FROM Customer";


			// SqlDataAdapter 초기화
			SqlDataAdapter adapter = new SqlDataAdapter(sql,conn);
	
			// Fill 메소드를 실행해서 DataSet을 리턴받음
			adapter.Fill(dataSet);


			conn.Close();

			return dataSet;		// XML 파일에 저장할 수 있음  (읽고 쓰는 작업이 가능)
		}
	}

	public partial class Form1 : Form
	{
		public Form1()
		{
			InitializeComponent();
		}

		private void btn_DataLoad_Click(object sender, EventArgs e)
		{	
			DataSetDemo dataSetDemo = new DataSetDemo();

			DataSet userData = dataSetDemo.GetUserData();

			//DataSet을 dataGridView에 바인딩
			DataGridView1.DataSource = userData.Tables[0];
		}
		
	}
}
```
