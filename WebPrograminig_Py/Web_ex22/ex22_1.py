from flask import Flask,Response

app =Flask(__name__)

@app.route('/')
def res():
    res = Response('Respon Test')

    res.set_data('Flask Test')

    return res

if __name__=='__main__':
    app.run()
