from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/login',methods=['GET','POST'])
def login():
    #Get 
    if request.method=='GET':
        return render_template('test_login.html')
    #Post
    else:
        userEmail = request.form['email']
        userpassword = request.form['password']
        
        return "E_mail: "+userEmail+"<br/> Password: "+ str(userpassword)+"<br/>"

if __name__=="__main__":
    app.run()
