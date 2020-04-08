from flask import *
import sqlite3

DATABASE = 'my.db'
SECERET_KEY='development key'
USERNAME = 'root'
PASSWORD='1234'


def connect_db():
    return sqlite3.connect(app.config['DATABASE'])


def createTable(g):
    try:
        sql = "create table if not exists student(name text, age int)"
        g.db.execute(sql)
        g.db.commit()
    except Exception as err:
        print('error: ', err)
        
app =Flask(__name__)

app.config.from_object(__name__)

@app.before_request
def before_request():
    g.db=connect_db()
    createTable(g)
    print('before request')
    
@app.teardown_request
def teardown_request(exception):
    g.db.close()
    print('end request')

@app.route('/insert')
def insertData():
    result = 'insert success'
    try:
        sql = 'INSERT INTO student(name,age)VALUES(?,?)'
        data=('Mina',25)
        #data=('Jelly',12)
        g.db.execute(sql, data)
        g.db.commit()
    except Exception as err:
        result = err
    return result

@app.route('/select')
def select_stuData():
    try:
        sql = 'SELECT * from student'
        cur=g.db.execute(sql)
        data=cur.fetchall()
        stu_Data=[dict(name= n, age = age) for n, age in data]

    except Exception as err:
        print('error: ',err)

    return render_template('view_stuData.html',stuData=stu_Data)

@app.route('/')
def test():
    return 'hello Flask'

if __name__ == "__main__":
    app.run()

