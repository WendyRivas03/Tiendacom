package Modelo;

import Controlador.Conexion;
import java.awt.Component;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import javax.imageio.ImageIO;
import javax.swing.Icon;
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
import javax.swing.table.TableColumn;

public class ModeloProducto {

    private int doc;
    private String nom, descri, ruta;
    private byte imagen[];

    public int getDoc() {
        return doc;
    }

    public void setDoc(int doc) {
        this.doc = doc;
    }

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
//Insertar Producto

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
//mostrar tabla producto

    public void mostrarTablaProducto(JTable tabla, String valor, String nompeste) {
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

        //String[] titulo = {"Código", "Imagen", "Nombre del Producto", "Descripción", "Existencia", "Precio"};
 
        String[] titulo = nompeste.equals("Producto") ? new String[]{"Código", "Imagen", "Nombre del Producto", "Descripción", "Existencia", "Precio"} 
                : new String[]{"Código", "Imagen", "Nombre del Producto", "Descripción", "Cantidad", "Valor"};
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
            @Override
            public boolean isCellEditable(int row, int column) {
//               if (nompeste.equals("Produ")) {
//                    return column == 6;
//                } else {
//                    return false;
//                }
                if (nompeste.equals("Produ")) {
                    if (column == 4 || column == 5 || column == 6) {
                        return true;
                    }
                }
                return false;
            }
        };

        String sqlProducto = valor.isEmpty() ? "select * from mostrar_producto" : "call consultar_producto('" + valor + "')";

        try {
//            String datos[] = new String[opcion];
            Object dato[] = new Object[opcion];

            Statement st = co.createStatement(); //Crea una consulta
            ResultSet rs = st.executeQuery(sqlProducto);

            while (rs.next()) {
                try {//Al tener diferentes tipos de datos se puede hacer asi
                    byte[] imag = rs.getBytes(2);
                    BufferedImage bufIm = null;
                    InputStream inSt = new ByteArrayInputStream(imag);
                    bufIm = ImageIO.read(inSt);
                    ImageIcon icono = new ImageIcon(bufIm.getScaledInstance(64, 64, 0));
                    dato[1] = new JLabel(icono);

                } catch (Exception e) {
                    dato[1] = new JLabel("No imagenes");
                }
                dato[0] = rs.getString(1);
                dato[2] = rs.getString(3);
                dato[3] = rs.getString(4);
                dato[4] = rs.getInt(5);
                dato[5] = rs.getInt(6);
//if (nompeste.equals("Producto")) {
//    
//}else{
//    
//}
                Object[] fila;
                if (nompeste.equals("Producto")) {
                   fila = new Object[]{dato[0], dato[1], dato[2], dato[3], dato[4], dato[5]};
                    fila = Arrays.copyOf(fila, fila.length + 2);
                    fila[fila.length - 2] = editar;
                    fila[fila.length - 1] = eliminar;
                } else {
                     fila =  new Object[]{dato[0], dato[1], dato[2], dato[3],0,0};
                    fila = Arrays.copyOf(fila, fila.length + 3);
                    fila[fila.length - 1] = false;//para trabajar con chekbox1
                }
                tablaProducto.addRow(fila);
            }
            co.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        tabla.setModel(tablaProducto);
        int cantColum = tabla.getColumnCount();

        //Renderizar la columna para que muestre el checkbox
        if (nompeste.equals("Produ")) {
            int col= cantColum-1; //podemos borrarla y colocar el numero de columna que correponde a la pestaña
            TableColumn tc = tabla.getColumnModel().getColumn(col);
            tc.setCellEditor(tabla.getDefaultEditor(Boolean.class));
            tc.setCellRenderer(tabla.getDefaultRenderer(Boolean.class));//si da click aparezca el chulo
        }
        
        //Darle tamaño a cada Columna
        int[] ancho = {100, 200, 100, 200, 100, 100, 30, 30};
        for (int i = 0; i < cantColum; i++) {
            TableColumn columna = tabla.getColumnModel().getColumn(i);
            columna.setPreferredWidth(ancho[i]);
        }
        conect.cerrarConexion();
    }

    //buscar producto
    public void buscarProducto(int valor) {
        Conexion conect = new Conexion();
        Connection co = conect.iniciarConexion();
        String sql = "call buscar_producto(" + valor + ")";
        try {
            Statement st = co.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                setDoc(rs.getInt(1));
                setNom(rs.getString(2));
                setDescri(rs.getString(3));
                setImagen(rs.getBytes(5));
                setRuta(rs.getString(6));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //ACTUALIZAR Producto
    public void actualizarProducto() {
        Conexion conect = new Conexion();
        Connection con = conect.iniciarConexion();
        String sql = "call actualizar_producto(?,?,?,?,?)";

        try {

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, getDoc());
            ps.setString(2, getNom());
            ps.setString(3, getDescri());
            ps.setBytes(4, getImagen());
            ps.setString(5, getRuta());

            ps.executeUpdate();

            JOptionPane.showMessageDialog(null, "Información Actualizada");
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        conect.cerrarConexion();
    }

    //ELIMINAR PRODUCTO
    public void eliminarProducto() {
        Conexion conect = new Conexion();
        Connection con = conect.iniciarConexion();
        String sql = "call eliminar_producto(?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, getDoc());
            ps.executeUpdate();
            Icon elimina = new ImageIcon(getClass().getResource("/img/basura.png"));
            JOptionPane.showMessageDialog(null, "Registro Eliminado", "Eliminar Usuario", JOptionPane.PLAIN_MESSAGE, (Icon) elimina);
//            JOptionPane.showMessageDialog(null, "¿Desea Eliminar el Registro?");
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        conect.cerrarConexion();
    }
}
