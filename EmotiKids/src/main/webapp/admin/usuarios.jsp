<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.emotikids.model.Usuario"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Usuarios - EmotiKids</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
</head>
<body>
<main>
    <%@ include file="/componentes/header.jsp" %>

    <div class="form-container" style="max-width: 95%; margin: 40px auto; overflow-x: auto;">
        
        <h2 style="font-size: 38px; color: #4A4E69;">👥 Usuarios Registrados</h2>
        
        <table class="tabla-emotikids" style="min-width: 900px;">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Rol</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
            <%
            List<Usuario> lista = (List<Usuario>) request.getAttribute("listaUsuarios");
            if (lista != null) {
                for (Usuario u : lista) {
            %>
            <tr>
                <td><%= u.getId() %></td>
                <td><%= u.getNombre() %></td>
                <td><%= u.getCorreo() %></td>
                <td><strong style="color: #6495ED;"><%= u.getRol() %></strong></td>
                <td>
                    <%= u.isEstado() ? "<span style='color: green; font-weight: bold;'>Activo ✔️</span>" : "<span style='color: red; font-weight: bold;'>Bloqueado ❌</span>" %>
                </td>
                <td>
                    <div style="display: flex; gap: 8px; justify-content: center; flex-wrap: wrap;">
                        
                        <a class="btn-accion" style="background-color: #FFDAC1; color: #4A4E69;" 
                           href="<%=request.getContextPath()%>/admin/EditarUsuario.jsp?id=<%=u.getId()%>&nombre=<%=u.getNombre()%>&correo=<%=u.getCorreo()%>&rol=<%=u.getRol()%>">
                           ✏️ Editar
                        </a>

                        <% if (u.isEstado()) { %>
                            <a class="btn-accion" style="background-color: #FFB7B2; color: #FFF;" 
                               href="<%=request.getContextPath()%>/BloquearUsuarioServlet?id=<%=u.getId()%>">
                                🔒 Bloquear
                            </a>
                        <% } else { %>
                            <a class="btn-accion" style="background-color: #C7E89A; color: #4A4E69;" 
                               href="<%=request.getContextPath()%>/DesbloquearUsuarioServlet?id=<%=u.getId()%>">
                                🔓 Desbloq.
                            </a>
                        <% } %>

                        <a class="btn-accion" style="background-color: #E94560; color: #FFF;" 
                           href="<%=request.getContextPath()%>/admin/eliminarProceso.jsp?id=<%=u.getId()%>" 
                           onclick="return confirm('¿Estás seguro de que quieres eliminar a este usuario de la base de datos para siempre?');">
                           🗑️ Eliminar
                        </a>
                    </div>
                </td>
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