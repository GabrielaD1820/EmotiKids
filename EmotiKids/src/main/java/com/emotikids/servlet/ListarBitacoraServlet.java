package com.emotikids.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emotikids.dao.BitacoraDAO;
import com.emotikids.model.Bitacora;

@WebServlet("/ListarBitacoraServlet")
public class ListarBitacoraServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        BitacoraDAO dao =
                new BitacoraDAO();

        List<Bitacora> lista =
                dao.listarBitacora();

        request.setAttribute(
                "listaBitacora",
                lista);

        request.getRequestDispatcher(
                "/admin/bitacora.jsp")
                .forward(request, response);
    }
}