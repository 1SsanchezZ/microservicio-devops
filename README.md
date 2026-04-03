# Microservicio DevOps

Evaluación Parcial 1 - Ingeniería DevOps

## Estrategia de ramificación

Se utilizó **GitFlow** como estrategia de ramificación porque permite separar claramente el desarrollo de nuevas funcionalidades, las correcciones urgentes y el código en producción. Esto facilita el trabajo colaborativo y asegura que main siempre tenga código estable.

## Ramas utilizadas

- `main` → código estable en producción
- `develop` → integración de nuevas funcionalidades
- `feature/<nombre>` → desarrollo de funcionalidades específicas
- `hotfix/<nombre>` → correcciones urgentes sobre producción

## Convenciones de commits

- `feat:` nueva funcionalidad
- `fix:` corrección de bug
- `docs:` cambios en documentación
- `ci:` cambios en configuración CI/CD
- `refactor:` mejora de código sin cambiar funcionalidad

## Flujo de merge

1. Crear rama desde `develop` o `main`
2. Realizar cambios y commits
3. Abrir Pull Request hacia la rama base
4. Revisión del código
5. Aprobar y mergear

## Estructura del proyecto
└── .github/
└── workflows/
└── ci.yml
├── app.py
├── requirements.txt
├── README.md
