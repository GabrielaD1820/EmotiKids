package com.emotikids.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.emotikids.model.Usuario;
import com.emotikids.util.Conexion;

public class UsuarioDAO {

    public boolean registrar(Usuario usuario) {
        boolean registrado = false;
        try {
            Connection con = Conexion.getConexion();
            String sql = "INSERT INTO usuarios (nombre,correo,clave,rol,estado) VALUES (?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getCorreo());
            ps.setString(3, usuario.getClave());
            ps.setString(4, usuario.getRol());
            ps.setBoolean(5, usuario.isEstado());
            int filas = ps.executeUpdate();
            if (filas > 0) { registrado = true; }
            ps.close(); con.close();
        } catch (Exception e) { e.printStackTrace(); }
        return registrado;
    }

    public Usuario login(String correo, String clave) {
        Usuario usuario = null;
        try {
            Connection con = Conexion.getConexion();
            String sql = "SELECT * FROM usuarios WHERE correo=? AND clave=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, clave);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setClave(rs.getString("clave"));
                usuario.setRol(rs.getString("rol"));
                usuario.setEstado(rs.getBoolean("estado"));
            }
            rs.close(); ps.close(); con.close();
        } catch (Exception e) { e.printStackTrace(); }
        return usuario;
    }

    public List<Usuario> listarUsuarios() {
        List<Usuario> lista = new ArrayList<Usuario>();
        try {
            Connection con = Conexion.getConexion();
            String sql = "SELECT * FROM usuarios ORDER BY id";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setClave(rs.getString("clave"));
                usuario.setRol(rs.getString("rol"));
                usuario.setEstado(rs.getBoolean("estado"));
                lista.add(usuario);
            }
            rs.close(); ps.close(); con.close();
        } catch (Exception e) { e.printStackTrace(); }
        return lista;
    }

    public boolean bloquearUsuario(int id) {
        boolean bloqueado = false;
        try {
            Connection con = Conexion.getConexion();
            String sql = "UPDATE usuarios SET estado=false WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            int filas = ps.executeUpdate();
            if (filas > 0) { bloqueado = true; }
            ps.close(); con.close();
        } catch (Exception e) { e.printStackTrace(); }
        return bloqueado;
    }

    public boolean desbloquearUsuario(int id) {
        boolean desbloqueado = false;
        try {
            Connection con = Conexion.getConexion();
            String sql = "UPDATE usuarios SET estado=true WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            int filas = ps.executeUpdate();
            if (filas > 0) { desbloqueado = true; }
            ps.close(); con.close();
        } catch (Exception e) { e.printStackTrace(); }
        return desbloqueado;
    }

    public boolean actualizarUsuario(Usuario usuario) {
        boolean actualizado = false;
        try {
            Connection con = Conexion.getConexion();
            String sql = "UPDATE usuarios SET nombre=?, correo=?, rol=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getCorreo());
            ps.setString(3, usuario.getRol());
            ps.setInt(4, usuario.getId());
            int filas = ps.executeUpdate();
            if (filas > 0) { actualizado = true; }
            ps.close(); con.close();
        } catch (Exception e) { e.printStackTrace(); }
        return actualizado;
    }

    // 🔥 MÉTODO FALTANTE AÑADIDO: ELIMINAR USUARIO
    public boolean eliminarUsuario(int id) {
        boolean eliminado = false;
        try {
            Connection con = Conexion.getConexion();
            
            // PRIMERO: Borramos los registros de este usuario en la bitácora
            String sqlBitacora = "DELETE FROM bitacora WHERE usuario_id=?";
            PreparedStatement psBitacora = con.prepareStatement(sqlBitacora);
            psBitacora.setInt(1, id);
            psBitacora.executeUpdate();
            psBitacora.close();

            // SEGUNDO: Borramos al usuario
            String sqlUsuario = "DELETE FROM usuarios WHERE id=?";
            PreparedStatement psUsuario = con.prepareStatement(sqlUsuario);
            psUsuario.setInt(1, id);
            int filas = psUsuario.executeUpdate();
            
            if (filas > 0) { 
                eliminado = true; 
            }
            
            psUsuario.close(); 
            con.close();
        } catch (Exception e) { 
            System.out.println("Error al eliminar usuario: " + e.getMessage());
            e.printStackTrace(); 
        }
        return eliminado;
    }
}