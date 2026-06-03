package com.emotikids.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emotikids.dao.UsuarioDAO;
import com.emotikids.model.Usuario;

@WebServlet("/ListarUsuariosServlet")
public class ListarUsuariosServlet
        extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        UsuarioDAO dao =
                new UsuarioDAO();

        List<Usuario> lista =
                dao.listarUsuarios();

        request.setAttribute(
                "listaUsuarios",
                lista);

        request.getRequestDispatcher(
                "admin/usuarios.jsp")
                .forward(
                        request,
                        response);
    }
}