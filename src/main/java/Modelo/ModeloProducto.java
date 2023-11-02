package Modelo;

import Controlador.Conexion;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.filechooser.FileNameExtensionFilter;

public class ModeloProducto {

    private String nom, descri, ruta;
    private byte imagen[];

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDescri() {
        return descri;
    }

    public void setDescri(String descri) {
        this.descri = descri;
    }

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }

    //BUSCAR IMAGEN
    public void buscarImagen() {
        JFileChooser archivos = new JFileChooser();
        String rutacarpeta = getClass().getClassLoader().getResource("producto").getPath();//ruta de la carpeta donde estan guardadas las imagenes
        File carpeta = new File(rutacarpeta); //cuando ejecute el codigo se ubica siempre en esta carpeta
        archivos.setCurrentDirectory(carpeta);//cuando le damos click al botos buscar el se va derecho a la carpeta
        FileNameExtensionFilter filtro = new FileNameExtensionFilter(
                "JPG,PNG & GIF", "jpg", "png", "gif");
        archivos.setFileFilter(filtro);

        if (archivos.showOpenDialog(null) == JFileChooser.APPROVE_OPTION) {
            setRuta(archivos.getSelectedFile().getAbsolutePath());
        }
    }

    public byte[] convertirImagen(String ruta) {
        try {
            File archivo = new File(ruta);
            byte[] foto = new byte[(int) archivo.length()];
            InputStream imgen = new FileInputStream(archivo);
            imgen.read(foto);

            return foto;

        } catch (Exception e) {
            return null;
        }
    }

    public void insertarProducto() {
        Conexion conect = new Conexion();
        Connection co = conect.iniciarConexion();
        String instProducto = "call inst_producto(?,?,?,?)";
        try {
            PreparedStatement ps = co.prepareStatement(instProducto);
            ps.setString(1,getNom());
            ps.setString(2, getDescri());
            ps.setBytes(3, getImagen());
            ps.setString(4, getRuta());
            ps.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Registro Guardado");
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
