from flask import Flask

app = Flask(__name__)

def redirect_new_aaa(adapter,p1,p2):
    return "/new_aaa/{0}/{1}".format(p1,p2)

@app.route('/aaa/<p1>/<p2>',redirect_to=redirect_new_aaa)
def aaa(p1,p2):
    return "Call /aaa/p1/p2 page."

@app.route("/new_aaa/<p1>/<p2>")
def new_aaa(p1,p2):
    return "Call /new_aaa/{0}/{1}".format(p1,p2)

if __name__=='__main__':
    app.run()
