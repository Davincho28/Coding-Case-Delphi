# Proyecto Full Stack con Delphi y JavaScript

Este proyecto fue desarrollado como una solución full stack que combina tecnologías modernas en el backend con herramientas robustas en el frontend. Está orientado a ofrecer un sistema eficiente y escalable, integrando funcionalidades inteligentes con una interfaz sólida.
## 🛠️ Tecnologías Utilizadas

### 🔙 Backend

El backend fue implementado utilizando **JavaScript** con Node.js y Express. Las principales tecnologías y librerías empleadas incluyen:

- **[Express](https://expressjs.com/)** (`^5.1.0`): Framework web minimalista para Node.js, utilizado para construir la API RESTful.
- **[dotenv](https://www.npmjs.com/package/dotenv)** (`^16.4.7`): Gestión de variables de entorno para mantener configuraciones seguras y separadas del código fuente.
- **[cors](https://www.npmjs.com/package/cors)** (`^2.8.5`): Middleware para habilitar CORS (Cross-Origin Resource Sharing).
- **[@google/genai](https://www.npmjs.com/package/@google/genai)** (`^0.7.0`): Librería para interactuar con los modelos de inteligencia artificial de Google, utilizada para incorporar funcionalidades basadas en IA.

El backend expone endpoints que pueden ser consumidos por clientes web u otros servicios, facilitando la integración con el frontend y la base de datos.

#### 🔧 Configuración e Inicio del Backend
1. Clona el repositorio y entra a la carpeta del backend:
   ```bash
   git clone https://github.com/tu-usuario/Coding-Case-Delphi
   cd tu-repo/backend

2. Instala dependencias necesarias: 
    ```bash
    npm install

3. Crea un archivo .env en la raíz del backend con el siguiente contenido:
    ```env
    PORT=#
    GOOGLE_API_KEY=''
    DATABASE='DBinventarioTienda'

4. Inicia el servidor en modo desarrollo:
    ```bash
    npm run dev


#### 🔝 Frontend
El frontend fue desarrollado utilizando Delphi, una herramienta visual de desarrollo que permite crear interfaces ricas de escritorio. A su vez, se conecta con una base de datos SQL Server para la gestión de la información.

- **Delphi**: Utilizado para crear la interfaz gráfica de usuario (GUI) del sistema.

- **SQL Server**: Base de datos relacional que almacena y gestiona los datos de la aplicación. Se integra con Delphi mediante componentes de acceso a datos (como ADO, FireDAC, etc.).

#### Para ejecutar el frontend:
1. Abrir el proyecto `.dproj` en el entorno de desarrollo de Delphi.  
2. Configurar la conexión a SQL Server con las credenciales correspondientes.  
3. Compilar y ejecutar.

### 🔗 Arquitectura del Proyecto

+-------------+           +------------------+           +-----------------+
|   Frontend  | <-------> |     Backend      | <-------> |    SQL Server   |
|   (Delphi)  |           | (Node.js + JS)   |           | (Base de Datos) |
+-------------+           +------------------+           +-----------------+
                             |
                             |
                             v
                      Google GenAI API

## 📌 Requisitos Previos

- Tener instalado [Node.js](https://nodejs.org/) y NPM.
- Un entorno de desarrollo compatible con Delphi (como RAD Studio).
- Acceso a una instancia de **SQL Server** con la base de datos `DBinventarioTienda`.

## 🗄️ Configuración de la Base de Datos

La aplicación requiere una base de datos en **SQL Server** llamada `DBinventarioTienda`.

### 🧱 Estructura requerida

Dentro de esta base de datos, debe existir una tabla llamada `productos` con los siguientes campos:

| Campo     | Tipo de Dato   | Descripción                           |
|-----------|----------------|----------------------------------------|
| `id`      | INT (PK)       | Identificador único del producto       |
| `nombre`  | VARCHAR         | Nombre del producto                    |
| `marca`   | VARCHAR         | Marca del producto                     |
| `categoria` | VARCHAR       | Categoría a la que pertenece           |
| `precio`  | DECIMAL o FLOAT | Precio del producto                    |
| `stock`   | INT             | Cantidad disponible en inventario      |

> Asegúrate de que el campo `id` sea la clave primaria (`PRIMARY KEY`) y tenga autoincremento si es necesario (`IDENTITY(1,1)`).

### 🧪 Ejemplo de script SQL

```sql
CREATE TABLE productos (
  id INT PRIMARY KEY IDENTITY(1,1),
  nombre VARCHAR(100) NOT NULL,
  marca VARCHAR(100),
  categoria VARCHAR(100),
  precio DECIMAL(10,2),
  stock INT
);

### 📫 Contacto
Para cualquier duda o sugerencia, puedes contactarme 👌.



