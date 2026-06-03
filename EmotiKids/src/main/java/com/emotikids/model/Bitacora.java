package com.emotikids.model;

import java.sql.Timestamp;

public class Bitacora {

    private int id;

    private int usuarioId;

    private String nombreUsuario;

    private String accion;

    private Timestamp fecha;

    public int getId() {

        return id;
    }

    public void setId(int id) {

        this.id = id;
    }

    public int getUsuarioId() {

        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {

        this.usuarioId = usuarioId;
    }

    public String getNombreUsuario() {

        return nombreUsuario;
    }

    public void setNombreUsuario(
            String nombreUsuario) {

        this.nombreUsuario =
                nombreUsuario;
    }

    public String getAccion() {

        return accion;
    }

    public void setAccion(String accion) {

        this.accion = accion;
    }

    public Timestamp getFecha() {

        return fecha;
    }

    public void setFecha(
            Timestamp fecha) {

        this.fecha = fecha;
    }
}