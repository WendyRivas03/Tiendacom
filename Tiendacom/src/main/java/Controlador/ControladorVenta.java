package Controlador;

import Modelo.ModeloCliente;
import Modelo.ModeloProducto;
import Modelo.ModeloUsuario;
import Modelo.ModeloVentas;
import Vista.Agregar_Detalleproducto;
import Vista.Buscar;
import Vista.Buscar_Cliente;
import Vista.Buscar_Producto;
import Vista.Mostrar_Detalle_Factura;
import Vista.Nueva_Venta;
import Vista.Principal;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.border.Border;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

public class ControladorVenta implements ActionListener, DocumentListener {

    Nueva_Venta factventa = new Nueva_Venta();
    Principal prin = new Principal();
    Buscar buscarusu = new Buscar();
    Buscar_Cliente buscarcli = new Buscar_Cliente();
    Buscar_Producto buscapro = new Buscar_Producto();
    Agregar_Detalleproducto detallefact = new Agregar_Detalleproducto();
    Mostrar_Detalle_Factura mostraventa = new Mostrar_Detalle_Factura();
    ModeloUsuario modusu = new ModeloUsuario();
    ModeloCliente modclient = new ModeloCliente();
    ModeloVentas modventas = new ModeloVentas();
    ModeloProducto modproduc = new ModeloProducto();

    //Constructor
    public ControladorVenta() {
        factventa.getBtnguardarventa().addActionListener(this);
        factventa.getBtncancelarventa().addActionListener(this);
        factventa.getBtnbuscarcliente().addActionListener(this);
        factventa.getBtnbuscarusuarioventa().addActionListener(this);
        detallefact.getBtnbuscarproduct().addActionListener(this);
        detallefact.getBtnagregar().addActionListener(this);
        buscarusu.getTxtbuscar().getDocument().addDocumentListener(this);
        buscarcli.getTxtbuscarcliente().getDocument().addDocumentListener(this);
        buscapro.getTxtbuscarproducto().getDocument().addDocumentListener(this);
        factventa.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);//Desactiva la x que cierra el programa para que permita abrir o volcer a la ventana principal
        buscapro.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        detallefact.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        mostraventa.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        factventa.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosed(WindowEvent e) {
                ControladorPrincipal princ = new ControladorPrincipal();
                princ.iniciarPrincipal(5);
            }
        });
        detallefact.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosed(WindowEvent e) {
                factventa.dispose();
            }
        });
        buscapro.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosed(WindowEvent e) {
                detallefact.setVisible(true);
            }
        });
        mostraventa.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosed(WindowEvent e) {
                factventa.dispose();
            }
        });
    }

    public void agregarDetalle(int fac) {
        detallefact.setVisible(true);
        detallefact.setLocationRelativeTo(null);
        detallefact.setTitle("Agregar Detalle");
        detallefact.getLblfactura().setText(String.valueOf(fac));
    }

    public void controlVenta() {
        prin.setVisible(false);
        factventa.setLocationRelativeTo(null);
        factventa.setTitle("Nueva Venta");
        factventa.setVisible(true);
    }

    public void ver_FacturaVenta(int fact) {
        String dato[] = modventas.buscarTablaDetalleFact(fact, mostraventa.getJtablaventa());
        mostraventa.getLblfactu().setText(String.valueOf(fact));
        mostraventa.getLblcliente().setText(dato[1]);
        mostraventa.getLblusuar().setText(dato[2]);
        mostraventa.getLblpagotipo().setText(dato[3]);
        mostraventa.getLblcomprobante().setText(dato[4]);
        mostraventa.getLblimpuest().setText(dato[5]);
        mostraventa.getLblvalor().setText(dato[6]);
        mostraventa.getLblfecha().setText(dato[7]);
        mostraventa.setLocationRelativeTo(null);
        mostraventa.setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource().equals(detallefact.getBtnbuscarproduct())) {
            //configuración del boton por codigo
            JButton agregar = new JButton("Añadir");
            agregar.setForeground(new java.awt.Color(0, 153, 153));
            agregar.setFont(new java.awt.Font("Yu Gothic UI", 1, 18));
            agregar.setBounds(800, 100, 110, 35);
            buscapro.getJPanelbucarproducto().add(agregar);
            agregar.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    modventas.agregarProductos(buscapro.getJTablaBuscarproducto(), detallefact.getJTablaagragarproducto());
                    buscapro.setVisible(false);
                }
            });
            buscapro.setVisible(true);
            buscapro.setLocationRelativeTo(null);
            modproduc.mostrarTablaProducto(buscapro.getJTablaBuscarproducto(), "", "");
