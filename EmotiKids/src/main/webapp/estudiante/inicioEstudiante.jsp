<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emotikids.model.Usuario"%>
<%
Usuario usuario = (Usuario) session.getAttribute("usuario");
if (usuario == null) { response.sendRedirect(request.getContextPath() + "/login.jsp"); return; }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mi Perfil - EmotiKids</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
    <style>
        .emotions-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; margin-top: 25px; }
        .emotion-card { background-color: #FFF; border: 4px solid #E2E8F0; border-radius: 25px; padding: 25px; text-align: center; text-decoration: none; font-family: 'Fredoka', sans-serif; font-size: 26px; box-shadow: 0 8px 15px rgba(0,0,0,0.08); transition: all 0.3s ease; }
        .emotion-card:hover { transform: translateY(-8px); box-shadow: 0 12px 20px rgba(0,0,0,0.15); }
        .c-alegria { border-color: #FFD6A5; background-color: #FFF9F2; color: #F4A261 !important;}
        .c-tristeza { border-color: #A0C4FF; background-color: #F2F7FF; color: #6495ED !important;}
        .c-enojo { border-color: #FFADAD; background-color: #FFF2F2; color: #E5383B !important;}
        .c-miedo { border-color: #CDB4DB; background-color: #FDF9FF; color: #7B2CBF !important;}
    </style>
</head>
<body>
<main>
    <%@ include file="/componentes/header.jsp" %> 

    <div class="content">
        <section>
            <article style="background-color: #E2F0CB; border: 3px dashed #C7E89A;">
                <h2 style="font-size: 38px; color: #2C3E50;">¡Hola, <%= usuario.getNombre() %>! 🚀</h2>
                <p style="font-size: 22px; margin-top: 10px;">¿Estás listo para una nueva aventura? Explora las emociones y diviértete con nuestros juegos.</p>
            </article>

            <article>
                <h2 style="font-size: 34px; text-align: center; color: #FF9A9E;">🌟 Elige una Emoción para Explorar 🌟</h2>
                <div class="emotions-grid">
                    <a href="<%=request.getContextPath()%>/emociones/alegria.jsp" class="emotion-card c-alegria">😀<br>Alegría</a>
                    <a href="<%=request.getContextPath()%>/emociones/tristeza.jsp" class="emotion-card c-tristeza">😢<br>Tristeza</a>
                    <a href="<%=request.getContextPath()%>/emociones/enojo.jsp" class="emotion-card c-enojo">😡<br>Enojo</a>
                    <a href="<%=request.getContextPath()%>/emociones/miedo.jsp" class="emotion-card c-miedo">😨<br>Miedo</a>
                </div>
            </article>
        </section>

        <!-- ASIDE CON CATSUDON 3D -->
        <aside style="border-color: #C7CEEA;">
            <h3 style="text-align: center; font-size: 26px; color: #4A4E69;">¡Tu Amigo 3D! 😻</h3>
            <p style="text-align: center; font-size: 16px; margin-bottom: 15px; font-weight: bold; color: #FF9A9E;">(Gíralo con el ratón o tu dedo)</p>
            
            <div style="width: 100%; height: 300px; border-radius: 25px; overflow: hidden; border: 4px dashed #C7CEEA;">
                <iframe title="Catsudon - Ramen Kitty Spirit" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" src="https://sketchfab.com/models/1746eefa8ba44fbc9d5c9892c24dc677/embed?autostart=1&ui_controls=0&ui_infos=0" width="100%" height="100%"></iframe>
            </div>

            <br>
            <a class="btn-accion" href="<%=request.getContextPath()%>/actividades/actividades.jsp" style="display: block; font-size: 24px; text-align: center; padding: 15px;">
                🎮 Ir a los Juegos
            </a>
        </aside>
    </div>

    <%@ include file="/componentes/footer.jsp" %>
</main>
</body>
</html>