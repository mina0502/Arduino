from flask import Flask,render_template,current_app,g

app = Flask(__name__)

@app.route('/')

def hello():
    return 'current App!!!<br>'+"<br/>".join(dir(current_app))

@app.route('/hi')
def hi():
    return 'Hi Flask!'+"<br/>"+g.test

@app.before_request
def before_request():
    g.test = "before_request"
    print('before request')

@app.teardown_request

def teardown_request(exception):
    print(app.app_context()) 
    print('end request')

if __name__ == "__main__":
    app.run()
