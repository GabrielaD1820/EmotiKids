package com.emotikids.util;

import com.emotikids.dao.UsuarioDAO;
import com.emotikids.model.Usuario;

public class TestUsuarioDAO {

    public static void main(String[] args) {

        Usuario usuario = new Usuario();

        usuario.setNombre("Gabriela");
        usuario.setCorreo("gabriela@test.com");
        usuario.setClave("12345678");
        usuario.setRol("ESTUDIANTE");
        usuario.setEstado(true);

        UsuarioDAO dao = new UsuarioDAO();

        boolean resultado =
                dao.registrar(usuario);

        if(resultado) {

            System.out.println(
                    "Usuario registrado");

        } else {

            System.out.println(
                    "Error al registrar");

        }

    }

}