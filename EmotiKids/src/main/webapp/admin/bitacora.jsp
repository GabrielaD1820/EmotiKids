<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.emotikids.model.Bitacora"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Bitácora del Sistema - EmotiKids</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
</head>
<body>
<main>
    <%@ include file="/componentes/header.jsp" %>

    <div class="form-container" style="max-width: 95%; margin: 40px auto; overflow-x: auto;">
        <h2 style="font-size: 38px; color: #FF9A9E;">📋 Bitácora del Sistema</h2>
        
        <table class="tabla-emotikids" style="min-width: 900px; font-size: 18px;">
            <tr>
                <th style="background-color: #FFB7B2;">ID</th>
                <th style="background-color: #FFB7B2;">Usuario</th>
                <th style="background-color: #FFB7B2;">Acción Realizada</th>
                <th style="background-color: #FFB7B2;">Fecha y Hora</th>
            </tr>
            <%
            List<Bitacora> lista = (List<Bitacora>) request.getAttribute("listaBitacora");
            if (lista != null) {
                for (Bitacora b : lista) {
            %>
            <tr>
                <td style="font-weight: bold;"><%= b.getId() %></td>
                <td><strong style="color: #4A4E69;"><%= b.getNombreUsuario() %></strong></td>
                <td><%= b.getAccion() %></td>
                <td style="color: #666;"><%= b.getFecha() %></td>
            </tr>
            <%
                }
            }
            %>
        </table>

        <br>
        <div style="text-align: center;">
            <a class="btn-volver" href="<%=request.getContextPath()%>/admin/inicioAdmin.jsp">⬅️ Volver al Panel</a>
        </div>
    </div>

    <%@ include file="/componentes/footer.jsp" %>
</main>
</body>
</html>