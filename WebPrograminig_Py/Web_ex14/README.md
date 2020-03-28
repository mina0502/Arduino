-----------------------------------------------------------

    (macro.html)

Flask , jinja 에서 request 객체 있음 (요청 객체)

요청객체 사용시 request 이용


request.endpoint.endswith(변수)

endswith --> 특정 문자 찾기

-----------------------------------------------------------

    (layout.html)
    
    일반

    <li class="active"><a href="/">Home</a></li>
    <li><a href="#">About</a></li>
    <li><a href="#">Contact Us</a></li>


    매크로 처리


    {%from "매크로.html" import 매크로이름 with context %}
    {{매크로이름('home','Home')}}
    {{매크로이름('about','About')}}
    {{매크로이름('contact','Contact Us')}}

    {{매크로이름('root주소','메뉴이름')}}

-----------------------------------------------------------

    (ex14.py)

    각각의 URL에 관한 링크 설정
    
    @app.route('/home')
    @app.route('/about')
    @app.route('/contact')

-----------------------------------------------------------

    (Note)

    매크로(사용)의 앞부분

    'home' 부분과 .py파일의 루트('/home')이 일치해야함
    {{매크로이름('home','Home')}} < == > @app.route('/home')
    

-----------------------------------------------------------
