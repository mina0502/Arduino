 매크로를 정의한 템플릿과 매크로를 사용하는 템플릿이 서로 다를 경우
    import명령을 이용하여 불러온다(2가지 방법)
---------------------------------------------------------------------------------------
macro_input.html

1번째 (input1_1.html)
    
    {% from macro_input.html import input%}
    
    
    <p>{{input('username')}}</p>
    <p><{{input('password',type='password')}}</p>

---------------------------------------------------------------------------------------
macro_input.html

2번째 (input1_2.html)
    
    {% import 'macro_input.html' as input_macro%}
      <p>{{input_macro.input('username')}}</p>
      <p>{{input_macro.input('password',type='password')}}</p>
---------------------------------------------------------------------------------------

  매크로의 특별 변수 (macro_input2.html , input2.html)

  -varargs : 매크로가 추가로 받은 가변 인자를 참조할 때 사용, 리스트 형태의 인자
  -kwargs : 매크로가 추가로 받은 키워드 인자를 참조할 때 사용, 사전 형태
  -caller : 매크로를 호출한 call블록을 호출하기 위해서 사용,
            매크로가 call 블록에서 호출 되었을 때만 사용가능  
