# 유효성검사

```

사용자가 폼 페이지에서 입력한 데이터 값이 서버로 전송되기 전에 
특정 규칙에 맞게 입력되엇는지 검증

사용자가 실수로 유효하지 않은 데이터 값을 입력하면 부적합하다고 판단하여
다시 폼 페이지로 되돌려 사용자에게 오류가 있음을 알려줌


	유효성 검사 예

폼페이지에서 나이를 입력할 때 숫자를 인식하는 검사

회원 가입 시 아이디 중복 검사

로그인 인증 시 아이디와 비밀번호 검사

IP패킷 검사 등

```
# 유효성 검사의 개요

```

	유효성 검사를 위한 핸들러 함수

핸들러 함수는 form 페이지에서 이벤트가 발생했을 때 (<submit>를 클릭한 경우)
유효성 검사를 위해 매핑하는 메서드

자바스크립트를 이용하여 유효성 검사를 위한 코드를 작성

JS는 웹브라우저에서 유효성 검사를 처리하므로 서버에서 처리하는 것보다
속도가 빠르고 서버에 과부하를 주지 않음

사용자가 폼 페이지에 입력한 데이터 값이 서버로 전송되기 전에 특정 규칙에 맞게 입력되었는지를 검사

입력된 데이터가 유효성 검사를 통과하면 서버로 전송하고, 그렇지 않으면 서버 전송을 취소하고 사용자에게 오류 메세지를 보여주는 역할

```

### 유효성 검사를 위해 핸들러 함수를 만드는 과정
```

input태그의 type 속성 값이 submit인 경우 onclick 속성을 이용하여 핸들러 함수를 설정
또는 form 태그의 onsubmit 속성 값에 설정

자바스크립트를 이용하여<script>...</script>내에 핸들러 함수를 작성
<script>..</script> 구문은 JSP 페이지의 어디에 위치해도 상관없음

폼 페이지에서 입력된 데이터 값을 핸들러 함수로 가져오기 위해 form태그의 name 속성 또는 forms 객체를 이용
- forms 객체를 이용하는 경우, form 객체는 배열의 형태이기 때문에 length 속성으로
  크기를 알 수 있고 배열 값인 index는 form태그가 나타나는 순서로 0부터 시작

******************************************************************************
<script type="text/javascript">
 function 핸들러 함수(){
	var str = document.폼이름.입력항목 이름.value;
	}
</script>

<form name="폼이름">
	<input typ"submit" onclick="핸들러 함수()">
</form> 

******************************************************************************

```

```

******************************************************************************

<@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Validation</title>
</head>
<script type="text/javascript">
 function chreckFrom(){
	alert("이름은 "+document.frm.name.valu+"입니다");
	}
</script>
<body>
	<form name="frm">
		<p> 이름 : <input type="text" name="name">
		<input type="submit" value="전송" onclick="checkForm()">
	</form>
</body>
</html>

******************************************************************************
```

### 유효성 검사 처리 방법
```

기본 유효성 검사 - 폼 페이지에 입력된 데이터 값의 존재 유무를 검사

데이터 형식 유효성 검사 - 폼 페이지에 입력된 데이터 값이 특정 패턴에 적합한지 여부를 검사하며 정규 표현식을 사용

```

# 기본 유효성 검사

```

사용자가 폼 페이지의 입력 항목에 입력한 데이터 값이 있는지 없는지 확인하고 데이터 길이, 숫자 등 기본적인 것이 맞는지 검사

폼 페이지의 입력 데이터 길이를 확인하여 데이터의 유무를 검증하는 것은 기본 유효성 검사에 해당

```

#		데이터 유무 확인하기

```
-데이터 값의 유무에 대한 검사

 회원 가입 페이지에서 사용자가 아이디와 비밀번호 등의 필수 입력 항목을 입력하지 않고
 <전송>을 클릭하면 입력하지 않았다는 오류 메세지가 나타남



		검사 형식
******************************************************************************

document.폼 이름.입력양식 이름.value==""

******************************************************************************

<@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Validation</title>
</head>
<script type="text/javascript">
 function chreckFrom(){
	if (document.frm.name.value==""){
		alert("이름을 입력해주세요.");
		document.frm.name.select();
		}
	}
</script>
<body>
	<form name="frm">
		<p> 이름 : <input type="text" name="name">
		<input type="submit" value="전송" onclick="checkForm()">
	</form>
</body>
</html>

```

