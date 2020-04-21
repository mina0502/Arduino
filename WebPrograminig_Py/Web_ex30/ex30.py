from flask import Flask,abort

app=Flask(__name__)

@app.route('/')

def start():
    return abort(404)#401 402 403 404 500 501
    
if __name__=="__main__":
    app.run()
