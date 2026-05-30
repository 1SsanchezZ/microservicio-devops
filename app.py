from flask import Flask, jsonify, render_template

app = Flask(__name__)

@app.route('/')
def home():
    return render_template("index.html")

@app.route('/health')
def health():
    return jsonify({"status": "ok"})

@app.route('/usuarios')
def usuarios():
    return jsonify({"usuarios": ["Juan", "María", "Pedro"]})

@app.route('/saludo')
def saludo():
    return jsonify({"mensaje": "Hola desde el microservicio!"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
    