# 		데이터 길이 확인하기

```

회원 가입 페이지에서 아이디, 비밀번호 등과 같은 입력 데이터의 제한 길이를 검사하는 것

- 입력 데이터의 조건으로 아이디와 비밀번호는 4~12자 이내로 영어와 숫자를 혼합해서 입력할 것|| 첫 문자는 숫자로 시작할 수 없음 등을 검사

		 형식
******************************************************************************

document.폼 이름.입력양식 이름.value.length

******************************************************************************

<@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Validation</title>
</head>
<script type="text/javascript">
 function chreckFrom(){
	if (document.frm.name.length<6 ||document.frm.name.length>12){
		alert("이름을 6~12자 이내로 입력해주세요.");
		document.frm.name.select();
		}
	}
</script>
<body>
	<form name="frm">
		<p> 이름 : <input type="text" name="name">
		<input type="submit" value="전송" onclick="checkForm()">
	</form>
</body>
</html>

```

#		숫자 여부 확인하기

```

숫자 여부는 isNaN()함수를 활용하여 검사

isNaN (isNotaNumber)
isNaN() 함수의 인자 값이 숫자이면 false를 반환하고 숫자가 아니면 true를 반환


		 형식
******************************************************************************

	isNaN(document.폼 이름.입력양식 이름.value)

******************************************************************************

<@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Validation</title>
</head>
<script type="text/javascript">
 function chreckFrom(){
	if (!isNaN(document.frm.name.value.substring(0,1))) {
		alert("이름은 숫자로 시작할 수 없습니다!");
		document.frm.name.select();
		}
	}
</script>
<body>
	<form name="frm">
		<p> 이름 : <input type="text" name="name">
		<input type="submit" value="전송" onclick="checkForm()">
	</form>
</body>
</html>

```
# 		폼 초기화

````

	전체 폼 초기화

- document.form.reset()

```

```

<input type="submit">에서 onclick속성은 클릭을 했을 때,
	매핑되어 있는 함수를 호출

*****************************************************************************************

