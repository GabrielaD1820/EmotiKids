package com.emotikids.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    // 1. CREDENCIALES DE LA MÁQUINA VIRTUAL (Según rúbrica)
    private static final String URL_REMOTA = "jdbc:postgresql://172.17.42.121:5432/bd_emoti";
    private static final String USER_REMOTA = "postgres";
    private static final String PASS_REMOTA = "1234";

    // 2. CREDENCIALES LOCALES (Tu computadora)
    private static final String URL_LOCAL = "jdbc:postgresql://localhost:5432/emotikids";
    private static final String USER_LOCAL = "postgres";
    private static final String PASS_LOCAL = "123";

    public static Connection getConexion() {
        Connection con = null;

        try {
            Class.forName("org.postgresql.Driver");

            // INTENTO 1: Conectar a la máquina virtual (Servidor de la Universidad)
            // Le damos 2 segundos de "timeout" para no esperar demasiado si estamos offline
            DriverManager.setLoginTimeout(2); 
            
            try {
                con = DriverManager.getConnection(URL_REMOTA, USER_REMOTA, PASS_REMOTA);
                System.out.println("✅ Conexión exitosa a la BASE DE DATOS VIRTUAL (172.17.42.121)");
            } catch (Exception exRemota) {
                // INTENTO 2: Si falla la virtual, conectamos al localhost
                System.out.println("⚠️ Servidor virtual no encontrado. Intentando conexión LOCAL...");
                
                con = DriverManager.getConnection(URL_LOCAL, USER_LOCAL, PASS_LOCAL);
                System.out.println("✅ Conexión exitosa a la BASE DE DATOS LOCAL (localhost)");
            }

        } catch (Exception e) {
            System.out.println("❌ Error crítico: No se pudo conectar a ninguna base de datos.");
            e.printStackTrace();
        }

        return con;
    }
}