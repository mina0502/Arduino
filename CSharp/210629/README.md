#### 파일 스트림(file stream)

```
스트림 개요

스트림 : 파일, 네트워크 등에서 데이터를 바이트 단위로 읽고 쓰는 클래스

Stram class는 사우이 기본 클래스임

- 상속클래스
==> FileStream,MemoryStream
==> NetworkStream, SqlFileStream 등

using System.IO; 선언


FileStream 
파일입출력을 다루는 기본 클래스
System.Object
    + System.MarshalByRefObject
        + System.IO.Stream
            + System.IO.FileStream

byte[] 배열로 데이터를 읽거나 저장함
==> 형변환이 요구됨


StreamWriter/StreamReader +
BinaryWriter/BinaryReader 와 사용

파일 정보 설정에 사용

public FileStream(
    string path,
    FileMode mode,
    FileAccess access
    )

FileMode 열거형

Append, Create, CreateNew
Open, OpenOrCreate, Truncate

파일 정보 설정에 사용
Read, ReadWrite, Write

StreamWriter,StereamReader

텍스트 파일의 특징

- 기본단위: 1바이트
- 아스키코드 기반
아스키코드를 유니코드로 인코딩

StreamWriter

역할
 - 파일쓰기

 상속 계층 구조
 System.Object
    + System.MarshalByRefObject
        +System.IO.TextWriter
            + System.IO.StreamWriter

public class StreamWriter : TextWriter


객체 생성과 해제

static void Main(string[] args)
{
    FileStream fs = new FileStream("test.txt",FileMode.Create);
    StreamWriter sw =new StreamWriter(fs);
    sw.Close();
}

using 문

using(StreamWriter sw = new StreamWriter(
    new FileStream("test.txt",FileMode.Create)))
    {
        //파일 입출력처리
    }

파일쓰기 
Write(), WriteLine()
 
```
``` C#
// FileStream만 사용할 경우: Close() 함수 호출해야함
// using 을 이용할 경우: Close()함수 호출하지 않아도 됨
int val = 12;
            float val2 = 3.14f;
            string str1 = "Hello World!";
         /*
            FileStream fs = new FileStream("test.txt", FileMode.Create);
            StreamWriter sw = new StreamWriter(fs);
            sw.WriteLine(val);
            sw.WriteLine(val2);
            sw.WriteLine(str1);
            sw.Close();
          */
            using(StreamWriter sw = new StreamWriter(new FileStream("test1.txt",FileMode.Create)))
            {
                sw.WriteLine(val);
                sw.WriteLine(val2);
                sw.WriteLine(str1);
            }
```
```
읽기 메서드
 Read(),ReadLine()
 string ReadLine()

```
``` c#
/*
            //FileStream과 StreamReader를  같이 사용
            FileStream fs = new FileStream("test.txt", FileMode.Open, FileAccess.Read);
            StreamReader sr = new StreamReader(fs);
            int val = int.Parse(sr.ReadLine());
            float val2 = Single.Parse(sr.ReadLine());
            string str = sr.ReadLine();
            sr.Close();
            Console.WriteLine("{0} {1} {2}", val, val2, str);
            
            //StreamReader와 using문을 사용
            using (StreamReader sr = new StreamReader(new FileStream("test.txt",FileMode.Open)))
            {
                int val = int.Parse(sr.ReadLine());
                float val2 = Single.Parse(sr.ReadLine());
                string str = sr.ReadLine();
                sr.Close();
                Console.WriteLine("{0} {1} {2}", val, val2, str);
            }
            */
            //StreamReader 만을 사용
            StreamReader sr = new StreamReader("test.txt");
            int val = int.Parse(sr.ReadLine());
            float val2 = Single.Parse(sr.ReadLine());
            string str = sr.ReadLine();
            sr.Close();
            Console.WriteLine("{0} {1} {2}", val, val2, str);
```
#### string 데이터 분리
```
string str = "C언어:90 C#언어:100 컴퓨터구조:70";
public string[] Split(params char[] separator)
string.Split(new char[]{',', '.', ''})
```

