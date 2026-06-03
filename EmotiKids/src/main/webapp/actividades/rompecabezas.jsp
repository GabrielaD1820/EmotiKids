<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emotikids.dao.BitacoraDAO"%>
<%@ page import="com.emotikids.model.Usuario"%>
<%
Usuario usuario = (Usuario) session.getAttribute("usuario");
if (usuario == null) { response.sendRedirect(request.getContextPath() + "/requiereLogin.jsp"); return; }
new BitacoraDAO().registrarActividad(usuario.getId(), "Ingresó al Rompecabezas");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Rompecabezas - EmotiKids</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
    <style>
        .contenedor-rompecabezas { display: flex; justify-content: center; gap: 50px; margin-top: 30px; }
        .zona-piezas, .zona-destino { display: flex; flex-direction: column; gap: 15px; }
        .pieza { width: 150px; height: 80px; border: 4px solid #A5AFD7; border-radius: 15px; background-color: #F0F2F9; font-size: 32px; font-weight: bold; display: flex; justify-content: center; align-items: center; cursor: grab; color: #4A4E69; box-shadow: 0 4px 6px rgba(0,0,0,0.1); transition: 0.2s; }
        .pieza:active { cursor: grabbing; transform: scale(1.05); }
        .casilla { width: 150px; height: 80px; border: 4px dashed #C7CEEA; border-radius: 15px; background-color: #FFF; display: flex; justify-content: center; align-items: center; font-size: 32px; font-weight: bold; }
        .nivel-container { display: none; }
        .nivel-activo { display: block; }
    </style>
</head>
<body>
<main>
    <%@ include file="/componentes/header.jsp" %>
    <div class="form-container" style="max-width: 950px; text-align: center;">
        <h2 style="font-size: 45px; color: #A5AFD7;">🖼️ Súper Rompecabezas</h2>
        <p style="font-size: 22px; font-weight: bold;">Arrastra las piezas hasta formar la palabra del nivel.</p>
        <hr style="border: 2px dashed #A5AFD7; margin: 20px 0;">

        <!-- NIVEL 1: ALEGRÍA -->
        <div id="nivel1" class="nivel-container nivel-activo">
            <h2 style="font-size: 50px; color: #FFDAC1;">Nivel 1: 😀 ALE - GRÍ - A</h2>
            <div class="contenedor-rompecabezas">
                <div class="zona-piezas"><div class="pieza" draggable="true">GRÍ</div><div class="pieza" draggable="true">😀</div><div class="pieza" draggable="true">A</div><div class="pieza" draggable="true">ALE</div></div>
                <div class="zona-destino"><div class="casilla" data-correcto="😀"></div><div class="casilla" data-correcto="ALE"></div><div class="casilla" data-correcto="GRÍ"></div><div class="casilla" data-correcto="A"></div></div>
            </div>
        </div>

        <!-- NIVEL 2: TRISTEZA -->
        <div id="nivel2" class="nivel-container">
            <h2 style="font-size: 50px; color: #A0C4FF;">Nivel 2: 😢 TRIS - TE - ZA</h2>
            <div class="contenedor-rompecabezas">
                <div class="zona-piezas"><div class="pieza" draggable="true">ZA</div><div class="pieza" draggable="true">TRIS</div><div class="pieza" draggable="true">😢</div><div class="pieza" draggable="true">TE</div></div>
                <div class="zona-destino"><div class="casilla" data-correcto="😢"></div><div class="casilla" data-correcto="TRIS"></div><div class="casilla" data-correcto="TE"></div><div class="casilla" data-correcto="ZA"></div></div>
            </div>
        </div>

        <!-- NIVEL 3: ENOJO -->
        <div id="nivel3" class="nivel-container">
            <h2 style="font-size: 50px; color: #FFADAD;">Nivel 3: 😡 E - NO - JO</h2>
            <div class="contenedor-rompecabezas">
                <div class="zona-piezas"><div class="pieza" draggable="true">JO</div><div class="pieza" draggable="true">E</div><div class="pieza" draggable="true">😡</div><div class="pieza" draggable="true">NO</div></div>
                <div class="zona-destino"><div class="casilla" data-correcto="😡"></div><div class="casilla" data-correcto="E"></div><div class="casilla" data-correcto="NO"></div><div class="casilla" data-correcto="JO"></div></div>
            </div>
        </div>

        <button type="button" onclick="verificarRompecabezas()" style="margin-top: 30px; font-size: 24px;">✅ Revisar Resultado</button>
        <button id="btn-siguiente" type="button" onclick="siguienteNivel()" style="margin-top: 15px; background-color: #E2F0CB; color: #4A4E69; font-size: 24px; display: none;">➡️ Siguiente Nivel</button>
        <button type="button" onclick="reiniciarNivel()" style="margin-top: 15px; background-color: #C7CEEA; font-size: 24px;">🔄 Reiniciar Nivel</button>

        <h2 id="estrellas" class="estrellas" style="font-size: 50px; margin-top: 20px;"></h2>
        <div id="detalleErrores" style="font-size: 20px; margin-top: 15px;"></div>
        <h3 id="resultado" style="font-size: 28px; color: #A5AFD7; margin-top: 15px;"></h3>
        <br><a class="btn-volver" href="<%=request.getContextPath()%>/actividades/actividades.jsp">🎮 Volver a Actividades</a>
    </div>
    <%@ include file="/componentes/footer.jsp" %>
</main>

<script>
// Sintetizador de Sonido
const audioCtx = new (window.AudioContext || window.webkitAudioContext)();
function playDropSound() {
    if (audioCtx.state === 'suspended') audioCtx.resume();
    const osc = audioCtx.createOscillator(); const gainNode = audioCtx.createGain();
    osc.type = 'sine'; osc.frequency.setValueAtTime(800, audioCtx.currentTime);
    gainNode.gain.setValueAtTime(0.3, audioCtx.currentTime);
    gainNode.gain.exponentialRampToValueAtTime(0.01, audioCtx.currentTime + 0.1);
    osc.connect(gainNode); gainNode.connect(audioCtx.destination);
    osc.start(); osc.stop(audioCtx.currentTime + 0.1);
}

let piezaArrastrada = null;
let nivelActual = 1;

function activarDragDrop() {
    let piezas = document.querySelectorAll(".pieza");
    let casillas = document.querySelectorAll(".casilla");

    piezas.forEach(pieza => { pieza.addEventListener("dragstart", () => { piezaArrastrada = pieza; }); });
    casillas.forEach(casilla => {
        casilla.addEventListener("dragover", evento => { evento.preventDefault(); });
        casilla.addEventListener("drop", evento => {
            evento.preventDefault();
            if (piezaArrastrada == null) return;
            playDropSound(); // Sonido al soltar
            if (casilla.children.length == 0) {
                casilla.appendChild(piezaArrastrada);
            } else {
                let piezaExistente = casilla.children[0];
                let origen = piezaArrastrada.parentNode;
                origen.appendChild(piezaExistente);
                casilla.appendChild(piezaArrastrada);
            }
        });
    });
}

function verificarRompecabezas() {
    let correctas = 0; let errores = "";
    let contenedorNivel = document.getElementById("nivel" + nivelActual);
    let casillas = contenedorNivel.querySelectorAll(".casilla");

    casillas.forEach((casilla, indice) => {
        if (casilla.children.length > 0 && casilla.children[0].innerHTML.trim() == casilla.dataset.correcto) {
            correctas++;
        } else {
            errores += "<p style='color:red;'>Pieza " + (indice + 1) + " está en el lugar equivocado ❌</p>";
        }
    });

    document.getElementById("estrellas").innerHTML = "⭐".repeat(correctas) + "☆".repeat(4 - correctas);
    document.getElementById("detalleErrores").innerHTML = errores;

    if (correctas == 4) {
        document.getElementById("resultado").innerHTML = "🎉 ¡Excelente, completaste el nivel " + nivelActual + "! 🎉";
        if (nivelActual < 3) {
            document.getElementById("btn-siguiente").style.display = "inline-block";
        } else {
            document.getElementById("resultado").innerHTML += "<br>🏆 ¡HAS GANADO TODOS LOS NIVELES!";
        }
    } else {
        document.getElementById("resultado").innerHTML = "💡 Sigue intentando, ¡tú puedes!";
    }
}

function siguienteNivel() {
    document.getElementById("nivel" + nivelActual).classList.remove("nivel-activo");
    nivelActual++;
    document.getElementById("nivel" + nivelActual).classList.add("nivel-activo");
    document.getElementById("btn-siguiente").style.display = "none";
    document.getElementById("resultado").innerHTML = "";
    document.getElementById("detalleErrores").innerHTML = "";
    document.getElementById("estrellas").innerHTML = "";
}

function reiniciarNivel() { location.reload(); }
activarDragDrop();
</script>
</body>
</html>