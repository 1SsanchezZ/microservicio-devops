# Microservicio DevOps

**Evaluación Parcial 2 - Ingeniería DevOps**

## Descripción del proyecto
Este repositorio contiene un microservicio desarrollado con **Flask** que fue utilizado como base para implementar prácticas DevOps modernas. Durante el desarrollo se integraron herramientas de control de versiones, automatización, pruebas, contenerización, seguridad y orquestación.

El objetivo principal fue construir un flujo de trabajo que permitiera automatizar la validación y ejecución del proyecto utilizando Docker, GitHub Actions y herramientas de seguridad, siguiendo los principios de CI/CD y DevSecOps.

# Tecnologías utilizadas

* Python 3
* Flask
* Docker
* Docker Compose
* Git
* GitHub
* GitHub Actions
* PyTest
* Dependabot
* Trivy

# Estrategia de ramificación

Para este proyecto se evaluaron tres modelos de ramificación:

## GitFlow

Modelo estructurado que utiliza ramas dedicadas para cada etapa del desarrollo: main, develop, feature, hotfix y release.

## GitHub Flow

Modelo simplificado basado en una rama principal y ramas de características.

## Trunk-Based Development

Modelo donde todos los desarrolladores integran cambios directamente sobre una rama principal.

## Justificación de elección

Se eligió **GitFlow** porque permite separar claramente el código estable del código en desarrollo, facilitando la colaboración entre integrantes del equipo y manteniendo una correcta trazabilidad de los cambios realizados.

# Ramas utilizadas

| Rama                        | Descripción                           |
| --------------------------- | ------------------------------------- |
| main                        | Código estable                        |
| develop                     | Integración de nuevas funcionalidades |
| feature/health              | Desarrollo de endpoints               |
| hotfix/fix-error-404        | Corrección de errores                 |
| dependabot/pip/flask-3.1.3  | Actualización automática              |
| dependabot/pip/pytest-9.0.3 | Actualización automática              |

# Convenciones de commits

Se utiliza el estándar **Conventional Commits**.

| Prefijo   | Uso                   |
| --------- | --------------------- |
| feat:     | Nueva funcionalidad   |
| fix:      | Corrección de errores |
| docs:     | Documentación         |
| ci:       | Configuración CI/CD   |
| test:     | Pruebas automatizadas |
| refactor: | Mejora interna        |

Ejemplo:

```text
feat: agregar orquestación con Docker Compose
```

# Flujo de trabajo colaborativo

```bash
git clone https://github.com/1SsanchezZ/microservicio-devops

git checkout -b feature/nueva-funcionalidad

git add .
git commit -m "feat: descripción"

git push origin feature/nueva-funcionalidad
```

Posteriormente se crea un Pull Request para revisión y aprobación antes de realizar el merge.


# Estructura del proyecto

```text
microservicio-devops/
│
├── app.py
├── requirements.txt
├── Dockerfile
├── docker-compose.yml
├── README.md
├── .gitignore
│
├── templates/
│   └── index.html
│
├── tests/
│   └── test_app.py
│
└── .github/
    ├── dependabot.yml
    └── workflows/
        └── ci.yml
```

# Endpoints disponibles

| Endpoint  | Descripción         |
| --------- | ------------------- |
| /         | Página principal    |
| /health   | Estado del servicio |
| /usuarios | Lista de usuarios   |
| /saludo   | Mensaje de saludo   |


# Docker

Docker fue utilizado para contenerizar el microservicio, permitiendo ejecutar la aplicación de manera consistente en distintos entornos.

## Construcción de imagen

```bash
docker build -t microservicio-devops .
```
## Ejecución del contenedor

```bash
docker run --name microservicio-devops -d -p 5000:5000 microservicio-devops
```

# Docker Compose

Docker Compose fue utilizado para orquestar el servicio localmente.

## Levantar el servicio

```bash
docker compose up -d --build
```

