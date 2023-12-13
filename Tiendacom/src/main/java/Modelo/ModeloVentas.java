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

public class ModeloVentas {

    private int idfactu, docuclient, docusu, comprove, idproduc, canti;
    private float total_factu, impuest, descu;
    private String tipo_pag;
    private Date fecha;

    public int getIdfactu() {
        return idfactu;
    }

    public void setIdfactu(int idfactu) {
        this.idfactu = idfactu;
    }

    public int getIdproduc() {
        return idproduc;
    }

    public void setIdproduc(int idproduc) {
        this.idproduc = idproduc;
    }

    public int getCanti() {
        return canti;
    }

    public void setCanti(int canti) {
        this.canti = canti;
    }

    public float getDescu() {
        return descu;
    }

    public void setDescu(float descu) {
        this.descu = descu;
    }

    public int getDocuclient() {
        return docuclient;
    }

    public void setDocuclient(int docuclient) {
        this.docuclient = docuclient;
    }

    public int getDocusu() {
        return docusu;
    }

    public void setDocusu(int docusu) {
        this.docusu = docusu;
    }

    public float getTotal_factu() {
        return total_factu;
    }

    public void setTotal_factu(float total_factu) {
        this.total_factu = total_factu;
    }

    public float getImpuest() {
        return impuest;
    }

    public void setImpuest(float impuest) {
        this.impuest = impuest;
    }

    public String getTipo_pag() {
        return tipo_pag;
    }

    public void setTipo_pag(String tipo_pag) {
        this.tipo_pag = tipo_pag;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getComprove() {
        return comprove;
    }

    public void setComprove(int comprove) {
        this.comprove = comprove;
    }

    //insertar venta
    public void insertarVenta() {
        Conexion conect = new Conexion();
        Connection co = conect.iniciarConexion();
        String sql = "call inst_factura(?,?,?,?)";

        try {
            PreparedStatement ps = co.prepareStatement(sql);
            ps.setInt(1, getDocuclient());
            ps.setInt(2, getDocusu());
            ps.setInt(3, getComprove());
            ps.setString(4, getTipo_pag());
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
    public void limpiar(Component[] panelventa) {
        for (Object limpiar : panelventa) {
            if (limpiar instanceof JTextField) {
                ((JTextField) limpiar).setText("");
            }
            if (limpiar instanceof JComboBox) {
                ((JComboBox) limpiar).setSelectedItem("Seleccione...");
            }
        }
    }

    //Creación de la tabla factura asociada a la venta en la ventana principal 
    public void mostrarTablaVenta(JTable tabla, String valor, String nompeste) {
        Conexion conect = new Conexion();
        Connection co = conect.iniciarConexion();

        //Personalizar Encabezado
        JTableHeader encabeza = tabla.getTableHeader();
        encabeza.setDefaultRenderer(new GestionEncabezado());
        tabla.setTableHeader(encabeza);

        //Personalizar Celdas
        tabla.setDefaultRenderer(Object.class, new GestionCeldas());

        JButton editar = new JButton();
        JButton agregar_producto = new JButton();
        JButton mostrar_detalle = new JButton();
        JButton imprimir_factuta = new JButton();

        editar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/editar.png")));
        agregar_producto.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/agregar-producto.png")));
        mostrar_detalle.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/factura.png")));
        imprimir_factuta.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/imprimir.png")));

        String[] titulo = {"N°Factura", "Cliente", "Empleado", "Fecha de Compra", "Tipo de Pago",
            "Comprobante", "Impuesto", "Total"};
        int opcion = titulo.length;//tiene el tamaño original del titulo

        if (nompeste.equals("Venta")) {
            titulo = Arrays.copyOf(titulo, titulo.length + 4);
            titulo[titulo.length - 4] = "";
            titulo[titulo.length - 3] = "";
            titulo[titulo.length - 2] = "";
            titulo[titulo.length - 1] = "";
        }
        DefaultTableModel tablaFact = new DefaultTableModel(null, titulo) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };
        String sqlFactura;
        if (valor.equals("")) {
            sqlFactura = "SELECT * FROM mostrar_factura";
        } else {
            sqlFactura = "call consultar_factura('" + valor + "')";
        }
        try {
            String[] dato = new String[titulo.length];
            Statement st = co.createStatement(); //Crea una consulta
            ResultSet rs = st.executeQuery(sqlFactura);
            while (rs.next()) {//Como todos los datos son del mismo tipo se puede hacer el ciclo
                for (int i = 0; i < opcion; i++) {
                    dato[i] = rs.getString(i + 1);
                }
                Object[] fila = {dato[0], dato[1], dato[2], dato[3], dato[4], dato[5], dato[6], dato[7]};
                if (nompeste.equals("Venta")) {
                    fila = Arrays.copyOf(fila, fila.length + 4);
                    fila[fila.length - 4] = editar;
                    fila[fila.length - 3] = agregar_producto;
                    fila[fila.length - 2] = mostrar_detalle;
                    fila[fila.length - 1] = imprimir_factuta;
                }
                tablaFact.addRow(fila);
            }
            co.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        tabla.setModel(tablaFact);
        //Darle Tamaño a cada Columna
        int cantColum = tabla.getColumnCount();
        int[] ancho = {100, 180, 100, 150, 100, 160, 100, 100, 30, 30, 30, 30};
        for (int i = 0; i < cantColum; i++) {
            TableColumn columna = tabla.getColumnModel().getColumn(i);
            columna.setPreferredWidth(ancho[i]);
        }
        conect.cerrarConexion();
    }

    public boolean seleccionCheck(JTable tabla) {
        for (int i = 0; i < tabla.getRowCount(); i++) {
            Boolean seleccionar = (Boolean) tabla.getValueAt(i, 6);
            if (seleccionar != null && seleccionar) {
                Object can = tabla.getValueAt(i, 4);
                Object val = tabla.getValueAt(i, 5);
                if ((can == null || !can.toString().equals("0"))
                        && (val == null || !val.toString().equals("0"))) //para validar que alla informacion en los campos 
                {
                    return true;
                }
            }
        }
        return false;
    }

    public void agregarProductos(JTable tablaProduc, JTable tablaDetalle) {
        //Personalizar Encabezado
        JTableHeader encabeza = tablaDetalle.getTableHeader();
        encabeza.setDefaultRenderer(new GestionEncabezado());
        tablaDetalle.setTableHeader(encabeza);
        //Personalizar Celdas
        tablaDetalle.setDefaultRenderer(Object.class, new GestionCeldas());

        Object[] titulo = {"Código", "Producto", "Decripción", "Cantidad", "Precio"};

        DefaultTableModel tabla_addProductos = new DefaultTableModel(null, titulo) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return column == 3 || column == 4;
            }
        };

        if (seleccionCheck(tablaProduc)) {
            for (int i = 0; i < tablaProduc.getRowCount(); i++) {
                Boolean seleccionar = (Boolean) tablaProduc.getValueAt(i, 6);
                if (seleccionar != null && seleccionar) {
                    Object dato[] = new Object[titulo.length];
                    dato[0] = tablaProduc.getValueAt(i, 0);
                    dato[1] = tablaProduc.getValueAt(i, 2);
                    dato[2] = tablaProduc.getValueAt(i, 3);
                    dato[3] = tablaProduc.getValueAt(i, 4);
                    dato[4] = tablaProduc.getValueAt(i, 5);
                    Object fila[] = {dato[0], dato[1], dato[2], dato[3], dato[4]};
                    tabla_addProductos.addRow(fila);
                }
            }
        } else {
            JOptionPane.showMessageDialog(null, "Debe seleccionar al menos un producto y agregar la cantidad y el valor");
        }
        tablaDetalle.setModel(tabla_addProductos);
    }
    
//insertar detalle factura  

    public void insertarDetalleFact() {
        Conexion conect = new Conexion();
        Connection co = conect.iniciarConexion();
        String sql = "call inst_detalle_factura(?, ?, ?, ?)";

        try {
            PreparedStatement ps = co.prepareStatement(sql);
            ps.setInt(1, getIdproduc());
            ps.setInt(2, getIdfactu());
            ps.setInt(3, getCanti());
            ps.setFloat(4, getDescu());
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null, "Información Guardada");

            co.close();

        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, "Error al guardar", "Error", JOptionPane.ERROR_MESSAGE);
        }
        conect.cerrarConexion();
    }

