package Modelo;

import Controlador.Conexion;
import Vista.Iniciar_Sesion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ModeloLogin {

    Conexion conect = new Conexion();
    Connection cn = conect.iniciarConexion();
    Iniciar_Sesion lg = new Iniciar_Sesion();

    String usuario, contrasena;

    public ModeloLogin() {

    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public boolean validar(String usua, String contra) {
        boolean valor = false;
        String sql = "Call ingreso(?,?)";
        
        try {
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, usua);
            ps.setString(2, contra);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                valor = true;
            }
            if (valor==true){
            cn.close();
            conect.cerrarConexion();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return valor;
    }

}
