#### 이미지
```
이미지
비트맵
더블 버퍼링
리소스 이미지

GDI+에서 다룰 수 있는 이미지 형식
bmp,jpg,png,gif,tiff,exif 등

이미지 다루는 클래스

Image : 추상 기본 클래스 (abstract base class)

Bitmap or MetaFile의 상위 클래스


이미지 로딩 메서드

public static Image FromFile(string filename);

private void Form1_Paint(object sender, PaintEventArgs e)
{
	Image myImage = Image.FromFile("ImageName.jpg");
	e.Graphics.DrawImage(myImage,0,0);
}

Bitmap 클래스

public sealed class Bitmap: Image

비트맵을 이용한 이미지 로딩

public Bitmap(string filename)

BMP,GIF,EXIF,JPG,PNG,TIFF 로딩 가능

Bitmap.SetPixel(), Bitmap.GetPixel()

로딩된 이미지의 픽셀 정보

public Color GetPixel(int x, int y)
public void SetPixel(int x, int y, Color color)

private void Form1_Paint(object sender, PaintEventArgs e)
{
	Bitmap myBitmap = new Bitmap("ImageName.jpg");
	SetClientSizeCore(myBitmap.Width, myBitmap.Height);// 클라이언트 영역 지정
	e.Graphics.DrawImage(myBitmap,0,0);
}


임의의 비트맵 생성

public Bitmap(int width, int height)

Graphics 객체로 비트맵 참조

public static Graphics FromImage(Image image)

Graphics를 사용하여 비트맵 지우기
Graphics.Clear()

400x300 크기의 비트맵을 로딩하고 "C# Programming" 출력 X 10, 배경색은 Yellow로 출력 사각형 출력


```
```c#
namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        Bitmap bitmap;
        public Form1()
        {
            InitializeComponent();
            bitmap = new Bitmap(400, 300);
            SetClientSizeCore(400, 300);
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
            // 메모리에서 그려지는 부분
            Graphics bitmapGraphics = Graphics.FromImage(bitmap);
            bitmapGraphics.Clear(Color.Yellow);
            for(int i=0;i<10;i++)
            {
                bitmapGraphics.DrawString("C# Programming", Font, Brushes.Black, 10, 20*i);

            }
            bitmapGraphics.DrawRectangle(Pens.Black, 100, 10, 200, 100);
            e.Graphics.DrawImage(bitmap, 0, 0);
        }
    }
}
```
#### 더블 버퍼링
```
역할

이미지 출력의 깜빡임을 줄이기 위한 처리

용어

백버퍼
오버스크린

더블 버퍼링 객체 구조

더블 버퍼링 관여 객체

BufferedGraphicsManager class
BufferedGraphicsContext class
BufferedGraphics class


폼의 DoubleBuffered 속성 true로 설정

DoubleBuffered 속성 코드로 설정하는 방법
SetStyle(ControlStyles.OptimaizedDoubleBuffer,true);

더블 버퍼링에 출력하는 객체와 메서드

BufferedGraphics.Graphics
BufferedGraphics.Graphics.DrawImage() 그리기
BufferedGraphics.Clear() : 더블 버퍼 지우기

더블 버퍼링
화면에 출력

BufferedGraphics.Render()

public void Render(Graphics target)
```
```c#
namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        BufferedGraphicsContext context;
        BufferedGraphics graphics;
        Image myImage;
        public Form1()
        {
            InitializeComponent();

            context = BufferedGraphicsManager.Current; // 참조
            context.MaximumBuffer = new Size(800, 600);// 버퍼 크기 설정
            graphics = context.Allocate(CreateGraphics(), new Rectangle(0, 0, 800, 600));
            graphics.Graphics.Clear(Color.Yellow); //버퍼 지우기
            myImage = Image.FromFile("ImageFileName.jpg");
            SetClientSizeCore(800, 600);
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
            //더블 버퍼에 출력

            Random rand = new Random();
            for(int i=0;i<100;i++)
            {
                graphics.Graphics.DrawImage(myImage, rand.Next(0, 700), rand.Next(0, 500));
            }

            // 화면에 출력

            graphics.Render(e.Graphics);
        }
    }
}

```
```
리소스 이미지

리소스 이미지는 실행파일에 첨가
 - 실행파일의 크기가 커짐

리소스 디자이너 실행
 Resources.resx 더블 클릭

 리소스 이미지 Bitmap으로 참조

 Bitmap bitp = Proprties.Resource.이미지명

```
```c#
namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            SetClientSizeCore(Properties.Resources.ImageName.Width, Properties.Resources.ImageName.Height);
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
            Bitmap bitmap = Properties.Resources.ImageName;
            e.Graphics.DrawImage(bitmap, 0, 0);
            bitmap = Properties.Resources.ImageName1;
            e.Graphics.DrawImage(bitmap, 20, 20);
        }
    }
}
```
#### 메뉴
```
일반 메뉴 다루기
컨텍스트 메뉴 다루기

MenuStrip 컨트롤 설정

MenuStrip를 폼 위에 올려 놓고 입력

단축키 설정 -> 메뉴 -> 속성 -> Shortcutkeys 

컨텍스트 메뉴

ContextMenuStrip

```
```C#
namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

        }

        private void 열기ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("열기");
        }

        private void 열기ToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            MessageBox.Show("ContextMenu 열기");
        }
    }
}

```
#### 기본 컨트롤

