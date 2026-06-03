<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>EmotiKids - Aprende Jugando</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
</head>
<body>

<main>
    <%@ include file="/componentes/header.jsp" %>
    
    <div class="content">
        <section>
            <article>
                <h2 style="font-size: 40px; color: #FF9A9E; text-align: center;">¡Bienvenido a EmotiKids! 🎉</h2>
                <br>
                <p style="text-align: center; font-size: 22px;">
                    Una plataforma educativa mágica dirigida a niños de 3 a 8 años. 
                    Aquí aprenderemos a reconocer, expresar y controlar nuestras emociones 
                    mediante juegos divertidos, videos y aventuras interactivas.
                </p>
            </article>

            <article class="carousel">
                <button onclick="prev()">❮</button>
                <img id="img" src="<%=request.getContextPath()%>/img/img1.jpg" alt="Aventura de Emociones">
                <button onclick="next()">❯</button>
            </article>
        </section>

        <aside>
            <h3 style="color: #A5AFD7; font-size: 26px; text-align: center;">🎯 Nuestro Objetivo</h3>
            <p style="text-align: justify; margin-bottom: 20px;">
                Ayudar a los pequeños héroes a desarrollar súper habilidades emocionales y sociales.
            </p>

            <h3 style="color: #A5AFD7; font-size: 26px; text-align: center;">👦👧 Edades</h3>
            <p style="text-align: center; font-weight: bold; font-size: 24px; color: #FFB7B2; margin-bottom: 20px;">
                De 3 a 8 años
            </p>

            <h3 style="color: #A5AFD7; font-size: 26px; text-align: center;">📍 Encuéntranos</h3>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3989.790214304899!2d-78.4820875!3d-0.1806532!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMMKwMTAnNTAuNCJTIDc4wrAyOCc1NS41Ilc!5e0!3m2!1ses!2sec!4v1620000000000!5m2!1ses!2sec" allowfullscreen="" loading="lazy"></iframe>
        </aside>
    </div>

    <%@ include file="/componentes/footer.jsp" %>
</main>

<script>
// Lógica del Carrusel mejorada
let images = [
    "<%=request.getContextPath()%>/img/img1.jpg",
    "<%=request.getContextPath()%>/img/img2.jpg",
    "<%=request.getContextPath()%>/img/img3.jpg",
    "<%=request.getContextPath()%>/img/img4.jpg"
];
let i = 0;
const imgElement = document.getElementById("img");

function fadeTransition(action) {
    imgElement.style.opacity = 0;
    setTimeout(() => {
        action();
        imgElement.style.opacity = 1;
    }, 200);
}

function next() {
    fadeTransition(() => {
        i = (i + 1) % images.length;
        imgElement.src = images[i];
    });
}

function prev() {
    fadeTransition(() => {
        i = (i - 1 + images.length) % images.length;
        imgElement.src = images[i];
    });
}
</script>

</body>
</html>