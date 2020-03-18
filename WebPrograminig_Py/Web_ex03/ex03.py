from flask import Flask,render_template
app=Flask(__name__)

@app.route('/')
def main():
    return render_template('ex03.html') # mk folder(templates) included .py files

if __name__=='__main__':
    app.run()