function printForm() {
		alert("ID: "+document.loginFrm.id.value+"\n"+
				"PW: "+document.loginFrm.pw.value);

*****************************************************************************************
document : 윈도우 화면
loginFrm : document의 구성요소 중 name이 loginFrm인 폼
⁯id : 폼 안의 id 값
pw : 폼 안의 pw 값

```
```
		<input>

submit 타입에서 onclick 속성은 클릭 했을 때, 매핑 되어 있는 함수를 호출

submit 타입에서 onclick을 누르면 함수를 실행시키고 페이지 이동

button 타입에서 onclick을 누르면 함수를 실행시키고 페이지를 이동시키지 않음

```

```

		||아이디는 영문 소문자로만 입력하도록 수정

	for(var i=0;i<form.id.value.length;i++)
			{
				var ch=form.id.value.charAt(i);
				if((ch<'a' || ch>'z') && (ch>'A' || ch<'Z')&& (ch>'0' || ch<'9'))
					{
						alert("아이디는 소문자만 입력가능합니다");
						form.id.select();
						form.id.focus();
						return;
					}
			}

```

```

	숫자만 사용

	if(isNaN(form.pw.value))
			{
			alert("비밀번호는 숫자로만 입력가능합니다");
			form.pw.select();
			form.pw.focus();
			return;
			}
		

```

# 		데이터 형식 유효성 검사

```

사용자가 폼 페이지의 입력 항목에 입력한 데이터 값이 특정 형태에 적합한지
검사하기 위해 정규 표현식(regular expression)을 사용하는 방법

기본 유효성검사보다 복잡

```

```
정규 표현식

 특정한 규칙을 가진 문자열의 집합을 표현하는데 사용하는 형식 언어
 문자열의 특정 형태를 찾아내기 위해 패턴으로 표현한 수식
 주민등록번호, 전화번호, 이메일과 같이 데이터 형식의 패턴이 일정한 데이터를 검사하는데 이용

***************************************************************************************

	정규 표현식의 사용 형식
- 객체 초기화(object initializer)를 사용하는 방법으로, 입력된 표현식이 거의 바뀌지 않는 상수 형태일 때 사용

var 변수 이름 = /정규표현식/[Flag]

|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

- RegExp 객체를 이용하는 방법으로, 정규 표현식이 자주 변경될 때 주로 사용

var 변수 이름 = new RegExp('정규 표현식',['Flag']);

***************************************************************************************
		Flag 종류

i - 대소문자 구별하지 않고 검출

g - 문자열 내의 모든 패턴 검출

m - 문자열에 줄 바꿈이 있는지 검출

***************************************************************************************

```

```

		정규 표현식의 메소드 종류

test() - 매개변수 값으로 전달되는 문자열이 정규 표현식에 부합한지 판단하여 true/false 반환

exec() - 매개변수 값을 전달되는 문자열에서 정규 표현식에 부합된 문자열을 추출하여 반환

***************************************************************************************


<script type="text/javascript">
 function checkForm() {
	var regExp= /java/i;     ======>  var regExp= new RegExp('java','i'');와 같음
	var str = document.frm.title.value;
	var result= regExp.exec(str);
	alert(result[0]);
	}
</script>

```

		## 정규 표현식의 표현 방법
```
	기본 메타 문자의 종류


^x -> 문자열이 x로 시작

x$ -> 문자열이 x로 종료

x -> 임의이 한 문자를 표현

x+ -> x가 한 번 이상 반복

x? -> x가 존재하거나 존재하지 않음

x* -> x가 0번 이상 반복

x|y -> x또는 y를 찾음

(x) -> 그룹화

(x)(y) -> 그룹 번호를 부여해서 캡쳐, 결과 데이터는 배열 형식

(x)(?:y) -> 결과 값 배열에 캡처하지 않은 그룹은 들어가지 않음

x{n} -> x를 n번 반복한 문자를 찾음

x{n.} -> x를 n번 이상 반복한 문자를 찾음

x{n,m} -> x를 n번 이상 m번 이하 반복한 문자를 찾음

```

```
	문자 클래스의 종류

[xy]  || x또는 y를 찾음

[^xy] || x,y를 제외하고 문자 하나를 찾음

[x-z] || x부터 z 사이의 문자 중 하나를 찾음

\^ || ^(특수문자)을 식에 문자 자체로 포함

\b || 문자와 공백 사이의 문자를 찾음

\B || 공백을 제외한 문자와 문자 사이의 문자를 찾음

\d || 숫자를 찾음

\D || 숫자가 아닌 값을 찾음

\s || 공백 문자를 찾음

\S || 공백이 아닌 문자를 찾음

\t || Tab 문자를 찾음

\v || Vertical Tab 문자를 찾음

\w || 알파벳 + 숫자 + _ 를 찾음

\W || 알파벳 + 숫자 +_ 를 제외한 모든 문자를 찾음

```

```

<script type="text/javascript">
 	function checkForm(){
		var str = document.frm.name.value;
		var regExp = /%[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		if (!regExp.test(str)){
			alert("이름은 숫자로 시작할 수 없습니다");
			return;
			}
		}
</script>

```

```
var id = /^[a-z][0-9]|{4,12}$/; --> 알파벳이나 숫자로 시작하고, 4자 이상 12자 이하

var phone =/^{[0|1|6|7|8|9]?}?{[0-9]{3,4}}?{[0-9]{4}}$/;]

패턴 --> 기본적으로 만들어놓은 것으로 체크

```

```

/^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/   	|| 숫자로 시작하면 안됨

/^[가-힣]*$/			|| 한글만 받음

/^[0-9]*$/			|| 숫자만 가능

```