from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({"mensaje": "Microservicio funcionando"})

@app.route('/health')
def health():
    return jsonify({"status": "ok", "version": "1.0"})

@app.route('/saludo')
def saludo():
    return jsonify({"mensaje": "Hola desde el microservicio!"})

@app.route('/usuarios')
def usuarios():
    return jsonify({"usuarios": ["Juan", "Maria", "Pedro"]})

if __name__ == '__main__':
    app.run(debug=True)
