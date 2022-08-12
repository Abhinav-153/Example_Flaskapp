from logging import debug
from flask import Flask
import socket

app = Flask(__name__)

hostname = socket.gethostname()
IPAddr = socket.gethostbyname(hostname)


@app.route('/')
def hello_world():
    return f"<p>Hostname:{hostname} <br>IP:{IPAddr}  </p>"



if __name__ == "__main__":
    print(socket.gethostname())
    app.run(host="0.0.0.0")
