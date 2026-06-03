package com.emotikids.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emotikids.dao.UsuarioDAO;
import com.emotikids.model.Usuario;

@WebServlet("/EditarUsuarioServlet")
public class EditarUsuarioServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id =
                Integer.parseInt(
                        request.getParameter("id"));

        String nombre =
                request.getParameter("nombre");

        String correo =
                request.getParameter("correo");

        String rol =
                request.getParameter("rol");

        Usuario usuario =
                new Usuario();

        usuario.setId(id);
        usuario.setNombre(nombre);
        usuario.setCorreo(correo);
        usuario.setRol(rol);

        UsuarioDAO dao =
                new UsuarioDAO();

        dao.actualizarUsuario(usuario);

        response.sendRedirect(
                request.getContextPath()
                + "/admin/inicioAdmin.jsp");
    }
}