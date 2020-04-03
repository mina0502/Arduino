from flask import Flask,request,Response

app=Flask(__name__)

@app.route('/cookie_set')
def cookieSet():
    res=Response("CooKie Setting")
    res.set_cookie("Name","Cookie Test")

    return res

@app.route('/cookie_out')
def cout():
    res = Response('Cookie Delete')
    res.set_cookie('Name',expires=0)

    return res
@app.route('/cookie_status')
def cstatus():
    return "Name's Value =  %s"%request.cookies.get('Name','') 

if __name__=='__main__':
    app.run()
    
