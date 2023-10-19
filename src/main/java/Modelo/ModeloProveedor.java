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

public class ModeloProveedor {

    private int doc, sex;
    private String nom, tipo_docu, tele, correo, dire, tipo_per;
    private Date fec;

    public int getDoc() {
        return doc;
    }

    public void setDoc(int doc) {
        this.doc = doc;
    }

    public String getTipo_docu() {
        return tipo_docu;
    }

    public void setTipo_docu(String tipo_docu) {
        this.tipo_docu = tipo_docu;
    }
    
    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
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

    public String getTipo_per() {
        return tipo_per;
    }

    public void setTipo_per(String tipo_per) {
        this.tipo_per = tipo_per;
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

    public void insertarProveedor() {
        Conexion conect = new Conexion();
        Connection co = conect.iniciarConexion();
        String sql = "Call inst_proveedor(?,?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement ps = co.prepareStatement(sql);
            ps.setInt(1, getDoc());
            ps.setString(2, getTipo_docu());
            ps.setString(3, getNom());
            ps.setString(4, getTele());
            ps.setString(5, getCorreo());
            ps.setString(6, getDire());
            ps.setString(7, getTipo_per());
            ps.setInt(8, getSex());
            ps.setDate(9, getFec());

            ps.executeUpdate();
            JOptionPane.showMessageDialog(null, "Información Guardada");

            co.close();

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al guardar", "Error", JOptionPane.ERROR_MESSAGE);
        }
        conect.cerrarConexion();
    }
    public void limpiar(Component[] panelproveedor){
        for (Object limpiar : panelproveedor) {
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
