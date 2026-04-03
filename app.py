from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({"mensaje": "Microservicio funcionando"})

@app.route('/health')
def health():
    return jsonify({"status": "ok"})

@app.route('/usuarios')
def usuarios():
    return jsonify({"usuarios": ["Juan", "María", "Pedro"]})

if __name__ == '__main__':
    app.run(debug=True)