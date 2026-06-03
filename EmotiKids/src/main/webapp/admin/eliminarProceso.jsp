<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emotikids.dao.UsuarioDAO"%>
<%
    String idParam = request.getParameter("id");
    if (idParam != null && !idParam.isEmpty()) {
        try {
            int id = Integer.parseInt(idParam);
            UsuarioDAO dao = new UsuarioDAO();
            dao.eliminarUsuario(id);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }
    // Redirige de vuelta a la lista de usuarios
    response.sendRedirect(request.getContextPath() + "/ListarUsuariosServlet");
%>