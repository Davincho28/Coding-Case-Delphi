import express, { json } from "express";
import cors from "cors";
import dotenv from "dotenv";
import { GoogleGenAI } from "@google/genai";

//.env
dotenv.config();
//db
const config = {
  server: '(local)',
  database: process.env.DATABASE,
  user: process.env.USERDB,
  password: process.env.PASSWORDDB,
  options: {
    encrypt: true,
    trustedConnection: true
  }
};

//gemini
const ai = new GoogleGenAI({ apiKey: process.env.GOOGLE_API_KEY });

// Crea la app de Express
const app = express();
app.use(express.json());
app.use(cors());

// Ruta de prueba
app.get("/", async (req, res) => {
  try {
    res.json({
      message:"conectado con exito"
    })
  } catch (err) {
    res.json({
      message:"no se pudo conectar",
      error:err
    })
  }
});

// Ruta de prueba
app.post("/gemini", async (req, res) => {
  try {
    const prompt = req.body.prompt;
    const data = req.body.data;
    const newPrompt=prompt+" en este formato JSON: "+JSON.stringify(data)
    const response = await ai.models.generateContent({
      model: "gemini-2.0-flash",
      contents: newPrompt,
    });
    const text=response.text
    res.json({ message: text }); //envia mensaje.
  } catch (error) {
    console.error("Error al llamar a la API de Gemini:", error);
    res.status(500).json({ error: "Error interno del servidor" });
  }
});

// Servidor HTTPS
app.listen(process.env.PORT, () => {
  console.log(
    `Servidor HTTP escuchando en http://localhost:${process.env.PORT}`
  );
});
