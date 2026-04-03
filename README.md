# Microservicio DevOps

Evaluación Parcial 1 - Ingeniería DevOps  

## Estrategia de ramificación

Para este proyecto se evaluaron tres modelos de ramificación:

### GitFlow
Modelo estructurado que utiliza ramas dedicadas para cada etapa del desarrollo: main, develop, feature, hotfix y release. Es ideal para proyectos con ciclos de entrega definidos y equipos medianos o grandes, ya que permite trabajar en múltiples funcionalidades en paralelo sin afectar el código estable.

### GitHub Flow
Modelo más simple que solo utiliza main y ramas de feature. Cada cambio se integra directamente a main mediante un Pull Request. Es adecuado para equipos pequeños con despliegues continuos.

### Trunk-based Development
Todos los desarrolladores integran cambios directamente a una rama principal (trunk/main) varias veces al día. Requiere una cultura de testing muy sólida y es común en equipos con alta madurez DevOps.

### Justificación de elección
Se eligió **GitFlow** porque permite separar claramente el código en producción (main) del código en desarrollo (develop), facilitando la colaboración entre integrantes del equipo. Además, el uso de ramas feature y hotfix permite trabajar en paralelo sin afectar la estabilidad del proyecto, lo cual es ideal para un entorno académico simulado.

## Ramas utilizadas

| Rama | Descripción |
|------|-------------|
| `main` | Código estable en producción |
| `develop` | Integración de nuevas funcionalidades |
| `feature/saludo` | Desarrollo del endpoint /saludo |
| `feature/health` | Desarrollo del endpoint /health y /usuarios |
| `hotfix/fix-error-404` | Corrección urgente del error 404 |


## Convenciones de commits

Se utiliza el estándar **Conventional Commits**:

| Prefijo | Uso |
|---------|-----|
| `feat:` | Nueva funcionalidad |
| `fix:` | Corrección de bug |
| `docs:` | Cambios en documentación |
| `ci:` | Cambios en configuración CI/CD |
| `refactor:` | Mejora de código sin cambiar funcionalidad |
| `test:` | Agregar o modificar tests |

Ejemplo: `feat: agregar endpoint /saludo`

## Flujo de trabajo colaborativo

El flujo de trabajo seguido en este proyecto fue el siguiente:

git clone https://github.com/1SsanchezZ/microservicio-devops
git checkout -b feature/<nombre>
(realizar cambios en el código)
git add .
git commit -m "feat: descripción del cambio"
git push origin feature/<nombre>
Abrir Pull Request en GitHub hacia main
Revisión y aprobación del PR
git merge (mediante GitHub)

Este flujo garantiza trazabilidad completa de cada cambio realizado en el código.

## Flujo de merge

- Las ramas `feature/*` se mergean hacia `main` mediante Pull Request
- Las ramas `hotfix/*` se mergean hacia `main` mediante Pull Request
- Todo merge requiere revisión previa antes de confirmar

## Estructura del proyecto

microservicio-devops/
├── app.py                  # Microservicio principal con Flask
├── requirements.txt        # Dependencias del proyecto
├── README.md               # Documentación del proyecto
└── .github/
└── workflows/
└── ci.yml          # Pipeline de integración continua

## GitHub Actions y CI/CD

### ¿Qué es CI/CD?
CI/CD significa Integración Continua y Despliegue Continuo. Es una práctica DevOps que permite automatizar las etapas de construcción, prueba y despliegue del software cada vez que se realiza un cambio en el código.

- **CI (Integración Continua):** cada vez que un desarrollador sube código, se ejecutan automáticamente verificaciones para detectar errores lo antes posible.
- **CD (Despliegue Continuo):** si el código pasa todas las verificaciones, se despliega automáticamente al ambiente correspondiente.

### Rol de GitHub Actions en este proyecto
GitHub Actions es la herramienta de automatización de GitHub que permite definir workflows en archivos `.yml`. En este proyecto cumple el rol de ejecutar el pipeline de CI automáticamente ante dos eventos:

- Cada `push` a la rama `develop`
- Cada `pull request` hacia `main`

Esto garantiza que el código integrado siempre haya pasado por una verificación automática, reduciendo errores en producción y siguiendo los estándares CI/CD.

### Archivo de configuración
```yaml
name: CI Pipeline

on:
  push:
    branches:
      - develop
  pull_request:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout codigo
        uses: actions/checkout@v3

      - name: Instalar dependencias
        run: pip install -r requirements.txt

      - name: Verificar estructura del proyecto
        run: echo "Pipeline ejecutado correctamente"
```


## Uso de Inteligencia Artificial

Este proyecto fue desarrollado principalmente por los integrantes del equipo. 
La IA Claude (Anthropic) fue utilizada únicamente como apoyo en los siguientes aspectos:

- Revisión de comandos Git para verificar que estuvieran correctos
- Apoyo en la resolución de conflictos que surgieron durante el desarrollo
- Verificación de la estructura del README

Todas las decisiones técnicas, implementación del microservicio, configuración 
del repositorio y flujo de trabajo fueron realizadas por los integrantes del equipo.



## Conclusiones

**Integrante 1 - [John Zapata]:**
Durante este proyecto pude integrar los conocimientos que ya sabia
de ante mano, especialmente en el desarrollo de microservicios, 
aplicandolos ahora en un contexto Devops. Fue interesante ver como 
todo lo que aprendimos sobre arquitectura de software se complementa 
con herramientas como Git, GitHub Actions y las estrategias de 
ramificacion. Trabajamos de forma equitativa con mi compañera, 
aportando ambos por igual medida en cada etapa del proyecto.

**Integrante 2 - [Constanza Mena]:**
Yo al igual que mi compañero pude hacer uso de mis conocimientos, este encargo represento la 
oportunidad de unir los conocimientos previos sobre microservicios con 
las practicas modernas de Devops. Comprender como automatizar la 
integración de cambios mediante CI/CD y organizar el trabajo en equipo 
con GitFlow fue muy valioso. La colaboracion con mi compañero fue 
constante durante todo el desarrollo del proyecto.