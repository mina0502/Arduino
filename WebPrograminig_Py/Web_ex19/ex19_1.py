from flask import Flask,request

from datetime import datetime

app = Flask(__name__)

class userDateType:
    def __init__(self,format):
        self.format=format

    def __call__(self,*args,**kwargs):
        return datetime.strptime(args[0],self.format)
    
@app.route('/ggg',methods=["GET","POST"])

def ggg():
    print(request.values.getlist("dates",type=userDateType("%Y-%m-%d")))
    return "Check the Console"

if __name__ == "__main__":
    app.run()
