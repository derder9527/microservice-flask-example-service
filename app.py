from flask import Flask

import os

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello World!'


if __name__ == '__main__':
    FLASK_RUN_PORT=os.getenv('FLASK_RUN_PORT')
    FLASK_RUN_HOST=os.getenv('FLASK_RUN_HOST')
    app.run(host=FLASK_RUN_HOST,port=FLASK_RUN_PORT)
