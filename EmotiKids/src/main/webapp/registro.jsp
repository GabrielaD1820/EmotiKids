<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro - EmotiKids</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
</head>
<body>

<main>
    <%@ include file="/componentes/header.jsp" %>

    <div class="form-container">
        <h2 style="font-size: 42px;">¡Únete a la Aventura! ✨</h2>
        <p style="text-align:center; margin-bottom: 25px; font-size: 20px; font-weight: bold; color: #4A4E69;">
            Crea tu cuenta para descubrir tus emociones
        </p>

        <% 
        String error = (String) request.getAttribute("error");
        if(error != null) { 
        %>
            <div style="background-color: #FFB7B2; color: #FFF; padding: 15px; border-radius: 15px; text-align: center; margin-bottom: 20px; font-weight: bold; font-size: 18px;">
                <%=error%> 🙊
            </div>
        <% } %>

        <form action="RegistroServlet" method="post">
            <input type="text" name="nombre" placeholder="👤 Tu Nombre Completo" required>
            <input type="email" name="correo" placeholder="💌 Tu Correo Electrónico" required>
            <input type="password" name="clave" placeholder="🔑 Crea una contraseña secreta (Min. 8 letras)" minlength="8" required>
            <button type="submit">¡Registrarme! 🎉</button>
        </form>
    </div>

    <%@ include file="/componentes/footer.jsp" %>
</main>

</body>
</html>