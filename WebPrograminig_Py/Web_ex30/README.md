'''
```
        HTTP Error Code


    
    200 - 제대로 처리 [사용자 요청 성공 메세지 OK]
    
    400 - 잘못된 요청 [Bad Request]
    401 - 인증이 요구되는 리소스에 접근했을 때 인증하지 않은 상태 [Unauthorized]
    403 - 권한이 필요한 리소스에 접근했는데 인증된 사용자가 접근할 수 없을 경우 [Forbiddend]
    404 - 요구한 리소스가 없을 경우 [Not found]
    405 - GET, POST로 리소스를 요청하고 웹프로그램이 접근 허용하지 않을 경우[Method Allowed]
    
    500 - 웹 프로그램의 내부 오류로 인해 응답할 수 없는 경우 [Internal Server Error]
    501 - 브라우저가 요청한 기능이 웹프로그램에서 구현되지 않을 경우 [Not implemented]
    502 - 웹프로그램이 외부 서비스와 연동하면서 오류가 발생했을 경우 [Bad Gateway]
    503 - 웹프로그램의 기능 구현은 되어 있는데 서비스 사용이 불가능 할 경우 [Service Unavaliable]
```
```
                        Handling
                        
    route데코레이터와 같은 동작을 하는 errorhandler 데코레이터

 @app.errorhandler(OOO)
  def page_not_found(e):
      return render_template('OOO.html'),OOO

    OOO 는 Error Code 인수
    
```
```
                        abort

    Flask에서 에러를 발생시키는 객체

  abort(OOO)
```
'''