## Detener el servicio

```bash
docker compose down
```

## Sincronización automática de cambios

Se configuró un volumen Docker:

```yaml
volumes:
  - .:/app
```

Esto permite que cualquier cambio realizado localmente se refleje automáticamente dentro del contenedor durante el desarrollo.

# Pruebas automatizadas con PyTest

Se implementaron pruebas unitarias para validar el correcto funcionamiento de los endpoints principales.

## Ejecutar pruebas

```bash
python -m pytest
```

Resultado esperado:

```text
4 passed
```

Las pruebas permiten detectar errores tempranamente y aumentar la calidad del software.

# GitHub Actions y CI/CD

## ¿Qué es CI/CD?

CI/CD significa Integración Continua y Entrega Continua.

### CI (Continuous Integration)

Automatiza la validación del código cada vez que se realiza un cambio en el repositorio.

### CD (Continuous Delivery)

Automatiza la preparación del software para su despliegue.

# Pipeline implementado

El pipeline configurado en GitHub Actions realiza automáticamente:

1. Instalación de dependencias.
2. Ejecución de pruebas con PyTest.
3. Construcción de imagen Docker.
4. Escaneo de seguridad con Trivy.

El pipeline se ejecuta automáticamente ante:

* Push a main.
* Push a develop.
* Pull Requests.

# Dependabot

Dependabot fue configurado para monitorear dependencias del proyecto y generar Pull Requests automáticos cuando existan nuevas versiones o posibles vulnerabilidades.

Esto permite mantener las dependencias actualizadas y mejorar la seguridad del proyecto.

# Seguridad y DevSecOps

## Trivy

Trivy fue integrado dentro del pipeline para realizar análisis de vulnerabilidades sobre la imagen Docker generada.

La configuración utilizada fue:

```yaml
exit-code: '1'
severity: CRITICAL,HIGH
```

Esto significa que el pipeline se detiene automáticamente cuando se detectan vulnerabilidades HIGH o CRITICAL.

### Evidencia del comportamiento esperado

Durante la ejecución del pipeline se observó que:

* Las pruebas unitarias fueron exitosas.
* La imagen Docker fue construida correctamente.
* El escaneo de seguridad bloqueó la ejecución debido a vulnerabilidades detectadas.

Este comportamiento es esperado y demuestra que la política de seguridad está funcionando correctamente.

El estado de error no corresponde a una mala configuración del proyecto, sino a una medida de protección implementada mediante prácticas DevSecOps.


# Evidencias

Se incorporaron capturas de pantalla que demuestran:

* Ejecución del pipeline en GitHub Actions.
* Funcionamiento de Docker Compose.
* Resultado de las pruebas PyTest.
* Pull Requests generados por Dependabot.
* Escaneo de seguridad con Trivy.
* Funcionamiento del microservicio en localhost.

# Uso de Inteligencia Artificial

Se utilizó inteligencia artificial únicamente como apoyo para:

* Corrección de documentación.
* Explicación de conceptos DevOps.
* Resolución de dudas técnicas.
* Validación de comandos Docker y Git.

Todas las decisiones técnicas, configuraciones y validaciones fueron realizadas y verificadas por los integrantes del equipo.


# Conclusiones

## Integrante 1 - John Zapata

Durante esta evaluación fue posible comprender de manera práctica cómo automatizar un pipeline CI/CD completo utilizando Docker, GitHub Actions y pruebas automatizadas. Además, se logró integrar conceptos de seguridad DevSecOps y orquestación de contenedores mediante Docker Compose.

## Integrante 2 - Constanza Mena

Esta evaluación permitió aplicar conocimientos previos sobre microservicios y complementarlos con herramientas DevOps modernas. La implementación de Docker, PyTest, GitHub Actions, Dependabot, Trivy y Docker Compose ayudó a comprender mejor la automatización, trazabilidad y seguridad dentro del ciclo de desarrollo de software.
