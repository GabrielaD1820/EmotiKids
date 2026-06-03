<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emotikids.dao.BitacoraDAO"%>
<%@ page import="com.emotikids.model.Usuario"%>
<%
Usuario usuario = (Usuario) session.getAttribute("usuario");
if (usuario == null) {
    response.sendRedirect(request.getContextPath() + "/requiereLogin.jsp");
    return;
}
BitacoraDAO bitacoraDAO = new BitacoraDAO();
bitacoraDAO.registrarActividad(usuario.getId(), "Ingresó a Actividades");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Actividades - EmotiKids</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
</head>
<body>
<main>
    <%@ include file="/componentes/header.jsp" %>

    <div class="form-container" style="max-width: 1100px;">
        <h2 style="font-size: 45px; color: #4A4E69;">🎮 Zona de Juegos y Actividades</h2>
        
        <div style="background-color: #E2F0CB; padding: 15px; border-radius: 15px; text-align: center; margin-bottom: 30px;">
            <p style="font-size: 22px; font-weight: bold; color: #2C3E50; display: inline-block;" id="intro-juegos">
                Aprende jugando y descubre las emociones de forma divertida. ¡Elige tu juego favorito!
            </p>
            <button type="button" onclick="leerTexto('intro-juegos')" style="background: none; border: none; font-size: 30px; cursor: pointer; vertical-align: middle;">🔊</button>
        </div>

        <div class="contenedor-actividades">
            <!-- Quizzes -->
            <a class="card-actividad" href="<%=request.getContextPath()%>/actividades/quizAlegria.jsp" style="border-color:#FFD6A5; background-color:#FFF9F2;">
                <div style="font-size: 50px; margin-bottom: 10px;">🎉</div>
                Quiz de Alegría
            </a>
            <a class="card-actividad" href="<%=request.getContextPath()%>/actividades/quizTristeza.jsp" style="border-color:#A0C4FF; background-color:#F2F7FF;">
                <div style="font-size: 50px; margin-bottom: 10px;">😢</div>
                Quiz de Tristeza
            </a>
            <a class="card-actividad" href="<%=request.getContextPath()%>/actividades/quizEnojo.jsp" style="border-color:#FFADAD; background-color:#FFF2F2;">
                <div style="font-size: 50px; margin-bottom: 10px;">😠</div>
                Quiz de Enojo
            </a>
            <a class="card-actividad" href="<%=request.getContextPath()%>/actividades/quizMiedo.jsp" style="border-color:#CDB4DB; background-color:#FDF9FF;">
                <div style="font-size: 50px; margin-bottom: 10px;">😨</div>
                Quiz de Miedo
            </a>
            
            <!-- Juegos Lógicos -->
            <a class="card-actividad" href="<%=request.getContextPath()%>/actividades/memorama.jsp" style="border-color:#C7E89A; background-color:#F4FCE3;">
                <div style="font-size: 50px; margin-bottom: 10px;">🧩</div>
                Memorama
            </a>
            <a class="card-actividad" href="<%=request.getContextPath()%>/actividades/relacionar.jsp" style="border-color:#FF9A9E; background-color:#FFF0F1;">
                <div style="font-size: 50px; margin-bottom: 10px;">🔗</div>
                Relacionar Emociones
            </a>
            <a class="card-actividad" href="<%=request.getContextPath()%>/actividades/rompecabezas.jsp" style="border-color:#A5AFD7; background-color:#F0F2F9;">
                <div style="font-size: 50px; margin-bottom: 10px;">🖼️</div>
                Rompecabezas
            </a>
            <a class="card-actividad" href="<%=request.getContextPath()%>/actividades/cuartoVirtual.jsp" style="border-color: #A5AFD7; background-color:#F0F2F9;">
                <div style="font-size: 50px; margin-bottom: 10px;">🥽</div>
                Cuarto Virtual
            </a>
        </div>
    </div>

    <%@ include file="/componentes/footer.jsp" %>
</main>

<script>
    function leerTexto(idElemento) {
        let texto = document.getElementById(idElemento).innerText;
        let mensaje = new SpeechSynthesisUtterance(texto);
        mensaje.lang = "es-ES";
        mensaje.rate = 0.9;
        window.speechSynthesis.cancel();
        window.speechSynthesis.speak(mensaje);
    }
</script>
</body>
</html>