
from flask import Flask,request,url_for

app = Flask(__name__)

@app.route("/jelly/mina",methods=["GET","POST"])
def a():
    endpoint = url_for(request.endpoint)
    return endpoint

if __name__=="__main__":
    app.run()


'''

from flask import Flask,request

app = Flask(__name__)

@app.route("/jelly/mina",methods=["GET","POST"])
def a():
    endpoint = request.endpoint
    return endpoint

if __name__=="__main__":
    app.run()
'''