#### ReadLine() 활용
```
화면으로부터 학생수와 3과목에 대한 점수를 입력 받은 후에 다음과 같이 test.txt파일로 저장
각 과목의 점수는 스페이스로 구분
```
```C#
// 파일쓰기
namespace ConsoleApplication1
{
    class Program
    {
        struct GRADE
        {
            public int kor, eng, math, total;
            public int average;
        }
        static void Main(string[] args)
        {
            string str;
            Console.Write("성적 처리를 위한 학생수를 입력해주세요: ");
            int nCount = int.Parse(Console.ReadLine());
            Console.WriteLine("국어 영어 수학 순서로 점수를 입력해주세요");
            GRADE[] Grade = new GRADE[nCount];
            StreamWriter sw = new StreamWriter("test.txt");
            sw.WriteLine("학생수: {0}", nCount);
            for(int i=0;i<nCount;i++)
            {
                str = Console.ReadLine();
                string[] DataString = str.Split(new char[] { ' ' });
                Grade[i].kor = int.Parse(DataString[0]);
                Grade[i].eng = int.Parse(DataString[1]);
                Grade[i].math = int.Parse(DataString[2]);
                Grade[i].total = Grade[i].kor + Grade[i].eng + Grade[i].math;
                Grade[i].average = (int)Math.Round(Grade[i].total / 3.0f);
            }

            for(int i=0;i<nCount;i++)
            {
                sw.WriteLine("{0}, {1}, {2}, {3}, {4}", Grade[i].kor, Grade[i].eng, Grade[i].math, Grade[i].total, Grade[i].average);
            }
            sw.Close();
        }
    }
}
```
```c#
// 파일 읽기
            string str;
            Console.Write("파일명을 입력해 주세요! ");
            string filename = Console.ReadLine();
            StreamReader sr = new StreamReader(filename);
            str = sr.ReadLine();
            string[] strData1 = str.Split(new char[] { ':' });
            int nCount = int.Parse(strData1[1]);
            Console.WriteLine("-----------------------------------------");
            for(int i=0;i<nCount;i++)
            {
                str = sr.ReadLine();
                string[] strData2 = str.Split(new char[] { ',' });
                Console.WriteLine("{0} {1} {2} {3} {4}",strData2[0],strData2[1],strData2[2],strData2[3],strData2[4]);
            }
            Console.WriteLine("------------------------------------------");
            sr.Close(); 
```
#### 이진 파일 읽기와 쓰기
```
BinaryWriter/BinaryReader

메소드
ReadBoolaen(), ReadByte(), ReadBytes(Int32),
ReadChar(), ReadChars(Int32),
ReadDecimal(),ReadDouble(),ReadInt16(),
ReadInt32(),ReadInt64(),ReadSByte(),ReadSingle(),ReadString(),
ReadUInt16(),ReadUInt32(),ReadUInt64(),Write()

BinaryWrite를 이용한 파일 쓰기
```

```C#
  using (BinaryWriter bw = new BinaryWriter(new FileStream("test.dat", FileMode.Create)))
            {
                bw.Write(12);
                bw.Write(3.14f);
                bw.Write("Hello World!");
            }
```
```
BinaryReader를 이용한 파일 읽기
```
```C#
            int var1;
            float var2;
            string str1;

            using(BinaryReader br = new BinaryReader(File.Open("test.dat",FileMode.Open)))
            {
                var1 = br.ReadInt32();
                var2 = br.ReadSingle();
                str1 = br.ReadString();
            }
            Console.WriteLine("{0} {1} {2}", var1, var2, str1);
```

```C#

namespace ConsoleApplication1
{
    struct Data
    {
        public int var1;
        public float var2;
    }
    class Program
    {
        static void Main(string[] args)
        {
            Data[] DataArray = new Data[2];
            DataArray[0].var1 = 7;
            DataArray[0].var2 = 3.14f;

            DataArray[1].var1 = 12;
            DataArray[1].var2 = .5f;

            BinaryWriter bw = new BinaryWriter(File.Open("test.txt", FileMode.Create));
            for(int i=0;i<DataArray.Length;i++)
            {
                bw.Write(DataArray[i].var1);
                bw.Write(DataArray[i].var2);
            }
            bw.Close();
            int var1;
            float var2;
            BinaryReader br = new BinaryReader(File.Open("test.txt", FileMode.Open));
            while (true)
            {
                try
                {
                    var1 = br.ReadInt32();
                    var2 = br.ReadSingle();
                    Console.WriteLine("{0} {1}", var1, var2);
                }
                catch(EndOfStreamException e)   //파일 끝에 도달한 예외
                {
                    br.Close();
                    break;
                }
            }
        }
    }
}
```
#### 직렬화(serialize)
```
StreamWriter / StreamReader 와
BinaryWriter / BinaryReader
--> 기본 데이터형만 저장 및 읽기

구조체, 클래스 저장 및 읽기
--> FileStream / BinaryFormatter

BinaryFormatter 네임스페이스
using System.Runtime.Serialization.Formatters.Binary;

BinaryFormatter

public void Serialize(
    Stream serializationStream,
    onject graph)

public object Deserialize(
    Stream serializationStream
    )
```

