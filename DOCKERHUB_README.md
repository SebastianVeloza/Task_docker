# 📝 Registro de Tareas - FullStack

Aplicación sencilla para registrar tareas usando React, Node.js y MySQL.

---

## 🔧 Requisitos

- Docker
- Red: `red_tareas`
- Volumen: `volumen_mysql_tareas`

```bash
docker network create red_tareas
docker volume create volumen_mysql_tareas
🐬 Base de Datos
Bash

docker run -d \
  --name mysql_tareas \
  --network red_tareas \
  -v volumen_mysql_tareas:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=admin123 \
  -e MYSQL_DATABASE=tareas \
  -p 3306:3306 \
  mysql:8
Tabla requerida:

SQL

CREATE TABLE tareas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  descripcion VARCHAR(255)
);
🚀 Backend
Bash

docker run -d \
  --name backend_tareas \
  --network red_tareas \
  -p 3001:3001 \
  sebastianveloza/backend-tareas
💻 Frontend
Bash

docker run -d \
  --name frontend_tareas \
  --network red_tareas \
  -p 3000:3000 \
  sebastianveloza/frontend-tareas
🌐 Acceso
Frontend: http://localhost:3000

API: http://localhost:3001/tareas

👤 Autor
Sebastian Veloza — GitHub
```
