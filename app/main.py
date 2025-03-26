from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from my Jenkins CI/CD pipeline (port 5000)!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)  # Using port 5000 instead of 8080
