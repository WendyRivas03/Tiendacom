package Modelo;

import Controlador.Conexion;
import java.awt.Component;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.Map;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;
import javax.swing.table.TableColumn;

public class ModeloFacturaCompra {

    private int docprovee, docusu, idfact, desc;
    private float total_compr;
    private String tipo_pag;
    private Date fec;

    public int getIdfact() {
        return idfact;
    }

    public void setIdfact(int idfact) {
        this.idfact = idfact;
    }
    
    public int getDocprovee() {
        return docprovee;
    }

    public void setDocprovee(int docprovee) {
        this.docprovee = docprovee;
    }

    public int getDocusu() {
        return docusu;
    }

    public void setDocusu(int docusu) {
        this.docusu = docusu;
    }

    public String getTipo_pag() {
        return tipo_pag;
    }

    public void setTipo_pag(String tipo_pag) {
        this.tipo_pag = tipo_pag;
    }

    public float getTotal_compr() {
        return total_compr;
    }

    public void setTotal_compr(float total_compr) {
        this.total_compr = total_compr;
    }

    public Date getFec() {
        return fec;
    }

    public void setFec(Date fec) {
        this.fec = fec;
    }

    public int getDesc() {
        return desc;
    }

    public void setDesc(int desc) {
        this.desc = desc;
    }
    
    //insertar factura compra
    public void insertarFactcompra() {
        Conexion conect = new Conexion();
        Connection co = conect.iniciarConexion();
        String sql = "call inst_factura_compra(?,?,?)";

        try {
            PreparedStatement ps = co.prepareStatement(sql);
            ps.setInt(1, getDocprovee());
            ps.setInt(2, getDocusu());
            ps.setString(3, getTipo_pag());
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null, "Información Guardada");

            co.close();

        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, "Error al guardar", "Error", JOptionPane.ERROR_MESSAGE);
        }
        conect.cerrarConexion();
    }
    
        //limpiar campos
    public void limpiar(Component[] panelfactcompra) {
        for (Object limpiar : panelfactcompra) {
            if (limpiar instanceof JTextField) {
                ((JTextField) limpiar).setText("");
            }
            if (limpiar instanceof JComboBox) {
                ((JComboBox) limpiar).setSelectedItem("Seleccione...");
            }
        }
    }
//Creación de la tabla factura compra en la ventana principal 
     public void mostrarTablaFactCompra(JTable tabla, String valor, String nompeste) {
        Conexion conect = new Conexion();
        Connection co = conect.iniciarConexion();

        //Personalizar Encabezado
        JTableHeader encabeza = tabla.getTableHeader();
        encabeza.setDefaultRenderer(new GestionEncabezado());
        tabla.setTableHeader(encabeza);

        //Personalizar Celdas
        tabla.setDefaultRenderer(Object.class, new GestionCeldas());
        JButton editar = new JButton();

        editar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/editar.png")));

        String[] titulo = {"N°Factura Compra", "Identificación Proveedor", "Identificación Usuario", "Tipo de Pago",
            "Descuento", "Total Compra","Fecha de Compra"};
        int opcion = titulo.length;//tiene el tamaño original del titulo

        if (nompeste.equals("Factura")) {
            titulo = Arrays.copyOf(titulo, titulo.length + 1);
            titulo[titulo.length - 1] = "";
        } 
        DefaultTableModel tablaFactcompr = new DefaultTableModel(null, titulo) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };
        String sqlFactura;
        if (valor.equals("")) {
            sqlFactura= "SELECT * FROM mostrar_factura_compra";
        } else {
            sqlFactura = "call consultar_facturacompra('" + valor + "')";
        }
        try {
            String[] dato = new String[titulo.length];
            Statement st = co.createStatement(); //Crea una consulta
            ResultSet rs = st.executeQuery(sqlFactura);
            while (rs.next()) {//Como todos los datos son del mismo tipo se puede hacer el ciclo
                for (int i = 0; i < opcion; i++) {
                    dato[i] = rs.getString(i + 1);
                }
                Object[] fila = {dato[0], dato[1], dato[2], dato[3], dato[4], dato[5], dato[6]};
                if (nompeste.equals("Factura")) {
                    fila = Arrays.copyOf(fila, fila.length + 1);
                    fila[fila.length - 1] = editar;
                } 
                tablaFactcompr.addRow(fila);
            }
            co.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        tabla.setModel(tablaFactcompr);
        //Darle Tamaño a cada Columna
        int cantColum = tabla.getColumnCount();
        int[] ancho = {100, 180, 100, 150, 100, 160, 100, 30};
        for (int i = 0; i < cantColum; i++) {
            TableColumn columna = tabla.getColumnModel().getColumn(i);
            columna.setPreferredWidth(ancho[i]);
        }
        conect.cerrarConexion();
    }
     //buscar factura compra
     
       public void buscarFactcompra(int valor) {
        Conexion conect = new Conexion();
        Connection co = conect.iniciarConexion();
        String sql = "call buscar_facturacompra(" + valor + ")";
        try {
            Statement st = co.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                setIdfact(rs.getInt(1));
                setDocprovee(rs.getInt(2));
                setDocusu(rs.getInt(3));
                setTipo_pag(rs.getString(4));
                setDesc(rs.getInt(5));
                setTotal_compr(rs.getFloat(6));
                setFec(rs.getDate(7));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    //Para que al actualizar me muestre el dato que selecciono el usuario
    public String obtenerSeleccion(Map<String, Integer> info, int valor) {
        for (Map.Entry<String, Integer> seleccion : info.entrySet()) {
            if (seleccion.getValue() == valor) {
                return seleccion.getKey();
            }
        }
        return null;
    }
    
    //Actualizar factura compra
    public void actualizarFactcompra() {
        Conexion conect = new Conexion();
        Connection con = conect.iniciarConexion();
        String sql = "call actualizar_facturacompra(?,?,?,?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, getIdfact());
            ps.setInt(2, getDocprovee());
            ps.setInt(3, getDocusu());
            ps.setString(4, getTipo_pag());
            ps.executeUpdate();

            JOptionPane.showMessageDialog(null, "Información Actualizada");
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        conect.cerrarConexion();
    }
}
