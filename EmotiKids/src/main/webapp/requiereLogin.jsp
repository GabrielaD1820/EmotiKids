<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Acceso Restringido - EmotiKids</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
</head>
<body>

<main>
    <%@ include file="/componentes/header.jsp" %>

    <div class="form-container" style="text-align: center;">
        <h2 style="font-size: 40px; color: #4A4E69;">¡Alto ahí, amiguito! 🛑</h2>
        <p style="font-size: 22px; margin-bottom: 20px; font-weight: bold;">
            Para ver las emociones y jugar con nosotros, primero necesitas entrar con tu cuenta.
        </p>
        
        <img src="<%=request.getContextPath()%>/img/logo.png" width="220" alt="Mascota" style="border-radius: 50%; border: 6px solid #FFDAC1; margin-bottom: 25px; box-shadow: 0 4px 15px rgba(0,0,0,0.15);">
        
        <br>
        <a class="btn-volver" href="<%=request.getContextPath()%>/login.jsp" style="font-size: 24px; padding: 15px 30px;">
            Ir a Iniciar Sesión 🔑
        </a>
    </div>

    <%@ include file="/componentes/footer.jsp" %>
</main>

</body>
</html>