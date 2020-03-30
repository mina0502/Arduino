from flask import Flask

app= Flask(__name__)

@app.route('/aaa',redirect_to='/new_aaa')
def aaa():
    return "Call /aaa "
@app.route('/new_aaa')
def new_aaa():
    return "Call /new_aaa"

if __name__ == '__main__':
    app.run()
