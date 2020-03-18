from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return "<h1>Hello World!</h1>"

# string type of username parameter (String type = default)
@app.route('/user/<username>')
def show_user(username):
    return 'User %s' % username #string (User) and Dynamic

# int Type of Post_id parameter
@app.route('/post/<int:post_id>')
def show_post(post_id):
    return 'Post %d'% post_id

# float type of pi parameter
@app.route('/F/<float:pi>')
def show_pi(pi):
    return 'Pi %f'% pi

if __name__=="__main__":
    app.run()
