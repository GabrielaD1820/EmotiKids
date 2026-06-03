<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emotikids.model.Usuario"%>
<%@ page import="com.emotikids.dao.BitacoraDAO"%>
<%
Usuario usuario = (Usuario) session.getAttribute("usuario");
if (usuario == null) { response.sendRedirect(request.getContextPath() + "/requiereLogin.jsp"); return; }
new BitacoraDAO().registrarActividad(usuario.getId(), "Visitó Miedo");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>El Miedo - EmotiKids</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
    <style>
        .layout-amplio { max-width: 1300px; margin: 40px auto; padding: 0 20px; width: 100%; }
        .fila-superior { display: flex; flex-wrap: wrap; align-items: center; gap: 40px; background-color: #FDF9FF; border: 4px dashed #CDB4DB; border-radius: 25px; padding: 40px; margin-bottom: 40px; box-shadow: 0 8px 15px rgba(0,0,0,0.05); }
        .emocion-3d-container { width: 250px; height: 250px; background-color: #FFF; border-radius: 50%; box-shadow: 0 8px 15px rgba(0,0,0,0.1); border: 5px solid #CDB4DB; overflow: hidden; display: flex; justify-content: center; align-items: center; }
        .emocion-3d-container img { width: 80%; height: 80%; object-fit: contain; }
        .fila-inferior { display: flex; flex-wrap: wrap; gap: 40px; }
        .col-video { flex: 2; min-width: 300px; }
        .col-audio { flex: 1; min-width: 300px; background: linear-gradient(135deg, #CDB4DB 0%, #7B2CBF 100%); padding: 40px; border-radius: 25px; text-align: center; box-shadow: 0 10px 20px rgba(0,0,0,0.1); color: #FFF; display: flex; flex-direction: column; justify-content: center; }
        .col-audio audio { width: 100%; margin-top: 20px; border-radius: 30px; }
    </style>
</head>
<body>
<main>
    <%@ include file="/componentes/header.jsp" %> 

    <div class="layout-amplio">
        <div class="fila-superior">
            <!-- Emoji 3D Animado de Google (Miedo) -->
            <div class="emocion-3d-container">
                <img src="https://fonts.gstatic.com/s/e/notoemoji/latest/1f631/512.gif" alt="Emoji Miedo 3D">
            </div>

            <div style="flex: 1;">
                <h2 style="font-size: 55px; color: #7B2CBF; margin-bottom: 10px;">El Miedo 😨</h2>
                <h3 style="color: #4A4E69; font-size: 28px;">¡Tú eres muy valiente, <%= usuario.getNombre() %>!</h3>
                <p id="texto-miedo" style="font-size: 22px; margin-top: 15px; color: #2C3E50;">
                    El miedo es un escudo protector invisible que nos aleja del peligro. Si te asustas, ¡hablar con un adulto de confianza y darle la mano te ayudará a sentirte seguro!
                </p>
                <button type="button" onclick="leerTexto('texto-miedo')" style="background-color: #7B2CBF; color: white; border: none; padding: 15px 30px; border-radius: 15px; margin-top: 20px; cursor: pointer; font-weight: bold; box-shadow: 0 5px 0px #5A189A; display: flex; align-items: center; gap: 15px; transition: 0.2s;">
                    <span style="font-size: 40px;">🔊</span> 
                    <span style="font-size: 22px; font-family: 'Fredoka', sans-serif;">Leer</span>
                </button>
            </div>
        </div>

        <div class="fila-inferior">
            <div class="col-video">
                <h3 style="color: #4A4E69; font-size: 30px; margin-bottom: 15px;">📺 Supera el miedo con este video:</h3>
                <!-- Video actualizado -->
                <iframe width="100%" height="450" src="https://www.youtube.com/embed/myWOeFcCSO8?si=TV4Zwq3l7_mlfEZ3" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen style="border-radius: 25px; border: 6px solid #CDB4DB; box-shadow: 0 8px 15px rgba(0,0,0,0.1);"></iframe>
            </div>

            <div class="col-audio">
                <h2 style="font-size: 38px; text-shadow: 2px 2px 0px rgba(0,0,0,0.2); margin-bottom: 10px;">🎵 ¡Sé valiente y canta! 🎶</h2>
                <p style="font-size: 22px; font-weight: bold;">Canción oficial del Miedo</p>
                <audio controls>
                    <source src="<%=request.getContextPath()%>/audio/miedo.mp3" type="audio/mpeg">
                </audio>
                
                <div style="margin-top: 40px;">
                    <a class="btn-volver" href="<%=request.getContextPath()%>/estudiante/inicioEstudiante.jsp" style="font-size: 22px; padding: 15px 30px; background-color: #FFF; color: #7B2CBF; box-shadow: 0 5px 0px #CDB4DB;">
                        ⬅️ Volver a mi perfil
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file="/componentes/footer.jsp" %>
</main>
<script> function leerTexto(id){ let m = new SpeechSynthesisUtterance(document.getElementById(id).innerText); m.lang = "es-ES"; window.speechSynthesis.cancel(); window.speechSynthesis.speak(m); } </script>
</body>
</html>