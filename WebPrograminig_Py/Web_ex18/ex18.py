from flask import Flask,request

app=Flask(__name__)

@app.route('/ccc',methods=["GET","POST"])
def ccc():
    return request.values.get("name",default="No data")


if __name__=="__main__":
    app.run()
