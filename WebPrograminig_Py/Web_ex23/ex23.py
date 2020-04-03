from flask import Flask,Response

app = Flask(__name__)

@app.route('/')
def test():
    res=Response('Flask Test')
    res.set_cookie('ID','Mina')
    return res

if __name__ =='__main__':
    app.run()
