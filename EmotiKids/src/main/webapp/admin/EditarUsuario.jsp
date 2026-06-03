<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Usuario - EmotiKids</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
</head>
<body>
<main>
    <%@ include file="/componentes/header.jsp" %>

    <div class="form-container">
        <h2 style="color: #4A4E69;">✏️ Editar Información</h2>
        <p style="text-align:center; font-weight:bold; margin-bottom:20px; color: #FF9A9E;">
            Modifica los datos de la cuenta oficial.
        </p>

        <form action="<%=request.getContextPath()%>/EditarUsuarioServlet" method="post">
            
            <input type="hidden" name="id" value="<%= request.getParameter("id") %>">

            <label style="font-weight:bold; color:#4A4E69;">Nombre del Usuario:</label>
            <input type="text" name="nombre" value="<%= request.getParameter("nombre") %>" required>

            <label style="font-weight:bold; color:#4A4E69;">Correo Electrónico:</label>
            <input type="email" name="correo" value="<%= request.getParameter("correo") %>" required>

            <label style="font-weight:bold; color:#4A4E69;">Rol en el Sistema:</label>
            <select name="rol" style="width: 100%; padding: 15px; margin-bottom: 25px; border: 2px solid #E2E8F0; border-radius: 15px; font-family: 'Nunito', sans-serif; font-size: 18px;">
                <option value="ESTUDIANTE" <%= "ESTUDIANTE".equals(request.getParameter("rol")) ? "selected" : "" %>>ESTUDIANTE</option>
                <option value="ADMIN" <%= "ADMIN".equals(request.getParameter("rol")) ? "selected" : "" %>>ADMINISTRADOR</option>
            </select>

            <button type="submit" style="background-color: #C7E89A; color: #4A4E69;">💾 Guardar Cambios</button>
        </form>

        <div style="text-align: center; margin-top: 20px;">
            <a class="btn-volver" href="<%=request.getContextPath()%>/ListarUsuariosServlet">❌ Cancelar</a>
        </div>
    </div>

    <%@ include file="/componentes/footer.jsp" %>
</main>
</body>
</html>