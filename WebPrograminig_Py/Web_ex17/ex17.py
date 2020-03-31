from flask import Flask,request

app=Flask(__name__)

#Get방식에서 넘어온 변수값 가져오기
@app.route('/aaa')
def aaa():
    return "request 객체를 이용한 변수 name값 : {}".format(request.args.get('name'))

if __name__=="__main__":
    app.run()
# request.args에서 args는 Get방식으로 전달된 데이터만 접근할 수 있다.
