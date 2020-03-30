from flask import Flask

app = Flask(__name__)

@app.route('/aaa',defaults={'bbs_id':100})
@app.route('/aaa/<bbs_id>')

def aaa(bbs_id):
    return "{}번 입니다.".format(bbs_id)


if __name__=='__main__':
    app.run()
