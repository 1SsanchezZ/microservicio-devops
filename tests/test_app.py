from app import app

def test_home():
    client = app.test_client()
    response = client.get('/')
    assert response.status_code == 200
    assert b"Microservicio DevOps" in response.data

def test_health():
    client = app.test_client()
    response = client.get('/health')
    assert response.status_code == 200
    assert response.json["status"] == "ok"

def test_usuarios():
    client = app.test_client()
    response = client.get('/usuarios')
    assert response.status_code == 200
    assert "usuarios" in response.json

def test_saludo():
    client = app.test_client()
    response = client.get('/saludo')
    assert response.status_code == 200
    assert response.json["mensaje"] == "Hola desde el microservicio!"