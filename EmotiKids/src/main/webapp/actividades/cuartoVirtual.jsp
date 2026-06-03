<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emotikids.model.Usuario"%>
<%
Usuario usuario = (Usuario) session.getAttribute("usuario");
if (usuario == null) { response.sendRedirect(request.getContextPath() + "/requiereLogin.jsp"); return; }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Bosque de las Emociones</title>
    <!-- LIBRERÍAS DE REALIDAD VIRTUAL Y ENTORNOS -->
    <script src="https://aframe.io/releases/1.4.0/aframe.min.js"></script>
    <script src="https://unpkg.com/aframe-environment-component@1.3.3/dist/aframe-environment-component.min.js"></script>
    
    <style>
        /* Estilos aislados para evitar conflictos con el modo oscuro */
        body { margin: 0; overflow: hidden; font-family: 'Arial', sans-serif; }
        
        .btn-flotante { position: absolute; top: 20px; left: 20px; z-index: 9999; background-color: #FF9A9E; color: #FFF; padding: 10px 25px; border-radius: 20px; font-size: 20px; text-decoration: none; border: 3px solid #FFF; font-weight: bold; box-shadow: 0 4px 10px rgba(0,0,0,0.3); transition: 0.2s;}
        .btn-flotante:hover { background-color: #E94560; }
        
        .marcador { position: absolute; top: 20px; right: 20px; z-index: 9999; background-color: #A0C4FF; color: #FFF; padding: 10px 25px; border-radius: 20px; font-size: 22px; border: 3px solid #FFF; font-weight: bold; box-shadow: 0 4px 10px rgba(0,0,0,0.3); }
        
        .instrucciones { position: absolute; bottom: 20px; left: 50%; transform: translateX(-50%); z-index: 9999; background-color: rgba(255,255,255,0.9); color: #4A4E69; padding: 15px 30px; border-radius: 20px; font-size: 20px; text-align: center; border: 3px solid #C7E89A; font-weight: bold; box-shadow: 0 4px 10px rgba(0,0,0,0.2);}
        
        #mensaje-ganar { display: none; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 9999; background-color: #C7E89A; color: #4A4E69; padding: 40px; border-radius: 30px; font-size: 40px; text-align: center; border: 5px solid #FFF; font-weight: bold; box-shadow: 0 10px 30px rgba(0,0,0,0.4); animation: pop 0.5s ease; }
        
        @keyframes pop { 0% { transform: translate(-50%, -50%) scale(0); } 100% { transform: translate(-50%, -50%) scale(1); } }
    </style>

    <script>
        let atrapadas = 0;
        AFRAME.registerComponent('atrapar-emocion', {
            schema: { mensaje: {type: 'string'} },
            init: function () {
                this.el.addEventListener('click', () => {
                    let msj = new SpeechSynthesisUtterance("¡Atrapaste " + this.data.mensaje + "!");
                    msj.lang = "es-ES"; 
                    window.speechSynthesis.speak(msj);
                    
                    this.el.setAttribute('visible', 'false');
                    this.el.setAttribute('position', '0 -100 0'); // Evitar doble clic
                    
                    atrapadas++;
                    document.getElementById('puntos').innerText = atrapadas;
                    
                    if (atrapadas === 4) {
                        document.getElementById('mensaje-ganar').style.display = 'block';
                        let win = new SpeechSynthesisUtterance("¡Felicidades <%= usuario.getNombre() %>, encontraste todas las emociones escondidas!");
                        win.lang = "es-ES"; 
                        window.speechSynthesis.speak(win);
                    }
                });
            }
        });
    </script>
</head>
<body>
    
    <!-- PANTALLAS DE INFORMACIÓN (UI) -->
    <a href="<%=request.getContextPath()%>/actividades/actividades.jsp" class="btn-flotante">⬅️ Salir al Menú</a>
    <div class="marcador">🌟 Atrapadas: <span id="puntos">0</span>/4</div>
    <div class="instrucciones">🕵️‍♂️ Gira la cámara, busca y haz clic en las emociones escondidas</div>
    
    <div id="mensaje-ganar">
        🎉 ¡Ganaste! 🎉<br>
        <span style="font-size: 25px;">Eres un experto encontrando emociones</span><br>
        <button onclick="location.reload()" style="margin-top: 20px; font-size: 20px; padding: 10px 20px; border-radius: 15px; border: none; background: #FF9A9E; color: white; cursor: pointer; font-weight: bold;">Jugar de nuevo</button>
    </div>

    <!-- MUNDO 3D (A-FRAME) -->
    <a-scene cursor="rayOrigin: mouse">
        <a-assets>
            <img id="img-alegria" src="https://fonts.gstatic.com/s/e/notoemoji/latest/1f600/512.png">
            <img id="img-tristeza" src="https://fonts.gstatic.com/s/e/notoemoji/latest/1f622/512.png">
            <img id="img-enojo" src="https://fonts.gstatic.com/s/e/notoemoji/latest/1f621/512.png">
            <img id="img-miedo" src="https://fonts.gstatic.com/s/e/notoemoji/latest/1f631/512.png">
        </a-assets>

        <!-- BOSQUE MÁGICO -->
        <a-entity environment="preset: forest; skyType: atmosphere; lighting: point; groundColor: #55aa55; dressingAmount: 30"></a-entity>

        <!-- ========================================================= -->
        <!-- 1. ALEGRÍA: Lejos, adelante a la izquierda (Cuadrante Noroeste) -->
        <!-- ========================================================= -->
        <a-box position="-8 1.5 -12" width="4" height="3" depth="1" color="#FFDAC1" rotation="0 30 0"></a-box>
        <!-- Salta desde atrás del muro. Está separada 1.5 metros para evitar titileo (Z-fighting) -->
        <a-image src="#img-alegria" material="side: double" transparent="true" 
                 position="-9 0 -13.5" rotation="0 30 0" scale="2.5 2.5 2.5" 
                 atrapar-emocion="mensaje: la Alegría" 
                 animation="property: position; dir: alternate; dur: 1200; loop: true; to: -9 4.5 -13.5"></a-image>

        <!-- ========================================================= -->
        <!-- 2. TRISTEZA: Lejos, adelante a la derecha (Cuadrante Noreste) -->
        <!-- ========================================================= -->
        <a-box position="12 1.5 -4" width="4" height="3" depth="1" color="#A0C4FF" rotation="0 -45 0"></a-box>
        <!-- Flota frente al muro, deslizándose de un lado a otro -->
        <a-image src="#img-tristeza" material="side: double" transparent="true" 
                 position="10 2 -2" rotation="0 -30 0" scale="2.5 2.5 2.5" 
                 atrapar-emocion="mensaje: la Tristeza" 
                 animation="property: position; dir: alternate; dur: 2500; loop: true; to: 8 2 -1"></a-image>

        <!-- ========================================================= -->
        <!-- 3. ENOJO: Atrás a la izquierda (Cuadrante Suroeste) -->
        <!-- ========================================================= -->
        <a-box position="-10 1.5 10" width="4" height="3" depth="1" color="#FFADAD" rotation="0 135 0"></a-box>
        <!-- Está flotando arriba del muro y crece como si estuviera respirando de enojo -->
        <a-image src="#img-enojo" material="side: double" transparent="true" 
                 position="-10 3.5 10" rotation="0 135 0" scale="1.5 1.5 1.5" 
                 atrapar-emocion="mensaje: el Enojo" 
                 animation="property: scale; dir: alternate; dur: 600; loop: true; to: 3 3 3"></a-image>

        <!-- ========================================================= -->
        <!-- 4. MIEDO: Atrás a la derecha (Cuadrante Sureste) -->
        <!-- ========================================================= -->
        <a-box position="10 1.5 12" width="4" height="3" depth="1" color="#CDB4DB" rotation="0 -135 0"></a-box>
        <!-- Tiembla rápido asomándose por un lado del muro morado -->
        <a-image src="#img-miedo" material="side: double" transparent="true" 
                 position="8 2 11" rotation="0 -135 0" scale="2.5 2.5 2.5" 
                 atrapar-emocion="mensaje: el Miedo" 
                 animation="property: position; dir: alternate; dur: 150; loop: true; to: 7.5 2 10.5"></a-image>

        <!-- EL JUGADOR (Cámara central) -->
        <a-camera position="0 1.6 0">
            <a-cursor color="#E94560" fuse="false"></a-cursor>
        </a-camera>
    </a-scene>
</body>
</html>