```
컨트롤 목적
사용자의 편의 -> 사용자 인터페이스

쉬운 컨트롤 사용 -> 디자인 요구
사용자 편의성을 높임


버튼 컨트롤

푸시 버튼
라디오 버튼
체크 버튼


푸시버튼

클릭 했을 때 반응하는 용도로 사용

WM_COMMAND 발생 -> 버튼 아이디 발급 
C#에서는 이벤트로 처리



체크버튼

여러 항목을 선택하는 용도

Checked 속성
선택 : true , 해제 : false

CheckState 속성

CheckState 열거형, Checked, UnChecked 설정

체크 상태 변경에 다른 이벤트
CheckedChanged, CheckStateChanged


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
            if(radioButton1.Checked==true)
            {
                MessageBox.Show("라디오버튼1 체크");
            }
            if(radioButton2.Checked)
            {
                MessageBox.Show("라디오버튼2 체크"); 
            }
            if(radioButton3.Checked)
            {
                MessageBox.Show("라디오 버튼3 체크");
            }
        }
    }
}
```
```
텍스트 박스 text box

용도

문자열 입력 또는 출력

TextBox.Text 속성
public override string Text{get;set;}

데이터 변환
Convert.ToInt() 등 Convert 클래스로 해결

public static class Convert

MaskedTextBox

휴대폰 번호 형식, 우편번호 등 입출력

RichTextBox
TextBox 보다 업그레이드 기능 제공

주요 속성
ReadOnly -> 읽기 전용

PasswordChar -> 비밀번호 입력 문자 지정
```
#### 대화상자
```
모달형 대화상자
모델리스형 대화상자
공용 대화상자
 - 파일입출력 대화상자
 - 색상 대화상자

대화상자 
  사용자 인터페이스

대화상자 종류
  모달형과 모델리스형

공용 대화상자
  미리 만들어 놓은 대화상자 사용이 간편

모달형 대화상자 생성

Form 생성 -> new로 생성

Form2 Dlg = new Form2();

모달형 대화상자 화면 출력과 해제

 출력
  public DiialogResultShowDialog()
  Dlg.ShowDialog()

해제
 Dlg.Dispose()


모달형 대화상자 

메인 폼에서 모달형 대화상자
 데이터 접근 방법

 public 변수 또는 속성


메인 폼과 모달형 대화상자 간의 데이터 전송

Owner 속성 사용
Form.Owner
public Form Owner{get;set;}
--> 클래스 참조 역할

클래스 참조를 통한 데이터 전송


모델리스형과 모달형의 차이점

메인 폼의 기능 여부

ShowDialog() vs Show()

모델리스형은 메인 폼 멤버로 선언한 후에  임의로 생서앟여 사용

모델리스형 대화상자 생성 및 해제
모달형과 같음


```

