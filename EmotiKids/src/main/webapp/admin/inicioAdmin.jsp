<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emotikids.model.Usuario"%>
<%
Usuario usuario = (Usuario) session.getAttribute("usuario");
if (usuario == null) {
    response.sendRedirect(request.getContextPath() + "/login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel Administrador - EmotiKids</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
</head>
<body>

<main>
    <%@ include file="/componentes/header.jsp" %>

    <div class="form-container" style="max-width: 800px;">
        <h2 style="color: #4A4E69;">Panel de Administrador ⚙️</h2>
        
        <div style="background-color: #E2F0CB; padding: 20px; border-radius: 15px; margin-bottom: 25px; text-align: center; border: 3px dashed #C7E89A;">
            <p style="font-size: 24px; font-weight: bold; color: #2C3E50;">
                ¡Bienvenido al centro de control, <%= usuario.getNombre() %>! 👨‍💻
            </p>
        </div>

        <hr style="border: 2px solid #EEF2F6; margin: 20px 0;">

        <h3 style="color: #FF9A9E; font-size: 26px; text-align: center; margin-bottom: 20px;">Acciones Rápidas</h3>

        <div style="display: flex; gap: 20px; justify-content: center; flex-wrap: wrap;">
            <a href="<%=request.getContextPath()%>/ListarUsuariosServlet" style="flex: 1; min-width: 200px; background-color: #FFDAC1; padding: 25px; border-radius: 20px; text-decoration: none; color: #4A4E69; text-align: center; box-shadow: 0 6px 0px #FFC099; font-weight: bold; font-size: 22px; transition: 0.2s;">
                <div style="font-size: 40px; margin-bottom: 10px;">👥</div>
                Gestionar Usuarios
            </a>
            
            <a href="<%=request.getContextPath()%>/ListarBitacoraServlet" style="flex: 1; min-width: 200px; background-color: #C7CEEA; padding: 25px; border-radius: 20px; text-decoration: none; color: #4A4E69; text-align: center; box-shadow: 0 6px 0px #A5AFD7; font-weight: bold; font-size: 22px; transition: 0.2s;">
                <div style="font-size: 40px; margin-bottom: 10px;">📋</div>
                Ver Bitácora
            </a>
        </div>
    </div>

    <%@ include file="/componentes/footer.jsp" %>
</main>

</body>
</html>