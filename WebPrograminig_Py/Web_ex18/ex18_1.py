from flask import Flask,request
from datetime import datetime

app=Flask(__name__)
# 사용자 정의 함수
def userDateType(date_format):
    def changeFormat(date_string):
        #strptime(date_string,format): format에 맞는 date_string을 datetime 객체로 return
        return datetime.strptime(date_string,date_format)
    return changeFormat

@app.route('/ddd',methods=["GET","POST"])
def ddd():
    print(request.values.get("date",default="2020-03-31",type=userDateType('%Y-%m-%d')))
    return "Check the consloe "

if __name__ == "__main__":
    app.run()
