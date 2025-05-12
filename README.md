# 📝 Aplicación de Registro de Tareas con React + Node.js + MySQL

Este repositorio contiene una aplicación fullstack de ejemplo para el registro de tareas, implementada con:

- 💻 **Frontend:** React 18
- 🔧 **Backend:** Node.js + Express
- 🐬 **Base de datos:** MySQL 8
- 🐳 **Contenedores Docker** separados 

---

## Requisitos

- Docker
- Docker Hub (opcional para despliegue)
- Node.js (solo si deseas probar localmente sin Docker)

---


## 🐳 Preparación con Docker

### 1. Crear red y volumen personalizados

```
docker network create red_tareas
docker volume create volumen_mysql_tareas
```
### 2. Lanzar contenedor MySQL
```
docker run -d \
  --name mysql_tareas \
  --network red_tareas \
  -v volumen_mysql_tareas:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=admin123 \
  -e MYSQL_DATABASE=tareas \
  -p 3306:3306 \
  mysql:8
```
### 3. Crear tabla necesaria
SQL
```
CREATE TABLE tareas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  descripcion VARCHAR(255)
);
```
### 4. Backend

```
cd backend
docker build -t backend-tareas .
docker run -d --name backend_tareas --network red_tareas -p 3001:3001 backend-tareas
```

### 5. Frontend
```
cd frontend
docker build -t frontend-tareas .
docker run -d --name frontend_tareas --network red_tareas -p 3000:3000 frontend-tareas
```

## 🐳 Con Docker-Compose

```
docker compose up -d
```
###  Uso
Accede a http://localhost:3000

Agrega una tarea con el input

Verifica que se almacene y se renderice

