# 🤖 EmotiKids

> **Tecnológica en Inteligencia Emocional Infantil**
> Proyecto alineado con el **ODS 4: Educación de Calidad** 🎯

## 📖 Sobre el Proyecto
**EmotiKids** es una plataforma web educativa e interactiva diseñada para enseñar inteligencia emocional a niños de 3 a 8 años mediante el uso de tecnología inmersiva. A través de  entornos de Realidad Virtual (WebVR) y gamificación, los niños aprenden a identificar y gestionar sus emociones de manera lúdica, segura y accesible.

## ✨ Características Principales
* **🕶️ Entornos Inmersivos (WebVR):** Exploración de escenarios 360° para atrapar emociones utilizando A-Frame.
* **🔊 Accesibilidad Nativa:** Lector de voz integrado (API SpeechSynthesis) y Modo Oscuro para garantizar la inclusión.
* **🎮 Gamificación:** Rompecabezas, memorama y cuestionarios interactivos.
* **📊 Dashboard Docente:** Panel de administración completo para gestionar usuarios y visualizar la bitácora de progreso de cada alumno en tiempo real.
* **🐾 Mascota Virtual:** "Catsudon", un modelo 3D interactivo que acompaña el aprendizaje del niño.

## 🛠️ Tecnologías Utilizadas

**Frontend (Interfaz y Experiencia):**
* HTML5, CSS3 y Bootstrap.
* A-Frame (Modelos 3D y WebVR).
* JavaScript (APIs del navegador).

**Backend (Lógica y Servidor):**
* Java (Servlets & JSP).
* Patrón de diseño DAO (Data Access Object).
* Servidor web Apache Tomcat 9.

**Base de Datos:**
* PostgreSQL (Gestión de usuarios y auditoría/bitácora).

## 🚀 Instalación y Despliegue
Este proyecto está diseñado para ser ejecutado en un entorno de red con máquinas virtuales o servidores locales.
1. Restaurar el script de la base de datos (`.sql`) en PostgreSQL.
2. Actualizar las credenciales de conexión en la clase `Conexion.java` del proyecto.
3. Compilar el proyecto y generar el archivo ejecutable `EmotiKids.war`.
4. Subir y desplegar el archivo `.war` en el Gestor de Aplicaciones de Apache Tomcat 9.

## 👩‍💻 Desarrollado por
* **Gabriela Díaz** - *Lead Developer*
