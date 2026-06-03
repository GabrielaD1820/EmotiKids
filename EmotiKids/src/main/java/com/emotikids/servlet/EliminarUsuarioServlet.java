package com.emotikids.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.emotikids.dao.UsuarioDAO;

@WebServlet("/EliminarUsuarioServlet")
public class EliminarUsuarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        UsuarioDAO dao = new UsuarioDAO();
        dao.eliminarUsuario(id); // Asegúrate de tener un método eliminarUsuario(int id) en tu UsuarioDAO. Si no lo tienes, usa executeUpdate("DELETE FROM usuarios WHERE id = ?").

        // Redirige de vuelta a la lista de usuarios
        response.sendRedirect(request.getContextPath() + "/ListarUsuariosServlet");
    }
}