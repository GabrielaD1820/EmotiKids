<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emotikids.model.Usuario"%>
<%@ page import="com.emotikids.dao.BitacoraDAO"%>
<%
Usuario usuario = (Usuario) session.getAttribute("usuario");
if (usuario == null) { response.sendRedirect(request.getContextPath() + "/requiereLogin.jsp"); return; }
new BitacoraDAO().registrarActividad(usuario.getId(), "Visitó Enojo");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>El Enojo - EmotiKids</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
    <style>
        .layout-amplio { max-width: 1300px; margin: 40px auto; padding: 0 20px; width: 100%; }
        .fila-superior { display: flex; flex-wrap: wrap; align-items: center; gap: 40px; background-color: #FFF2F2; border: 4px dashed #FFADAD; border-radius: 25px; padding: 40px; margin-bottom: 40px; box-shadow: 0 8px 15px rgba(0,0,0,0.05); }
        .emocion-3d-container { width: 250px; height: 250px; background-color: #FFF; border-radius: 50%; box-shadow: 0 8px 15px rgba(0,0,0,0.1); border: 5px solid #FFADAD; overflow: hidden; display: flex; justify-content: center; align-items: center; }
        .emocion-3d-container img { width: 80%; height: 80%; object-fit: contain; }
        .fila-inferior { display: flex; flex-wrap: wrap; gap: 40px; }
        .col-video { flex: 2; min-width: 300px; }
        .col-audio { flex: 1; min-width: 300px; background: linear-gradient(135deg, #FFADAD 0%, #E5383B 100%); padding: 40px; border-radius: 25px; text-align: center; box-shadow: 0 10px 20px rgba(0,0,0,0.1); color: #FFF; display: flex; flex-direction: column; justify-content: center; }
        .col-audio audio { width: 100%; margin-top: 20px; border-radius: 30px; }
    </style>
</head>
<body>
<main>
    <%@ include file="/componentes/header.jsp" %> 

    <div class="layout-amplio">
        <div class="fila-superior">
            <!-- Emoji 3D Animado de Google -->
            <div class="emocion-3d-container">
                <img src="https://fonts.gstatic.com/s/e/notoemoji/latest/1f621/512.gif" alt="Emoji Enojo 3D">
            </div>

            <div style="flex: 1;">
                <h2 style="font-size: 55px; color: #E5383B; margin-bottom: 10px;">El Enojo 😡</h2>
                <h3 style="color: #4A4E69; font-size: 28px;">Aprende a calmarte, <%= usuario.getNombre() %>.</h3>
                <p id="texto-enojo" style="font-size: 22px; margin-top: 15px; color: #2C3E50;">
                    El enojo aparece cuando algo no sale como esperamos. Recuerda: respirar profundo como si inflaras un globo gigante te ayudará a sentirte mucho mejor.
                </p>
                <button type="button" onclick="leerTexto('texto-enojo')" style="background-color: #E5383B; color: white; border: none; padding: 15px 30px; border-radius: 15px; margin-top: 20px; cursor: pointer; font-weight: bold; box-shadow: 0 5px 0px #BA1826; display: flex; align-items: center; gap: 15px; transition: 0.2s;">
                    <span style="font-size: 40px;">🔊</span> 
                    <span style="font-size: 22px; font-family: 'Fredoka', sans-serif;">Leer</span>
                </button>
            </div>
        </div>

        <div class="fila-inferior">
            <div class="col-video">
                <h3 style="color: #4A4E69; font-size: 30px; margin-bottom: 15px;">📺 Mira este útil video:</h3>
                <!-- Video actualizado -->
                <iframe width="100%" height="450" src="https://www.youtube.com/embed/LEgnYkatcvg?si=TECPaIUN6Bumayv4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen style="border-radius: 25px; border: 6px solid #FFADAD; box-shadow: 0 8px 15px rgba(0,0,0,0.1);"></iframe>
            </div>

            <div class="col-audio">
                <h2 style="font-size: 38px; text-shadow: 2px 2px 0px rgba(0,0,0,0.2); margin-bottom: 10px;">🎵 ¡Canta para calmarte! 🎶</h2>
                <p style="font-size: 22px; font-weight: bold;">Canción oficial del Enojo</p>
                <audio controls>
                    <source src="<%=request.getContextPath()%>/audio/enojo.mp3" type="audio/mpeg">
                </audio>
                
                <div style="margin-top: 40px;">
                    <a class="btn-volver" href="<%=request.getContextPath()%>/estudiante/inicioEstudiante.jsp" style="font-size: 22px; padding: 15px 30px; background-color: #FFF; color: #E5383B; box-shadow: 0 5px 0px #FFADAD;">
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