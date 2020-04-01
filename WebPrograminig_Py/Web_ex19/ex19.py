from flask import Flask,request
from datetime import datetime

class userDateType:
    def __init__(self,format):
        self.format=format


    def __call__(self,*args,**kwargs):
        return datetime.strptime(args[0],self.format)

app=Flask(__name__)

@app.route('/fff',methods=["GET","POST"])

def fff():
    print(request.values.get("date","2020-04-01",type=userDateType("%Y-%m-%d")))
    return "Check the Console"

if __name__ == "__main__":
    app.run()
