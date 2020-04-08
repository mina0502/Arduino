from flask import Flask

app= Flask(__name__)

@app.route('/')

def test():
    return '/'

@app.before_first_request
def before_firest_request():
    print(" First HTTP request ")

@app.before_request
def before_request():
    print("HTTP request Before")

@app.after_request
def after_request(response):
    print("HTTP request After")
    return response #반드시  response 필요

@app.teardown_request
def teardown_request(exception):
    print("HTTP requset result to Send Browser then call")

@app.teardown_appcontext
def teardwon_appcontext(exception):
    print("HTTP request application context to end")

if __name__=="__main__":
    app.run()
