import mysql from "mysql2";

const conexion = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "julian3102", 
    database: "Biblioteca"
});

conexion.connect((err) => {
    if (err) {
        console.log("Error de conexión:", err);
        return;
    }
    console.log("Conectado a MySQL 🚀");
});

export default conexion;