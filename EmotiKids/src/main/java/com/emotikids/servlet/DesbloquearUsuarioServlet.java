package com.emotikids.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emotikids.dao.UsuarioDAO;

@WebServlet("/DesbloquearUsuarioServlet")
public class DesbloquearUsuarioServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id =
                Integer.parseInt(
                        request.getParameter("id"));

        UsuarioDAO dao =
                new UsuarioDAO();

        dao.desbloquearUsuario(id);

        response.sendRedirect(
                request.getContextPath()
                + "/admin/inicioAdmin.jsp");
    }
}