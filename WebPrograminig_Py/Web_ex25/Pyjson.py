from flask import Flask,jsonify

app = Flask(__name__)

works=[
    {'id':100,
     'title':u'Buy',
     'description':u'milk,cheese,fruit,piza',
     'done':False
     },
    {
        'id':200,
        'title':u'Study Flask',
        'description':u'Web Programing',
        'done':False
        }
    ]

@app.route('/json',methods=['GET'])

def get_works():
    return jsonify(works)

if __name__=="__main__":
    app.run()