```C#
namespace ConsoleApplication1
{
 [Serializable]
    struct DATA
    {
     public int var1;
     public float var2;
     public string str1;
    }
    class Program
    {
        static void Main(string[] args)
        {
            DATA[] Data = new DATA[2];

            Data[0].var1 = 1;
            Data[0].var2 = 0.5f;
            Data[0].str1 = "Test1";
            
            Data[1].var1 = 2;
            Data[1].var2 = 1.5f;
            Data[1].str1 = "Test2";

            using (FileStream fs1 = new FileStream("test.dat", FileMode.Create))
            {
                BinaryFormatter bf = new BinaryFormatter();
                bf.Serialize(fs1, Data);
            }

            DATA[] ResultData;
            using (FileStream fs2 = new FileStream("test.dat", FileMode.Open))
            {
                BinaryFormatter bf2 = new BinaryFormatter();
                ResultData = (DATA[])bf2.Deserialize(fs2);
            }
            for(int i=0;i<ResultData.Length;i++)
            {
                Console.WriteLine("{0} {1} {2}",ResultData[i].var1,ResultData[i].var2,ResultData[i].str1);
            }
        }
    }
}
```
#### 역직렬화 (deserialize)
```
역직렬화
 직렬화 대상에서 제외
 [NonSerialize]

 [Serializable]
 class TestClass
 {
    int nValue;
    [NonSerialize]
    string strMessage;
    // 또는[NonSerialize] string strMessage;
 }

```
```c#
namespace ConsoleApplication1
{
 [Serializable]
    struct DATA
    {
     public int var1;
     public float var2;
     [NonSerialized]
     public string str1;
    }
    class Program
    {
        static void Main(string[] args)
        {
            DATA[] Data = new DATA[2];

            Data[0].var1 = 1;
            Data[0].var2 = 0.5f;
            Data[0].str1 = "Test1";
            
            Data[1].var1 = 2;
            Data[1].var2 = 1.5f;
            Data[1].str1 = "Test2";

            using (FileStream fs1 = new FileStream("test.dat", FileMode.Create))
            {
                BinaryFormatter bf = new BinaryFormatter();
                bf.Serialize(fs1, Data);
            }

            DATA[] ResultData;
            using (FileStream fs2 = new FileStream("test.dat", FileMode.Open))
            {
                BinaryFormatter bf2 = new BinaryFormatter();
                ResultData = (DATA[])bf2.Deserialize(fs2);
            }
            for(int i=0;i<ResultData.Length;i++)
            {
                Console.WriteLine("{0} {1} {2}",ResultData[i].var1,ResultData[i].var2,ResultData[i].str1);
            }
        }
    }
}
```
#### 컬렉션의 직렬화
```
컬렉션과 제네릭

같은 데이터형의 임의의 메모리 또는 연속적인 메모리를 다룰 수 있도록 하는 클래스
ArrayList, List<T>
제네릭을 이용한 직렬화
```

``` C#
            List<Data> ResultList;
            List<Data> DataList = new List<Data>();
            DataList.Add(new Data(7, "test1"));
            DataList.Add(new Data(12, "test2"));
            DataList.Add(new Data(12, "test2"));
            DataList.Add(new Data(12, "test2"));
            DataList.Add(new Data(12, "test2"));

            using (FileStream fs1 = new FileStream("test.dat", FileMode.Create))
            {
                BinaryFormatter bf = new BinaryFormatter();
                bf.Serialize(fs1, DataList);
            }
            using(FileStream fs2 = new FileStream("test.dat",FileMode.Open))
            {
                BinaryFormatter bf2 = new BinaryFormatter();
                ResultList = (List<Data>)bf2.Deserialize(fs2);
            }
            for(int i=0;i<5;i++)
            {
                Console.WriteLine("{0} {1}", ResultList[i].data, ResultList[i].str);
            }
```

### 파일 입출력 정리
```
바이트 : File , FileStream + BitConverter ☆

텍스트 : StreamWriter, StreamReader + FileStream ☆☆☆

이진 : BinaryWriter, BinaryReader + FileStream ★★★★★

구조체와 클래스 :[Serializable] + BinaryFormatter
               [Serializable] + 컬렉션 + BinaryFormatter ★★★★★
```
