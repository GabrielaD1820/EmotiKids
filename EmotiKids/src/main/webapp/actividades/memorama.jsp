<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emotikids.dao.BitacoraDAO"%>
<%@ page import="com.emotikids.model.Usuario"%>
<%
Usuario usuario = (Usuario) session.getAttribute("usuario");
if (usuario == null) { response.sendRedirect(request.getContextPath() + "/requiereLogin.jsp"); return; }
new BitacoraDAO().registrarActividad(usuario.getId(), "Ingresó al Memorama");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Memorama de Emociones</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
    <style>
        .tablero { display: grid; grid-template-columns: repeat(4, 120px); gap: 20px; justify-content: center; margin-top: 30px; }
        .carta { width: 120px; height: 120px; border-radius: 20px; border: 4px solid #C7E89A; font-size: 60px; cursor: pointer; background-color: #F4FCE3; box-shadow: 0 5px 10px rgba(0,0,0,0.1); transition: transform 0.3s, background-color 0.3s; }
        .carta:hover { transform: scale(1.05); }
        .carta-encontrada { background-color: #A5D6A7 !important; border-color: #66BB6A; animation: pop 0.5s ease; cursor: default; }
        @keyframes pop { 0% { transform: scale(1); } 50% { transform: scale(1.2); } 100% { transform: scale(1); } }
    </style>
</head>
<body>
<main>
    <%@ include file="/componentes/header.jsp" %>
    <div class="form-container" style="max-width: 900px; text-align: center;">
        <h2 style="font-size: 45px; color: #66BB6A;">🧩 Memorama de Emociones</h2>
        <p style="font-size: 22px; font-weight: bold;">Encuentra las parejas iguales.</p>
        <hr style="border: 2px dashed #C7E89A; margin: 20px 0;">

        <h3 id="mensaje" style="font-size: 30px; color: #4A4E69;">¡Mucha suerte! 🍀</h3>
        <div class="tablero" id="tablero"></div><br>

        <button type="button" onclick="reiniciarJuego()" style="font-size: 22px; margin-top: 20px;">🔄 Jugar Nuevamente</button><br><br>
        <a class="btn-volver" href="<%=request.getContextPath()%>/actividades/actividades.jsp">🎮 Volver a Actividades</a>
    </div>
    <%@ include file="/componentes/footer.jsp" %>
</main>

<script>
// Sintetizador de Sonidos Nativos
const audioCtx = new (window.AudioContext || window.webkitAudioContext)();
function playSuccessSound() {
    const osc = audioCtx.createOscillator();
    const gainNode = audioCtx.createGain();
    osc.type = 'sine'; osc.frequency.setValueAtTime(600, audioCtx.currentTime); // Tono 1
    osc.frequency.exponentialRampToValueAtTime(1200, audioCtx.currentTime + 0.1); // Tono 2 (feliz)
    gainNode.gain.setValueAtTime(0.5, audioCtx.currentTime);
    gainNode.gain.exponentialRampToValueAtTime(0.01, audioCtx.currentTime + 0.3);
    osc.connect(gainNode); gainNode.connect(audioCtx.destination);
    osc.start(); osc.stop(audioCtx.currentTime + 0.3);
}
function playWinSound() {
    const osc = audioCtx.createOscillator();
    const gainNode = audioCtx.createGain();
    osc.type = 'triangle'; osc.frequency.setValueAtTime(400, audioCtx.currentTime);
    osc.frequency.linearRampToValueAtTime(800, audioCtx.currentTime + 0.5);
    gainNode.gain.setValueAtTime(0.5, audioCtx.currentTime);
    gainNode.gain.linearRampToValueAtTime(0.01, audioCtx.currentTime + 1);
    osc.connect(gainNode); gainNode.connect(audioCtx.destination);
    osc.start(); osc.stop(audioCtx.currentTime + 1);
}

let emociones = ["😀", "😀", "😢", "😢", "😡", "😡", "😨", "😨"];
let primeraCarta = null, segundaCarta = null;
let bloqueado = false, parejas = 0;

function mezclarCartas() { emociones.sort(() => Math.random() - 0.5); }

function crearTablero() {
    let tablero = document.getElementById("tablero"); tablero.innerHTML = "";
    emociones.forEach((emocion, indice) => {
        let boton = document.createElement("button");
        boton.className = "carta"; boton.innerHTML = "❓";
        boton.dataset.valor = emocion; boton.dataset.indice = indice;
        boton.onclick = function() { voltearCarta(boton); };
        tablero.appendChild(boton);
    });
}

function voltearCarta(carta) {
    if (bloqueado || carta.innerHTML !== "❓") return;
    carta.innerHTML = carta.dataset.valor;
    if (audioCtx.state === 'suspended') audioCtx.resume(); // Activar audio al hacer clic

    if (primeraCarta == null) { primeraCarta = carta; return; }
    segundaCarta = carta; bloqueado = true;

    if (primeraCarta.dataset.valor === segundaCarta.dataset.valor) {
        primeraCarta.classList.add("carta-encontrada");
        segundaCarta.classList.add("carta-encontrada");
        parejas++;
        
        if (parejas === 4) {
            document.getElementById("mensaje").innerHTML = "🎉 ¡Ganaste! Eres increíble. 🎉";
            playWinSound(); // Sonido de victoria final
        } else {
            playSuccessSound(); // Sonido de pareja encontrada
        }
        
        primeraCarta = null; segundaCarta = null; bloqueado = false;
    } else {
        setTimeout(() => {
            primeraCarta.innerHTML = "❓"; segundaCarta.innerHTML = "❓";
            primeraCarta = null; segundaCarta = null; bloqueado = false;
        }, 1000);
    }
}

function reiniciarJuego() {
    parejas = 0; primeraCarta = null; segundaCarta = null; bloqueado = false;
    document.getElementById("mensaje").innerHTML = "¡Mucha suerte! 🍀";
    mezclarCartas(); crearTablero();
}
reiniciarJuego();
</script>
</body>
</html>