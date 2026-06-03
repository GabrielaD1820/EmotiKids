package com.emotikids.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emotikids.dao.UsuarioDAO;
import com.emotikids.model.Usuario;

@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String nombre =
                request.getParameter("nombre");

        String correo =
                request.getParameter("correo");

        String clave =
                request.getParameter("clave");

        // VALIDACIÓN DE CORREO
        if (!(correo.endsWith("@gmail.com")
                || correo.endsWith("@hotmail.com")
                || correo.endsWith("@outlook.com"))) {

            response.sendRedirect(
                    "registro.jsp?correoInvalido=1");
            return;
        }

        Usuario usuario =
                new Usuario();

        usuario.setNombre(nombre);
        usuario.setCorreo(correo);
        usuario.setClave(clave);

        usuario.setRol("ESTUDIANTE");
        usuario.setEstado(true);

        UsuarioDAO dao =
                new UsuarioDAO();

        boolean registrado =
                dao.registrar(usuario);

        if (registrado) {

            response.sendRedirect("login.jsp");

        } else {

            response.getWriter().println(
                    "Error al registrar usuario");
        }
    }
}