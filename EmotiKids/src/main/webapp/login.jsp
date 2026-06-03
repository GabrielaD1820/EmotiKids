<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión - EmotiKids</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
</head>
<body>

<main>
    <%@ include file="/componentes/header.jsp" %>

    <div class="form-container">
        <h2 style="font-size: 42px;">¡Hola de nuevo! 👋</h2>
        <p style="text-align:center; margin-bottom: 25px; font-size: 20px; font-weight: bold; color: #4A4E69;">
            Inicia sesión para jugar y aprender
        </p>

        <% if (request.getParameter("error") != null) { %>
            <div style="background-color: #FFB7B2; color: #FFF; padding: 15px; border-radius: 15px; text-align: center; margin-bottom: 20px; font-weight: bold; font-size: 18px;">
                ¡Ups! Correo o contraseña incorrectos 🙊
            </div>
        <% } %>

        <% if (request.getParameter("bloqueado") != null) { %>
            <div style="background-color: #FF9A9E; color: #FFF; padding: 15px; border-radius: 15px; text-align: center; margin-bottom: 20px; font-weight: bold; font-size: 18px;">
                Tu cuenta está en pausa. Pide ayuda a tu profesor. 🛑
            </div>
        <% } %>

        <form action="LoginServlet" method="post">
            <input type="email" name="correo" placeholder="💌 Tu Correo Electrónico" required>
            <input type="password" name="clave" placeholder="🔑 Tu Contraseña" required>
            <button type="submit">¡Entrar a Jugar! 🚀</button>
        </form>
    </div>

    <%@ include file="/componentes/footer.jsp" %>
</main>

</body>
</html>