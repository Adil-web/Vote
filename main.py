import bottle

from app.server import app

if __name__ == "__main__":
    bottle.run(
        app=app, host=app.config.host, port=app.config.port, server=app.config.server,
        threads = app.config.threads, workers = app.config.workers)
