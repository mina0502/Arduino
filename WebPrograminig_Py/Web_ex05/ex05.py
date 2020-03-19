#Jinja2 템플릿 엔진

#Flask 설치할 때 같이 설치되기 때문에 추가 설치 할 필요 없음
#플라스크의 템플릿 파일들은 기본적으로 /templates/ 폴더에 저장

from flask import Flask,render_template
#render_template app과 template Jina2 통합 역할 (꼭 불러와야함)

app=Flask(__name__)

@app.route('/')
def hello():
    return '<h1>Hello world!!</h1>'

@app.route('/user/<username>')
def user(username):
    return render_template('user.html',name=username)
#render --> 템플릿을 보여주는 역할도함

if __name__=='__main__':
    app.run()
