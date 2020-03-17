#PyPI(python Package Index): 파이썬 패키지 설치하는 프로그램 (주로, cmd 창,쉘에서 사용)
#명령어 --> pip
from flask import Flask

app = Flask(__name__)

@app.route("/") #보안상 안전, 관리에 편리

def hello():
    return "Hello World!"

if __name__== "__main__":
    app.run()
