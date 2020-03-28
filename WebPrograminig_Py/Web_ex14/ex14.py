from flask import Flask, render_template

app= Flask(__name__)

@app.route('/')

def test_app():
    return render_template('layout.html',title="Test",my_body="TEST")

@app.route('/home')

def home():
    return render_template('layout.html',title = "Home",my_body="Main Page")

@app.route('/about')

def about():
    return render_template('layout.html', title="About", my_body="About Page")

@app.route('/contact')

def contact():
    return render_template('layout.html', title="Contact Us",my_body = "Contact Page")

@app.route('/mina')

def mina():
    return render_template('layout.html', title="mina",my_body="Mina Page")

if __name__ =="__main__":
    app.run()
