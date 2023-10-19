package Modelo;

import Controlador.Conexion;
import com.toedter.calendar.JDateChooser;
import java.awt.Component;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

public class ModeloUsuario {
    
    private int doc, sex, rol;
    private String nom,tipo_doc, tele, correo, dire, log, contra;
    private Date fec;
    
    public int getDoc() {
        return doc;
    }
    
    public void setDoc(int doc) {
        this.doc = doc;
    }
    
    public int getSex() {
        return sex;
    }
    
    public void setSex(int sex) {
        this.sex = sex;
    }
    
    public int getRol() {
        return rol;
    }
    
    public void setRol(int rol) {
        this.rol = rol;
    }
    
    public String getNom() {
        return nom;
    }
    
    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getTipo_doc() {
        return tipo_doc;
    }

    public void setTipo_doc(String tipo_doc) {
        this.tipo_doc = tipo_doc;
    }
    
    public String getTele() {
        return tele;
    }
    
    public void setTele(String tele) {
        this.tele = tele;
    }
    
    public String getCorreo() {
        return correo;
    }
    
    public void setCorreo(String correo) {
        this.correo = correo;
    }
    
    public String getDire() {
        return dire;
    }
    
    public void setDire(String dire) {
        this.dire = dire;
    }
    
    public String getLog() {
        return log;
    }
    
    public void setLog(String log) {
        this.log = log;
    }
    
    public String getContra() {
        return contra;
    }
    
    public void setContra(String contra) {
        this.contra = contra;
    }
    
    public Date getFec() {
        return fec;
    }
    
    public void setFec(Date fec) {
        this.fec = fec;
    }
    
    public Map<String, Integer> llenarCombo(String valor) {
        Conexion conect = new Conexion();
        Connection co = conect.iniciarConexion();
        
        String sql = "select * from mostrar_" + valor;
        
        Map<String, Integer> llenar_combo = new HashMap<>();
        try {
            Statement st = co.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                llenar_combo.put(rs.getString(2), rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return llenar_combo;
    }
    
    public void insertarUsuario() {
        Conexion conect = new Conexion();
        Connection co = conect.iniciarConexion();
        String sql = "Call inst_usuario(?,?,?,?,?,?,?,?,?,?,?)";
        
        try {
            PreparedStatement ps = co.prepareStatement(sql);
            ps.setInt(1, getDoc());
            ps.setString(2, getTipo_doc());
            ps.setString(3, getNom());
            ps.setInt(4, getRol());
            ps.setString(5, getTele());
            ps.setString(6, getCorreo());
            ps.setInt(7, getSex());
            ps.setString(8, getDire());
            ps.setDate(9, getFec());
            ps.setString(10, getLog());
            ps.setString(11, getContra());
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null, "Información Guardada");
            
            co.close();
            
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al guardar", "Error", JOptionPane.ERROR_MESSAGE);
        }
        conect.cerrarConexion();
    }
    
    public void limpiar(Component[] panelusuario){
        for (Object limpiar : panelusuario) {
            if (limpiar instanceof JTextField){
                ((JTextField) limpiar).setText("");
            }
            if (limpiar instanceof JComboBox){
                ((JComboBox) limpiar).setSelectedItem("Seleccione...");
            }
            if (limpiar instanceof JDateChooser){
                ((JDateChooser) limpiar).setDate(null);
            }
        }
        
    }
    
}
