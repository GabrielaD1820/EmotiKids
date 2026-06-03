<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emotikids.dao.BitacoraDAO"%>
<%@ page import="com.emotikids.model.Usuario"%>
<%
Usuario usuario = (Usuario) session.getAttribute("usuario");
if (usuario == null) { response.sendRedirect(request.getContextPath() + "/requiereLogin.jsp"); return; }
new BitacoraDAO().registrarActividad(usuario.getId(), "Ingresó a Relacionar Emociones");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Relacionar Emociones</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
    <style>
        .pregunta-caja { background-color: #FFF0F1; border: 4px solid #FF9A9E; border-radius: 20px; padding: 25px; margin-bottom: 25px; text-align: left; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 15px;}
        .relacionar-select { font-size: 20px; padding: 12px; width: 200px; border-radius: 15px; border: 3px solid #FF9A9E; font-family: 'Nunito', sans-serif; cursor: pointer;}
    </style>
</head>
<body>
<main>
    <%@ include file="/componentes/header.jsp" %>
    <div class="form-container" style="max-width: 900px; text-align: center;">
        <h2 style="font-size: 40px; color: #FF9A9E;">🔗 Relaciona la Situación</h2>
        <p style="font-size: 20px; font-weight: bold;">Lee cada situación y selecciona la emoción correcta.</p>
        <hr style="border: 2px dashed #FF9A9E; margin: 20px 0;">

        <div class="pregunta-caja">
            <h3 style="color: #4A4E69; font-size: 24px; max-width: 60%;">1. Me regalaron mi juguete favorito. 🎁</h3>
            <select id="p1" class="relacionar-select">
                <option value="">Selecciona...</option><option value="Alegria">😀 Alegría</option><option value="Tristeza">😢 Tristeza</option><option value="Enojo">😡 Enojo</option><option value="Miedo">😨 Miedo</option>
            </select>
        </div>

        <div class="pregunta-caja">
            <h3 style="color: #4A4E69; font-size: 24px; max-width: 60%;">2. Mi globo hermoso se rompió. 🎈</h3>
            <select id="p2" class="relacionar-select">
                <option value="">Selecciona...</option><option value="Alegria">😀 Alegría</option><option value="Tristeza">😢 Tristeza</option><option value="Enojo">😡 Enojo</option><option value="Miedo">😨 Miedo</option>
            </select>
        </div>

        <div class="pregunta-caja">
            <h3 style="color: #4A4E69; font-size: 24px; max-width: 60%;">3. Alguien tomó mis colores sin permiso. 🖍️</h3>
            <select id="p3" class="relacionar-select">
                <option value="">Selecciona...</option><option value="Alegria">😀 Alegría</option><option value="Tristeza">😢 Tristeza</option><option value="Enojo">😡 Enojo</option><option value="Miedo">😨 Miedo</option>
            </select>
        </div>

        <div class="pregunta-caja">
            <h3 style="color: #4A4E69; font-size: 24px; max-width: 60%;">4. Escuché un ruido extraño en la noche. 👻</h3>
            <select id="p4" class="relacionar-select">
                <option value="">Selecciona...</option><option value="Alegria">😀 Alegría</option><option value="Tristeza">😢 Tristeza</option><option value="Enojo">😡 Enojo</option><option value="Miedo">😨 Miedo</option>
            </select>
        </div>

        <button type="button" onclick="calificarActividad()" style="margin-top: 10px; font-size: 24px; background-color: #FF9A9E; color: white;">✅ Revisar Resultado</button>
        <button type="button" onclick="reiniciarActividad()" style="margin-top: 15px; background-color: #C7CEEA; font-size: 24px;">🔄 Intentarlo de Nuevo</button>

        <h2 id="estrellas" class="estrellas" style="font-size: 50px; margin-top: 20px;"></h2>
        <div id="detalleErrores" style="font-size: 20px; font-weight: bold; margin-top: 15px;"></div>
        <h3 id="resultado" style="font-size: 28px; color: #FF9A9E; margin-top: 15px;"></h3>
        <br><a class="btn-volver" href="<%=request.getContextPath()%>/actividades/actividades.jsp">🎮 Volver a Actividades</a>
    </div>
    <%@ include file="/componentes/footer.jsp" %>
</main>
<script>
function calificarActividad() {
    let total = 0; let errores = "";
    let p1 = document.getElementById("p1").value; let p2 = document.getElementById("p2").value;
    let p3 = document.getElementById("p3").value; let p4 = document.getElementById("p4").value;

    if (p1 == "Alegria") total++; else errores += "<p style='color:red;'>1 ❌ Respuesta correcta: Alegría</p>";
    if (p2 == "Tristeza") total++; else errores += "<p style='color:red;'>2 ❌ Respuesta correcta: Tristeza</p>";
    if (p3 == "Enojo") total++; else errores += "<p style='color:red;'>3 ❌ Respuesta correcta: Enojo</p>";
    if (p4 == "Miedo") total++; else errores += "<p style='color:red;'>4 ❌ Respuesta correcta: Miedo</p>";

    document.getElementById("estrellas").innerHTML = "⭐".repeat(total) + "☆".repeat(4 - total);
    let r = document.getElementById("resultado");
    if (total == 4) { r.innerHTML = "🎉 ¡Excelente, reconoces muy bien las emociones!"; document.getElementById("detalleErrores").innerHTML = ""; } 
    else { r.innerHTML = "💡 Inténtalo de nuevo."; document.getElementById("detalleErrores").innerHTML = errores; }
}
function reiniciarActividad() {
    document.getElementById("p1").selectedIndex = 0; document.getElementById("p2").selectedIndex = 0;
    document.getElementById("p3").selectedIndex = 0; document.getElementById("p4").selectedIndex = 0;
    document.getElementById("resultado").innerHTML = ""; document.getElementById("detalleErrores").innerHTML = ""; document.getElementById("estrellas").innerHTML = "";
}
</script>
</body>
</html>