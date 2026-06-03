<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emotikids.dao.BitacoraDAO"%>
<%@ page import="com.emotikids.model.Usuario"%>
<%
Usuario usuario = (Usuario) session.getAttribute("usuario");
if (usuario == null) { response.sendRedirect(request.getContextPath() + "/requiereLogin.jsp"); return; }
new BitacoraDAO().registrarActividad(usuario.getId(), "Ingresó al Quiz de Miedo");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Quiz de Miedo - EmotiKids</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
    <style>
        .opcion-respuesta { font-size: 22px; display: block; margin-bottom: 15px; padding: 15px; background-color: #FFF; border: 3px solid #E2E8F0; border-radius: 15px; cursor: pointer; transition: 0.2s; }
        .opcion-respuesta:hover { background-color: #CDB4DB; color: white; }
        .opcion-respuesta input[type="radio"] { transform: scale(1.8); margin-right: 15px; }
        .pregunta-caja { background-color: #FDF9FF; border: 4px solid #CDB4DB; border-radius: 20px; padding: 25px; margin-bottom: 30px; text-align: left; }
    </style>
</head>
<body>
<main>
    <%@ include file="/componentes/header.jsp" %>
    <div class="form-container" style="max-width: 850px; text-align: center;">
        <h2 style="font-size: 40px; color: #7B2CBF;">😨 Quiz del Miedo 😨</h2>
        <p style="font-size: 20px; font-weight: bold;">Escucha la pregunta y escoge la respuesta correcta.</p>
        <hr style="border: 2px dashed #CDB4DB; margin: 20px 0;">

        <div class="pregunta-caja">
            <h3 id="preg1" style="display: inline-block; font-size: 26px; color: #4A4E69;">1. ¿Qué podemos sentir cuando tenemos miedo?</h3>
            <button type="button" onclick="leerTexto('preg1')" style="background:none; border:none; font-size:28px; cursor:pointer;">🔊</button><br><br>
            <label class="opcion-respuesta"><input type="radio" name="p1" value="1"> Nervios o preocupación 😰</label>
            <label class="opcion-respuesta"><input type="radio" name="p1" value="0"> Mucha hambre 🍔</label>
            <label class="opcion-respuesta"><input type="radio" name="p1" value="0"> Sueño 😴</label>
        </div>

        <div class="pregunta-caja">
            <h3 id="preg2" style="display: inline-block; font-size: 26px; color: #4A4E69;">2. ¿Qué debemos hacer cuando sentimos miedo?</h3>
            <button type="button" onclick="leerTexto('preg2')" style="background:none; border:none; font-size:28px; cursor:pointer;">🔊</button><br><br>
            <label class="opcion-respuesta"><input type="radio" name="p2" value="1"> Hablar con un adulto de confianza 👩‍👧</label>
            <label class="opcion-respuesta"><input type="radio" name="p2" value="0"> Quedarnos solos 🚶</label>
            <label class="opcion-respuesta"><input type="radio" name="p2" value="0"> Escondernos siempre 🙈</label>
        </div>

        <div class="pregunta-caja">
            <h3 id="preg3" style="display: inline-block; font-size: 26px; color: #4A4E69;">3. ¿Cuál imagen representa miedo?</h3>
            <button type="button" onclick="leerTexto('preg3')" style="background:none; border:none; font-size:28px; cursor:pointer;">🔊</button><br><br>
            <label class="opcion-respuesta"><input type="radio" name="p3" value="0"> 😀 Cara feliz</label>
            <label class="opcion-respuesta"><input type="radio" name="p3" value="1"> 😨 Cara asustada</label>
            <label class="opcion-respuesta"><input type="radio" name="p3" value="0"> 😡 Cara enojada</label>
        </div>

        <button type="button" onclick="calificarQuiz()" style="margin-top: 10px; font-size: 24px;">✅ Revisar Resultado</button>
        <button type="button" onclick="reiniciarQuiz()" style="margin-top: 15px; background-color: #C7CEEA; font-size: 24px;">🔄 Intentarlo de Nuevo</button>

        <h2 id="estrellas" class="estrellas" style="font-size: 50px; margin-top: 20px;"></h2>
        <div id="detalleErrores" style="font-size: 20px; font-weight: bold; margin-top: 15px;"></div>
        <h3 id="resultado" style="font-size: 28px; color: #7B2CBF; margin-top: 15px;"></h3>
        <br><a class="btn-volver" href="<%=request.getContextPath()%>/actividades/actividades.jsp">🎮 Volver a Actividades</a>
    </div>
    <%@ include file="/componentes/footer.jsp" %>
</main>
<script>
function leerTexto(id){ let msj = new SpeechSynthesisUtterance(document.getElementById(id).innerText); msj.lang = "es-ES"; msj.rate = 0.9; window.speechSynthesis.cancel(); window.speechSynthesis.speak(msj); }
function calificarQuiz() {
    let total = 0; let errores = "";
    let p1 = document.querySelector('input[name="p1"]:checked'); let p2 = document.querySelector('input[name="p2"]:checked'); let p3 = document.querySelector('input[name="p3"]:checked');
    if (p1 && p1.value == 1) total++; else errores += "<p style='color:red;'>1: Respuesta correcta: Nervios o preocupación 😰</p>";
    if (p2 && p2.value == 1) total++; else errores += "<p style='color:red;'>2: Respuesta correcta: Hablar con un adulto de confianza 👩‍👧</p>";
    if (p3 && p3.value == 1) total++; else errores += "<p style='color:red;'>3: Respuesta correcta: 😨 Cara asustada</p>";
    document.getElementById("estrellas").innerHTML = "⭐".repeat(total) + "☆".repeat(3 - total);
    let msg = document.getElementById("resultado");
    if (total == 3) { msg.innerHTML = "🎉 ¡Excelente! Conoces muy bien el miedo."; document.getElementById("detalleErrores").innerHTML = ""; } 
    else { msg.innerHTML = "💡 ¡Sigue intentando!"; document.getElementById("detalleErrores").innerHTML = errores; }
}
function reiniciarQuiz() { document.querySelectorAll('input[type="radio"]').forEach(o => o.checked = false); document.getElementById("resultado").innerHTML = ""; document.getElementById("detalleErrores").innerHTML = ""; document.getElementById("estrellas").innerHTML = ""; }
</script>
</body>
</html>