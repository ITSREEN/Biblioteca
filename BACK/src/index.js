import express from "express";
import conexion from "./db.js";

const app = express();
app.use(express.json())

app.get("/libros", (req, res) => {
    conexion.query("SELECT * FROM Libros", (err, resultados) => {
        if (err) {
            res.status(500).send("Error en la consulta");
            return;
        }
        res.json(resultados);
    });
});

app.listen(3000, () => {
    console.log("Servidor corriendo en puerto 3000");
});

app.post("/ingresarLibro", (req, res)=>{
    const{titulo, anio, cantidad}= req.body
    const query= "INSERT INTO Libros(Titulo,Año_Publicacion,Cantidad_Total) VALUES (?, ?, ?);"
    conexion.query(query,[titulo,anio,cantidad],(err, resultados)=>{
        if (err){
            res.status(500).send("Error al insertar");
            return;
        }
        res.json(resultados);
    })
    ; 
});