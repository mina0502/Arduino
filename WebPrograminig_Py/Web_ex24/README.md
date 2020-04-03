------------------------------------------------------------------------------------------------------

	(ex24.py)

        Session : 쿠키가 클라이언트에 저장되어 보안이 위험, 서버에 데이터 저장

        flask 모듈에 session 객체를 이용하여 세션을 설정한다.



        Flask 세션 관련키 [환경변수]


     - SECRET_KEY : 비밀키

     - SESSION_COOKIE_NAME : 세션 쿠키 이름, default : session

     - SESSION_COOKIE_DOMAIN : 세션 쿠키가 동작할 도메인 주소, default : SERCER_NAME에 있는 도메인에서 동작

     - SESSION_COOKIE_PATH : 세션 쿠키가 동작할 URL 경로, default : root ('/')

     - SESSION_COOKIE_HTTPONLY : 웹어플리케이션이 HTTP 프로토콜로 동작할 때만 세션 쿠키를 웹어플리케이션에 전송
                                default = True

     - SESSION_COOKIE_SECURE : 웹어플리케이션이 HTTPS 프로토콜로 동작할 때만 세션 쿠키를 웹어플리케이션에 전송
                                default = False

     - PERMANENT_SESSION_LIFETIME : 세션의 유효시간을 설정, default = False(31days)

     - LOGIN 확인..

     세션 환경변수 변경

app.config.update(

    SECRET_KEY='exam1234%'
    
    SESSION_COOKIE_NAME=''
    
    PERMANENT_SESSION_LIFETIME=''
    
    )

------------------------------------------------------------------------------------------------------
