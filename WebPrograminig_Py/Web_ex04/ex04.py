# test_request_context(): Flask in method, HTTP Test for request
#using url_for()

from flask import Flask,url_for
app=Flask(__name__)
@app.route('/hello/') # '/hello' [System File]  ... '/hello/' [ reDirect] 
def hello():
    return "<h1>Hello world!!</h1>"
@app.route('/user/<username>')
def get_user(username):
    return 'User'+ username

if __name__=='__main__':
    with app.test_request_context():# in Flask
        print( url_for('hello') )# View founction Name
        print (url_for('get_user',username='mina')) # collect the request? 

# Find Uri Value
