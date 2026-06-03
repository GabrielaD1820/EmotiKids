<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Acceso Denegado - EmotiKids</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
</head>
<body>
<main>
    <%@ include file="/componentes/header.jsp" %>

    <div class="form-container" style="text-align: center;">
        <h2 style="font-size: 40px; color: #E94560;">¡Ups! Zona Prohibida 🚧</h2>
        <p style="font-size: 22px; margin-bottom: 20px; font-weight: bold;">
            Necesitas permisos especiales de Administrador para entrar aquí.
        </p>
        
        <img src="<%=request.getContextPath()%>/img/logo.png" width="200" alt="Avatar" style="border-radius: 50%; border: 6px solid #FFB7B2; margin-bottom: 20px;">
        
        <br>
        <a class="btn-volver" href="<%=request.getContextPath()%>/login.jsp" style="font-size: 24px; padding: 15px 30px;">
            Cambiar de Cuenta 🔄
        </a>
    </div>

    <%@ include file="/componentes/footer.jsp" %>
</main>
</body>
</html>