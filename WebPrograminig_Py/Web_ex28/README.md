```
        (ex28.py)
    app.config.from_object 메소드를 이용한 SQLite config 설정


    SQLite 환경설정

 - DATABASE: 데이터베이스가 만들어질 경로지정
             --> 경로 설정 가능하며 경로 없을 경우 현재 실행되고 있는 어플리케이션의 위치에 생성
 - SECERET_KEY

 - USERNAME : DB에 접근하기 위한 유저 이름

 - PASSWORD : 비밀번호
 

            Request Hooking (HTTP 요청 전후 처리)

 - request 처리전에 데이터베이스 접속 및 테이블 생성 필요

 - request 처리 후 데이터베이스 접속을 종료
 
```

```
	(change_ex28.py)

ex28.py의 소스파일에서 form 형식을 통한 input
```