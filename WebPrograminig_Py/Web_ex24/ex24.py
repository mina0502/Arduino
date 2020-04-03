from flask import Flask,request,session

app = Flask(__name__)

app.secret_key="Test1234%"
@app.route('/session')

def test():
    session['ID']='Flask Test'
    return 'Setting session'

@app.route('/session_out')
def session_out():
    del session['ID']
    return 'delete session'

if __name__=='__main__':
    app.run()
