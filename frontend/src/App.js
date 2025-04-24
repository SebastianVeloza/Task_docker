import React, { useEffect, useState } from 'react';
import axios from 'axios';

export default function App() {
  const [tareas, setTareas] = useState([]);
  const [descripcion, setDescripcion] = useState('');

  const obtenerTareas = async () => {
    const { data } = await axios.get('http://localhost:3001/tareas');
    setTareas(data);
  };

  const agregarTarea = async () => {
    await axios.post('http://localhost:3001/tareas', { descripcion });
    setDescripcion('');
    obtenerTareas();
  };

  useEffect(() => {
    obtenerTareas();
  }, []);

  return (
    <div>
      <h1>Registro de Tareas</h1>
      <input value={descripcion} onChange={(e) => setDescripcion(e.target.value)} />
      <button onClick={agregarTarea}>Agregar</button>
      <ul>
        {tareas.map((t, i) => <li key={i}>{t.descripcion}</li>)}
      </ul>
    </div>
  );
}
