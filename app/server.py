import time as t
import bottle
from bottle import request, response, template, redirect
from bottle import HTTPError, static_file
from app import db

# "sqlite:///my_db.sqlite"
def createApp():
    app = bottle.Bottle()
    app.config.load_config('sse_server.conf')    
    app.config.setdefault('server', 'gunicorn')
    app.config.setdefault('host', 'localhost')
    app.config.setdefault('port', 8080)
    app.config.setdefault('threads', 6)
    app.config.setdefault('workers', 4)
    app.config.setdefault('dbname','sqlite:///my_db.sqlite')
    return app

app = createApp()
@app.route('/images/<filename>')
def static_images(filename):
    return static_file(filename, root='./assets/images')

@app.route('/css/<filename>')
def static_css(filename):
    return static_file(filename, root='./assets/css')

@app.route('/src/<filename>')
def static_src(filename):
    return static_file(filename, root='./assets/src')

@app.get('/')
def get_main():
    return template("votingMainPage.tpl", protocol = 'http', host = app.config.host, port = app.config.port)

@app.get('/results/')
def get_results():
    return template("votingMainResults.tpl", protocol = 'http', host = app.config.host, port = app.config.port)

@app.route('/sse/vote/stats')
def get_stat():
    response.content_type = 'text/event-stream'
    response.cache_control = 'no-cache'
    response.headers["Access-Control-Allow-Origin"] = '*'
    response.headers["Access-Control-Allow-Headers"] = "DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range"
    response.headers["Access-Control-Allow-Methods"] = "GET, POST, OPTIONS"
    response.headers["Access-Control-Expose-Headers"] = "Content-Length,Content-Range"
    yield f'retry: 500\n\n'
    votes_ = db.get_votes(app.config.dbname)
    s_ = [f'"{ani_}":{vot_}' for ani_, vot_ in votes_.items()]
    s = ",".join(s_)
    yield f"data:.{s};\n\n".replace('.','{').replace(';','}')

@app.post('/results/')
def post_results():
    post_data = request.forms.survey
    if db.add_vote(app.config.dbname, post_data):
        redirect('/results/')
    else:
        return HTTPError(409, "Что-то пошло не так!")

@app.post('/sse/vote/<param>')
def post_cats(param):
    if not param in ['cats', 'dogs', 'parrots']:
        return HTTPError(409, "Ошибка фракции!")
    if db.add_vote(app.config.dbname, param):
         redirect('/results/')
    else:
        return HTTPError(409, "Ошибка фракции!")
