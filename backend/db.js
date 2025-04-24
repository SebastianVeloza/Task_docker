const mysql = require('mysql2');
const pool = mysql.createPool({
  host: 'mysql_tareas',
  user: 'root',
  password: 'admin123',
  database: 'tareas'
});

module.exports = pool.promise();
