package com.emotikids.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.emotikids.dao.BitacoraDAO;
import com.emotikids.dao.UsuarioDAO;
import com.emotikids.model.Usuario;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String correo =
                request.getParameter("correo");

        String clave =
                request.getParameter("clave");

        UsuarioDAO dao =
                new UsuarioDAO();

        // 1. buscar usuario por credenciales
        Usuario usuario =
                dao.login(correo, clave);

        // 2. usuario no existe o credenciales mal
        if (usuario == null) {

            response.sendRedirect(
                    "login.jsp?error=1");

            return;
        }

        // 3. VERIFICAR SI ESTA BLOQUEADO (DESDE BD)
        if (!usuario.isEstado()) {

            response.sendRedirect(
                    "login.jsp?bloqueado=1");

            return;
        }

        // 4. crear sesión
        HttpSession session =
                request.getSession();

        session.setAttribute(
                "usuario",
                usuario);

        // 5. bitácora
        BitacoraDAO bitacoraDAO =
                new BitacoraDAO();

        bitacoraDAO.registrarActividad(
                usuario.getId(),
                "Inicio de sesion");

        // 6. redirección por rol
        if (usuario.getRol().equals("ADMIN")) {

            response.sendRedirect(
                    "admin/inicioAdmin.jsp");

        } else {

            response.sendRedirect(
                    "estudiante/inicioEstudiante.jsp");
        }
    }
}