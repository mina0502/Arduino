-----------------------------------------------------------------------------

	(ex21.py) [GET방식 --> CONTENT_TYPE의 키 값 없으므로 주석처리]

    WSGI(environ) 사전에서 제공하는 표준환경 변수 [ Web Server Gate Information ]
    
 => environ : HTTP 통신에서 사용되는 환경변수를 담고 있는 사전 (WSGI 전용 환경변수도 포함)

 - REQUEST_METHOD : 웹브라우저가 보낸 요청의 처리 방식에 대한 문자열 포함

 - SCRIPT_NAME : 스크립트 파일명을 표현, FLASK에서는 빈 값으로 출력

 - PATH_INFO : URL 경로(PATH), ex) http://www.aaa.com/ccc/main --> /ccc/mian

 - CONTENT_TYPE : 웹브라우저가 보낸 HTTP 요청 메세지의 바디에 포함되는 콘텐츠의 형태 저장

                    HTTP헤더에 Content-type 헤더 값을 확인

 - SERVER_NAME : 서버의 도메인 주소(IP)저장 ex) http://www.aaa.com/ccc/main --> www.aaa.com

 - SERVE_PORT : 웹 어플리케이션이 동작하고 있는 서버포트번호 저장 ex) http://www.aaa.com:5000/etc ==> 5000저장 <도메인주소에 포트 없을 경우 80저장>

 - SERVE_PROTOCOL : 웹 어플리케이션이 동작하는 서버 프로토콜 버전이 표시, ex) HTTP/1.1

 - QUERY_STRING : URL 끝에 '?' 문자 뒤에 오는 문자열을 쿼리 스트링 ex) 키 = 값 형태
                    키 값이 2개이상일 경우 키사이 '&' 문자로 구분


     < WSGI 전용 환경 변수 >

 - wsgi.version : WSGI 버전을 튜플 형태로 반환(1,0)

 - wsgi.url_scheme : URL 스키마 종류, 웹서버==> http 반환
 
 
 -----------------------------------------------------------------------------

	(ex21_1.py)

	메서드의 타입 확인 (GET , POST)

 -----------------------------------------------------------------------------

    	(ex21_2.py)

    	request URL 관련 속성

 - path : URL 경로 (환경변수의 PATH_INFO)

 - url : 전체 URL 표시

 - base_url : QUERY_STRING을 제외한 URL 표시

 - url_root : 웹서버 도메인 표시 (환경변수의 SERVER_NAME)

-----------------------------------------------------------------------------

    (endpoint.py)



from flask import Flask,request,url_for

app = Flask(__name__)

@app.route("/jelly/mina",methods=["GET","POST"])
def a():
    endpoint = url_for(request.endpoint)
    return endpoint

if __name__=="__main__":
    app.run()

-----------------------------------------------------------------------------

==> 결과값 : /jelly/mina
    
-----------------------------------------------------------------------------

    (endpoint.py)

from flask import Flask,request

app = Flask(__name__)

@app.route("/jelly/mina",methods=["GET","POST"])
def a():
    endpoint = request.endpoint
    return endpoint

if __name__=="__main__":
    app.run()

-----------------------------------------------------------------------------

==> 결과값 : a
    
-----------------------------------------------------------------------------