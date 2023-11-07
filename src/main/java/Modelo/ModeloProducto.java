package Modelo;

import Controlador.Conexion;
import java.awt.Component;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;

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
            ps.setString(1, getNom());
            ps.setString(2, getDescri());
            ps.setBytes(3, getImagen());
            ps.setString(4, getRuta());
            ps.executeUpdate();

            JOptionPane.showMessageDialog(null, "Registro Guardado");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Limpiar Campos 
    public void limpiar(Component[] panelproducto) {

        for (Object limpiar : panelproducto) {

            if (limpiar instanceof JTextField) {
                ((JTextField) limpiar).setText("");
            }
            if (limpiar instanceof JScrollPane) {
                Component[] limpio = ((JScrollPane) limpiar).getViewport().getComponents();
                for (Object controltText : limpio) {
                    if (controltText instanceof JTextArea) {
                        ((JTextArea) controltText).setText("");
                    }
                }
            }
        }
    }
//mostrar tabala producto

    public void mostrarTablaUsuario(JTable tabla, String valor, String nompeste) throws IOException {
        Conexion conect = new Conexion();
        Connection co = conect.iniciarConexion();

        //Personalizar Encabezado
        JTableHeader encabeza = tabla.getTableHeader();
        encabeza.setDefaultRenderer(new GestionEncabezado());
        tabla.setTableHeader(encabeza);

        //Personalizar Celdas
        tabla.setDefaultRenderer(Object.class, new GestionCeldas());
        JButton editar = new JButton();
        JButton eliminar = new JButton();
        JButton agregar = new JButton();

        editar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/editar.png")));
        eliminar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/eliminar.png")));
        agregar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/usuario.png")));

        String[] titulo = {"Código", "Imagen", "Nombre del Producto", "Descripción", "Existencia", "Precio"};

        int opcion = titulo.length; //guarda el tamaño original del titulo

        if (nompeste.equals("Producto")) {
            titulo = Arrays.copyOf(titulo, titulo.length + 2);
            titulo[titulo.length - 2] = "";
            titulo[titulo.length - 1] = "";
        } else {
            titulo = Arrays.copyOf(titulo, titulo.length + 1);
            titulo[titulo.length - 1] = "";
        }

        DefaultTableModel tablaProducto = new DefaultTableModel(null, titulo) {
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };

        String sqlProducto = valor.isEmpty() ? "select * from mostrar_producto" : "call consultar_producto('" + valor + "')";

        try {
            String datos[] = new String[opcion];
            Object dato[] = new Object[opcion];

            Statement st = co.createStatement(); //Crea una consulta
            ResultSet rs = st.executeQuery(sqlProducto);

            while (rs.next()) {
                try {
                    byte[] img = rs.getBytes(2);
                    BufferedImage bfimg = null; //para comenzar a desencriptar la imagen
                    InputStream inStr = new ByteArrayInputStream(img);
                    bfimg = ImageIO.read(inStr);
                    ImageIcon icono = new ImageIcon(bfimg.getScaledInstance(104, 104, 0));
                    dato[1] = new JLabel(icono);

                } catch (SQLException e) {
                    dato[1] = new JLabel("No imagenes");
                }
                dato[0] = rs.getString(1);
                dato[2] = rs.getString(3);
                dato[3] = rs.getString(4);
                dato[4] = rs.getInt(5);
                dato[5] = rs.getInt(6);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }
}