#### 공용 대화상자
```
파일 열기
파일 저장
폰트
색상
인쇄 등


모달형 대화상자

OpenFileDialog 와 SaveFileDialog class

도구상자 -> 컨트롤 형태

파일Stream 제공(선택적 사용)

파일 저장 대화상자

SaveFileDialog
 도구상자 -> 컨트롤 선택

파일저장 대화상자 속성 설정
속성창 vs 코드

속성보기

DefaultExt : 기본 확장자
FileName : 경로가 포함된 파일명
SafeFileName : 파일경로가 포함 되지 않은 파일명 + 확장자
FileNames : 다중선택 파일명
Filter: 파일 필터 "파일명(확장자)|*.확장자....";
FilterIndex: 선택한 필터 인덱스 1부터 시작
Title : 대화상자의 타이틀명
InitialDirectory : 대화상자의 초기 폴더의 경로를 설정
전체 경로에서 "\"는 @"C:\Temp" 또는 "c:\\Temp"로
SaveFileDialog 의 결과 
--> ShowDidalog()의 열거형 리턴값으로 판단
DialogResult

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

        private void 저장ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            saveFileDialog1.Filter = "데이터(*.dat)|*.dat";

            if(saveFileDialog1.ShowDialog()==DialogResult.OK)
            {
                //파일 처리
            }
        }
    }
}
```
```
파일저장 대화상자

파일 저장
SaveFileDialog.OpenFile() -> Stream 제공 or Stream 선언하여 사용
	사용 방법 : 고정적

```
```C#
namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void 저장ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            int Number = 12;
            string Message = "Hello World";
            Stream myStream;
            saveFileDialog1.DefaultExt = "dat";
            saveFileDialog1.Filter = "데이터(*.dat)|*.dat";
            if(saveFileDialog1.ShowDialog()==DialogResult.OK)
            {
                if ((myStream = saveFileDialog1.OpenFile()) != null)
                {
                    using (BinaryWriter bw = new BinaryWriter(myStream))
                    {
                        bw.Write(Number);
                        bw.Write(Message);
                    }
                }
            }
        }
    }
}
```

```
파일입출력 대화상자

모달형 대화상자

OpenFileDialog
 도구상자 -> 컨트롤 형태
 파일 Stream 제공(선택적 사용)
 SaveFileDialog와 동일하게 사용

```

```C#
Stream myStream;
            openFileDialog1.Filter = "데이터(*.dat)|*.dat";
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                if ((myStream = openFileDialog1.OpenFile()) != null)
                {
                    using (BinaryReader br = new BinaryReader(myStream))
                    {
                        Number = br.ReadInt32();
                        Message = br.ReadString();
                        Invalidate();
                    }
                }
            }
```
```
색상 대화상자

색상대화상자(ColorDialog)
색상선택
도구상자 -> ColorDialog 컨트롤 선택

ShowDialog() 호출
Color 구조체 사용 -> ColorDialog.Color
FullOpen 속성: 펼친 대화상자 <- true

```

#### 폼분할
```
패널
스플릿터
스크롤
MDI

패널

기능 
 - 컨트롤을 담는 역할
 - 패널이 이동하면 패널 안의 컨트롤도 같이 이동
 - 코드에는 영향을 미치지 않음 -> 관리 목적

종류 
- TalbeLayoutPanel : 행과 열로 나눈 셀
- FlowLayoutPanel : 자동 배치

Splitter 개요
 
 컨트롤을 기준으로 폼의 경계를 나누고자하는 하는 컨트롤

 스플릿터에 의해 컨트롤의 크기가 변경

 패널과 스플릿터의 차이점
  - 패널은 이동만 제공
  - 스플릿터는 크기만 변경 가능

  SPlitter 사용 방법

   컨트롤을 올려 놓고 Dock 설정
   Splitter 올려 놓고 컨트롤과 같은 Dock 설정 컨트롤과 Splitter 연결

   SPlitterContainer 개요

   미리 영역을 나누고 컨트롤을 배치할 수 있는 컨트롤
   Splitter와는 사용방법이 반대
   Splitter와 같은 역할


   스크롤

   개요
   ScrollableControl로부터 파생된 클래스가 폼 클래스

   ScrollableControl 사용방법

   AutoScrollMinSize 속성
    - 스크롤 최소 크기
    - 폼이 스크롤 최소 크기보다 작으면 스크롤 출현

    AutoScrollPosition 속성

    현재 스크롤된 양
     - 음수값을 가짐

    자체적으로 화면버퍼를 가짐
```
```C#
namespace WindowsFormsApplication2
{
    public partial class Form1 : Form
    {
        Image myImage;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            myImage = Image.FromFile("test.png");
            this.AutoScrollMinSize = myImage.Size; // 스크롤바 출현
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
            e.Graphics.DrawImage(myImage, AutoScrollPosition.X, AutoScrollPosition.Y);
        }

    }
}
```
```
    MDI

SDI(단일폼)
MDI (다중 폼) -> 자식폼 존재

설정 방법

메인 폼의 isMdiContainer를 true로 설정

자식폼 생성을 위해 MenuStrip 설정
윈도우 + 폼1 + 폼2

MenuStrip 속성에서 MdiWindowListItem 속성에서 윈도우 ToolStripMenuItem 선택
or 비선택 (선택된 메뉴 리스트 출력 용도)

폼 추가하기

폼 생성할 때는 모델리스형으로 생성하기

메인 폼을 자식 폼에 설정하기
Form.MdiParent = this;

메뉴에 따라 출력하기
Form.Show()
```