//TABLA DE VER
    public String[] buscarTablaDetalleFact(int valor, JTable tabla) {
        Conexion conect = new Conexion();
        Connection co = conect.iniciarConexion();

        //Personalizar Encabezado
        JTableHeader encabeza = tabla.getTableHeader();
        encabeza.setDefaultRenderer(new GestionEncabezado());
        tabla.setTableHeader(encabeza);

        //Personalizar Celdas
        tabla.setDefaultRenderer(Object.class, new GestionCeldas());

        String[] titulo = {"Código", "Producto", "Descripción", "Cantidad",
            "Descuento", "Total"};
        int opcion = titulo.length;//tiene el tamaño original del titulo

        DefaultTableModel tabladetalleFactcompr = new DefaultTableModel(null, titulo) {
            @Override
            public boolean isCellEditable(int row, int column) {

                String sql = "call detalle_factura_mostrar(" + valor + ")";
                String[] dato = null;

                return false;
            }
        };

        String sql = "call detalle_factura_mostrar(" + valor + ")";
        String[] dato = null;

        try {
            Statement st = co.createStatement();
            ResultSet rs = st.executeQuery(sql);
            int total = rs.getMetaData().getColumnCount(); //Conocer el total de columnas de un registro de la base de datos
            dato = new String[total];
            while (rs.next()) {//Como todos los datos son del mismo tipo se puede hacer el ciclo
                for (int i = 0; i < total; i++) {
                    dato[i] = rs.getString(i + 1);
                }
                Object[] fila = {dato[8], dato[9], dato[10], dato[11], dato[12], dato[13]};

                tabladetalleFactcompr.addRow(fila);
            }
            co.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        tabla.setModel(tabladetalleFactcompr);
        //Darle Tamaño a cada Columna
        int cantColum = tabla.getColumnCount();
        int[] ancho = {10, 30, 70, 6, 30, 50};
        for (int i = 0; i < cantColum; i++) {
            TableColumn columna = tabla.getColumnModel().getColumn(i);
            columna.setPreferredWidth(ancho[i]);
        }
        conect.cerrarConexion();
        return dato;
    }

    //buscar factura
    public void buscarVenta(int valor) {
        Conexion conect = new Conexion();
        Connection co = conect.iniciarConexion();
        String sql = "call buscar_factura(" + valor + ")";
        try {
            Statement st = co.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                setIdfactu(rs.getInt(1));
                setDocuclient(rs.getInt(2));
                setDocusu(rs.getInt(3));
                setTipo_pag(rs.getString(4));
                setFecha(rs.getDate(5));
                setComprove(rs.getInt(6));
                setImpuest(rs.getInt(7));
                setTotal_factu(rs.getFloat(8));
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

    //Actualizar factura 
    public void actualizarVenta() {
        Conexion conect = new Conexion();
        Connection con = conect.iniciarConexion();
        String sql = "call actualizar_factura(?,?,?,?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, getIdfactu());
            ps.setInt(2, getDocuclient());
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
