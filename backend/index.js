const express = require('express');
const cors = require('cors');
const db = require('./db');
const app = express();

app.use(cors());
app.use(express.json());

app.get('/tareas', async (req, res) => {
  const [rows] = await db.query('SELECT * FROM tareas');
  res.json(rows);
});

app.post('/tareas', async (req, res) => {
  const { descripcion } = req.body;
  await db.query('INSERT INTO tareas (descripcion) VALUES (?)', [descripcion]);
  res.sendStatus(201);
});

app.listen(3001, () => {
  console.log('Servidor backend escuchando en puerto 3001');
});
