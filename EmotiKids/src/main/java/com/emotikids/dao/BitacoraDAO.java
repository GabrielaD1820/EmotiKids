package com.emotikids.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

import com.emotikids.model.Bitacora;
import com.emotikids.util.Conexion;

public class BitacoraDAO {

    public void registrarActividad(int usuarioId,
                                   String accion) {

        try {

            Connection con =
                    Conexion.getConexion();

            String sql =
                    "INSERT INTO bitacora (usuario_id, accion) VALUES (?, ?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, usuarioId);
            ps.setString(2, accion);

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Bitacora> listarBitacora() {

        List<Bitacora> lista =
                new ArrayList<>();

        try {

            Connection con =
                    Conexion.getConexion();

            String sql =
                    "SELECT b.id, b.usuario_id, b.accion, b.fecha, u.nombre "
                  + "FROM bitacora b "
                  + "INNER JOIN usuarios u ON b.usuario_id = u.id "
                  + "ORDER BY b.fecha DESC";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                Bitacora b =
                        new Bitacora();

                b.setId(rs.getInt("id"));
                b.setUsuarioId(rs.getInt("usuario_id"));
                b.setNombreUsuario(rs.getString("nombre"));
                b.setAccion(rs.getString("accion"));
                b.setFecha(rs.getTimestamp("fecha"));

                lista.add(b);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }
}