//Activar el TXTbuscar producto
            buscapro.getTxtbuscarproducto().addMouseListener(new MouseAdapter() {
                @Override
                public void mouseClicked(MouseEvent e) {
                    buscapro.getTxtbuscarproducto().setText("");
                    buscapro.getTxtbuscarproducto().setForeground(new java.awt.Color(0, 0, 0));
                }
            });
//boton agregar en la caja de texto el producto             
            buscapro.getJTablaBuscarproducto().addMouseListener(new MouseAdapter() {
                @Override
                public void mouseClicked(MouseEvent e) {
                    int fila = buscapro.getJTablaBuscarproducto().rowAtPoint(e.getPoint());

//Activar el boton de agregar producto
                    modproduc.setDoc(Integer.parseInt(buscapro.getJTablaBuscarproducto().getValueAt(fila, 0).toString()));
                }
            });
        }
        //boton agrgar producto en agregar detalle factura
        if (e.getSource().equals(detallefact.getBtnagregar())) {
            JTable tabla = detallefact.getJTablaagragarproducto();
            try {
                for (int i = 0; i < tabla.getRowCount(); i++) {
                    modventas.setIdfactu(Integer.parseInt(detallefact.getLblfactura().getText()));
                    modventas.setIdproduc(Integer.parseInt(tabla.getValueAt(i, 0).toString()));
                    modventas.setCanti(Integer.parseInt(tabla.getValueAt(i, 3).toString()));
                    modventas.setDescu(Float.parseFloat(tabla.getValueAt(i, 4).toString()));
                    modventas.insertarDetalleFact();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                detallefact.dispose();
                JOptionPane.showMessageDialog(null, "Registro Almacenado");
            }
        }
        if (e.getSource().equals(factventa.getBtnbuscarcliente())) {
            factventa.setVisible(false);
            buscarcli.setLocationRelativeTo(null);
            modclient.mostrarTablaCliente(buscarcli.getJTablaBuscarcliente(), "", "Factura Venta");
            buscarcli.setVisible(true);
            //Activar el TXTbuscar cliente
            buscarcli.getTxtbuscarcliente().addMouseListener(new MouseAdapter() {
                @Override
                public void mouseClicked(MouseEvent e) {
                    buscarcli.getTxtbuscarcliente().setText("");
                    buscarcli.getTxtbuscarcliente().setForeground(new java.awt.Color(0, 0, 0));
                }
            });
            //boton agregar en la caja de texto el cliente             
            buscarcli.getJTablaBuscarcliente().addMouseListener(new MouseAdapter() {
                @Override
                public void mouseClicked(MouseEvent e) {
                    int fila = buscarcli.getJTablaBuscarcliente().rowAtPoint(e.getPoint());
                    int colum = buscarcli.getJTablaBuscarcliente().columnAtPoint(e.getPoint());

//Activar el boton de agregar cliente
                    modclient.setDoc(Integer.parseInt(buscarcli.getJTablaBuscarcliente().getValueAt(fila, 0).toString()));
                    if (colum == 8) {
                        buscarcli.setVisible(false);
                        factventa.setVisible(true);
                        Object idcliente = modclient.getDoc();
                        factventa.getTxtidenticliventa().setText(idcliente.toString());
                        JOptionPane.showMessageDialog(null, "Cliente Agregado");
                    }
                }
            });
        }

        if (e.getSource().equals(factventa.getBtnbuscarusuarioventa())) {
            factventa.setVisible(false);
            buscarusu.setLocationRelativeTo(null);
            modusu.mostrarTablaUsuario(buscarusu.getJTablaBuscarusuario(), "", "Factura Venta");
            buscarusu.setVisible(true);
            Border borde = BorderFactory.createTitledBorder(null, "Buscar Usuario",
                    javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION,
                    new java.awt.Font("Yu Gothic UI", 1, 36),
                    new java.awt.Color(204, 0, 204));
            buscarusu.getJPanelbucarusuario().setBorder(borde);
            //Activar el TXTbuscar cliente
            buscarusu.getTxtbuscar().addMouseListener(new MouseAdapter() {
                @Override
                public void mouseClicked(MouseEvent e) {
                    buscarusu.getTxtbuscar().setText("");
                    buscarusu.getTxtbuscar().setForeground(new java.awt.Color(0, 0, 0));
                }
            });
            //boton agregar en la caja de texto el usuario            
            buscarusu.getJTablaBuscarusuario().addMouseListener(new MouseAdapter() {
                @Override
                public void mouseClicked(MouseEvent e) {
                    int fila = buscarusu.getJTablaBuscarusuario().rowAtPoint(e.getPoint());
                    int colum = buscarusu.getJTablaBuscarusuario().columnAtPoint(e.getPoint());

//Activar el boton de agregar usuario
                    modusu.setDoc(Integer.parseInt(buscarusu.getJTablaBuscarusuario().getValueAt(fila, 0).toString()));
                    if (colum == 9) {
                        buscarusu.setVisible(false);
                        factventa.setVisible(true);
                        Object idusuario = modusu.getDoc();
                        factventa.getTxtidentusuaventa().setText(idusuario.toString());
                        JOptionPane.showMessageDialog(null, "Usuario Agregado");
                    }
                }
            });
        }
        if (e.getSource().equals(factventa.getBtnguardarventa())) {
            //validar campos vacios
            if ((factventa.getTxtidenticliventa().getText().isEmpty()) || (factventa.getTxtidentusuaventa().getText().isEmpty()) || (factventa.getTxtnumerocomprobanteventa().getText().isEmpty())
                    || (factventa.getCmbtipopagoventa().getSelectedItem().equals("Seleccione..."))) {
                JOptionPane.showMessageDialog(null, "Debe ingresar información en los campos de Nombre y Descripción");
            } else {
                modventas.setDocuclient(Integer.parseInt(factventa.getTxtidenticliventa().getText()));
                modventas.setDocusu((Integer.parseInt(factventa.getTxtidentusuaventa().getText())));
                modventas.setComprove(Integer.parseInt(factventa.getTxtnumerocomprobanteventa().getText()));
                modventas.setTipo_pag(factventa.getCmbtipopagoventa().getSelectedItem().toString());

                if (factventa.getBtnguardarventa().getText().equals("Guardar")) {
                    modventas.insertarVenta();
                    modventas.limpiar(factventa.getPanelnuevaventa().getComponents());
                    factventa.setVisible(false);
                    factventa.dispose();
                } else {
                    modventas.actualizarVenta();
                    factventa.setVisible(false);
                    factventa.dispose();
                    modventas.mostrarTablaVenta(prin.getTablafactura(), "", "Factura");
                }
            }
        }

        if (e.getSource().equals(factventa.getBtncancelarventa())) {
            factventa.dispose();
        }
    }
    //Actualizar venta

    void actualizarVenta(int doc) {
        modventas.buscarVenta(doc);
        factventa.getTxtnumerocomprobanteventa().setEnabled(false);
        factventa.getTxtidenticliventa().setText(String.valueOf(modventas.getDocuclient()));
        factventa.getTxtidentusuaventa().setText(String.valueOf(modventas.getDocusu()));
        factventa.getTxtnumerocomprobanteventa().setText(String.valueOf(modventas.getComprove()));

        //Llenar tipo de pago
        factventa.getCmbtipopagoventa().setSelectedItem(modventas.getTipo_pag());

        //Cambiar Titulo
        Border borde = BorderFactory.createTitledBorder(null, "Actualizar Venta",
                javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION,
                new java.awt.Font("Yu Gothic UI", 1, 36),
                new java.awt.Color(204, 0, 204));
        factventa.getPanelnuevaventa().setBorder(borde);
        prin.setVisible(false);
        factventa.setLocationRelativeTo(null);
        factventa.getBtnguardarventa().setText("Actualizar");
        factventa.setVisible(true);
    }

    @Override
    public void insertUpdate(DocumentEvent e) {
        modclient.mostrarTablaCliente(buscarcli.getJTablaBuscarcliente(), buscarcli.getTxtbuscarcliente().getText(), "Nueva Venta");
        modusu.mostrarTablaUsuario(buscarusu.getJTablaBuscarusuario(), buscarusu.getTxtbuscar().getText(), "Nueva Venta");
        modproduc.mostrarTablaProducto(buscapro.getJTablaBuscarproducto(), buscapro.getTxtbuscarproducto().getText(), "");
    }

    @Override
    public void removeUpdate(DocumentEvent e) {
        modclient.mostrarTablaCliente(buscarcli.getJTablaBuscarcliente(), buscarcli.getTxtbuscarcliente().getText(), "Nueva Venta");
        modusu.mostrarTablaUsuario(buscarusu.getJTablaBuscarusuario(), buscarusu.getTxtbuscar().getText(), "Nueva Venta");
        modproduc.mostrarTablaProducto(buscapro.getJTablaBuscarproducto(), buscapro.getTxtbuscarproducto().getText(), "");
    }

    @Override
    public void changedUpdate(DocumentEvent e) {
        modclient.mostrarTablaCliente(buscarcli.getJTablaBuscarcliente(), buscarcli.getTxtbuscarcliente().getText(), "Nueva Venta");
        modusu.mostrarTablaUsuario(buscarusu.getJTablaBuscarusuario(), buscarusu.getTxtbuscar().getText(), "Nueva Venta");
        modproduc.mostrarTablaProducto(buscapro.getJTablaBuscarproducto(), buscapro.getTxtbuscarproducto().getText(), "");
    }

}
