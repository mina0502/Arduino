```
        (ex26.py)
        
    HTTP 요청 전후에 대한 핸들러 [request Hooking]

    Flask에서 제공하는 데코레이터

 - before_first_request : 웹프로그램이 실행된 이후 가장 처음에 들어오는 HTTP 요청에서만 실행

 - before_request : HTTP요청(request)이 들어올 때마다 실행

 - after_request : HTTP 요청이 끝나고 브라우저에 응답전에 실행

 - teardown_request : HTTP 요청의 결과가 브라우저에 보내진 다음 실행

 - teardown_appcontext : HTTP 요청이 완전히 완료되면 실행 (Application context 내에서 실행)
```
```

        (Global_Value.py)
        
    Flask context 전역변수


          [request를 처리하기 위해 제공되는 객체]


            <어플리케이션 Context>
            
 - current_app : 활성화된 어플리케이션의 인스턴스
 

 - g :  request를 처리하는 동안 어플리케이션 임시 저장정보를 사용할 수 있는 객체
         Flask 인스턴스 객체의 app_ctx_globals_class의 인스턴스 변수
         [g 는 request 할때마다 새롭게 갱신됨]


            <Request Context>

 - request : Client에 의해 송신된 HTTP request의 contetnts를 관리하는 객체

 - session : 사용자 session, 어플리케이션 request 사이의 정보를 저장해서 사용하는 dict 타입 객체
  
```

```
	(Global_Value.py)
app_context는 current_app(application context)을 리턴해준다

```
