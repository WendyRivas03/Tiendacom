package Controlador;

import Modelo.ModeloCliente;
import Modelo.ModeloFacturaCompra;
import Modelo.ModeloProducto;
import Modelo.ModeloProveedor;
import Modelo.ModeloUsuario;
import Modelo.ModeloVentas;
import Vista.Mostrar_Detalle_Factura_Compra;
import Vista.Principal;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

public class ControladorPrincipal implements ActionListener, ChangeListener, DocumentListener {

    Principal prin = new Principal();
//    Nueva_Venta vent = new Nueva_Venta();
    Mostrar_Detalle_Factura_Compra mostradetalle = new Mostrar_Detalle_Factura_Compra();
    ControladorUsuario controusu = new ControladorUsuario();
    ControladorCliente controcli = new ControladorCliente();
    ControladorProveedor controprovee = new ControladorProveedor();
    ControladorProducto controproduc = new ControladorProducto();
    ControladorFacturaCompra controfact = new ControladorFacturaCompra();
    ControladorVenta controventa = new ControladorVenta();
    ModeloUsuario modusu = new ModeloUsuario();
    ModeloCliente modcli = new ModeloCliente();
    ModeloProveedor modprovee = new ModeloProveedor();
    ModeloProducto modproduc = new ModeloProducto();
    ModeloFacturaCompra modfactcomp = new ModeloFacturaCompra();
    ModeloVentas modventas = new ModeloVentas();

    public ControladorPrincipal() {
        prin.getBtnnuevo().addActionListener(this);
        prin.getBtnnueclien().addActionListener(this);
        prin.getBtnnuevoprovee().addActionListener(this);
        prin.getBtnnuevoproducto().addActionListener(this);
        prin.getBtnnuevaFactura().addActionListener(this);
        prin.getBtnnuevaVenta().addActionListener(this);
        prin.getTpPrincipal().addChangeListener(this);//Para que escuche al table pannel y me muestre todas las tablas
        prin.getJtfusuario().getDocument().addDocumentListener(this);//Que escuche el txt para buscar
        prin.getJtfcliente().getDocument().addDocumentListener(this);
        prin.getJtfprovee().getDocument().addDocumentListener(this);
        prin.getTxtbuscarproduct().getDocument().addDocumentListener(this);
        prin.getTxtbuscarfactura().getDocument().addDocumentListener(this);
        prin.getTxtbuscarventa().getDocument().addDocumentListener(this);
        mostradetalle.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        mostradetalle.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosed(WindowEvent e) {
                prin.setVisible(true);
                mostradetalle.setVisible(false);
            }
        });

    }

    public void iniciarPrincipal(int valor) {
        prin.setLocationRelativeTo(null);//Centra la ventana
        prin.setTitle("Principal");//Le da titulo a la ventana
        prin.setExtendedState(JFrame.MAXIMIZED_BOTH);//Maximiza la ventana
        prin.getTpPrincipal().setSelectedIndex(valor);
        prin.setVisible(true);//Se visualiza la ventana
        gestionUsuario();//llamo al metodo de Gestion usuario
    }

    public void gestionUsuario() {
        modusu.mostrarTablaUsuario(prin.getJtusuario(), "", "Usuario");
        prin.getJtfusuario().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                prin.getJtfusuario().setText("");
                prin.getJtfusuario().setForeground(new java.awt.Color(0, 0, 0));
            }
        });
        //Para darle clic al boton de editar y eliminar
        prin.getJtusuario().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int fila = prin.getJtusuario().rowAtPoint(e.getPoint());
                int colum = prin.getJtusuario().columnAtPoint(e.getPoint());
                modusu.setDoc(Integer.parseInt(prin.getJtusuario().getValueAt(fila, 0).toString()));

                if (colum == 9) {
                    prin.setVisible(false);
                    controusu.actualizarUsuario(modusu.getDoc());
                }
                if (colum == 10) {
                    controusu.eliminarUsuario(modusu.getDoc());
                    JOptionPane.showMessageDialog(null, "Registro Eliminado");
                    modusu.mostrarTablaUsuario(prin.getJtusuario(), "", "Usuario");
                }
            }
        });
    }

    public void gestionCliente() {
        modcli.mostrarTablaCliente(prin.getJtcliente(), "", "Cliente");
        prin.getJtfcliente().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                prin.getJtfcliente().setText("");
                prin.getJtfcliente().setForeground(new java.awt.Color(0, 0, 0));
            }
        });
        //Para darle clic al boton de editar
        prin.getJtcliente().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int fila = prin.getJtcliente().rowAtPoint(e.getPoint());
                int colum = prin.getJtcliente().columnAtPoint(e.getPoint());
                modcli.setDoc(Integer.parseInt(prin.getJtcliente().getValueAt(fila, 0).toString()));

                if (colum == 8) {
                    prin.setVisible(false);
                    controcli.actualizarCliente(modcli.getDoc());
                }
                if (colum == 9) {
                    controcli.eliminarCliente(modcli.getDoc());
                    JOptionPane.showMessageDialog(null, "Registro Eliminado");
                    modcli.mostrarTablaCliente(prin.getJtcliente(), "", "Cliente");
                }
            }
        });
    }

    public void gestionProveedor() {
        modprovee.mostrarTablaProveedor(prin.getJtprovee(), "", "Proveedor");
        prin.getJtfprovee().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                prin.getJtfprovee().setText("");
                prin.getJtfprovee().setForeground(new java.awt.Color(0, 0, 0));
            }
        });
        //Para darle clic al boton de editar
        prin.getJtprovee().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int fila = prin.getJtprovee().rowAtPoint(e.getPoint());
                int colum = prin.getJtprovee().columnAtPoint(e.getPoint());
                modprovee.setDoc(Integer.parseInt(prin.getJtprovee().getValueAt(fila, 0).toString()));

                if (colum == 9) {
                    prin.setVisible(false);
                    controprovee.actualizarProveedor(modprovee.getDoc());
                }
                if (colum == 10) {
                    controprovee.eliminarProveedor(modprovee.getDoc());
                    JOptionPane.showMessageDialog(null, "Registro Eliminado");
                    modprovee.mostrarTablaProveedor(prin.getJtprovee(), "", "Proveedor");
                }
            }
        });
    }

    public void gestionProducto() {
        modproduc.mostrarTablaProducto(prin.getTablaProducto(), "", "Producto");
        prin.getTxtbuscarproduct().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                prin.getTxtbuscarproduct().setText("");
                prin.getTxtbuscarproduct().setForeground(new java.awt.Color(0, 0, 0));
            }
        });
        //Para darle clic al boton de editar y eliminar
        prin.getTablaProducto().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int fila = prin.getTablaProducto().rowAtPoint(e.getPoint());
                int colum = prin.getTablaProducto().columnAtPoint(e.getPoint());
                modproduc.setDoc(Integer.parseInt(prin.getTablaProducto().getValueAt(fila, 0).toString()));

                if (colum == 6) {
                    prin.setVisible(false);
                    controproduc.actualizarProducto(modproduc.getDoc());
                }
                if (colum == 7) {
                    controproduc.eliminarProducto(modproduc.getDoc());
                    JOptionPane.showMessageDialog(null, "Registro Eliminado");
                    modproduc.mostrarTablaProducto(prin.getTablaProducto(), "", "Producto");
                }
            }
        });
    }

    public void gestionFacturacompra() {
        modfactcomp.mostrarTablaFactCompra(prin.getTablafactura(), "", "Factura");
        prin.getTxtbuscarfactura().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                prin.getTxtbuscarfactura().setText("");
                prin.getTxtbuscarfactura().setForeground(new java.awt.Color(0, 0, 0));
            }
        });
        //Para darle clic al boton de editar
        prin.getTablafactura().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int fila = prin.getTablafactura().rowAtPoint(e.getPoint());
                int colum = prin.getTablafactura().columnAtPoint(e.getPoint());
                modfactcomp.setIdfact(Integer.parseInt(prin.getTablafactura().getValueAt(fila, 0).toString()));

                if (colum == 8) {
                    prin.setVisible(false);
                    controfact.actualizarFactcompra(modfactcomp.getIdfact());
                    controfact.buscar();
                }
                if (colum == 9) {
                    prin.setVisible(false);
                    controfact.agregarDetalle(modfactcomp.getIdfact());
                }
                if (colum == 10) {
                    prin.setVisible(false);
                    controfact.ver_Factura(modfactcomp.getIdfact());
                }
                if (colum == 11) {
                    prin.setVisible(false);
                }
            }
        });
    }

    public void gestionVenta() {
        modventas.mostrarTablaVenta(prin.getTablaventa(), "", "Venta");
        prin.getTxtbuscarventa().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                prin.getTxtbuscarventa().setText("");
                prin.getTxtbuscarventa().setForeground(new java.awt.Color(0, 0, 0));
            }
        });
        //Para darle clic al boton de editar
        prin.getTablaventa().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int fila = prin.getTablaventa().rowAtPoint(e.getPoint());
                int colum = prin.getTablaventa().columnAtPoint(e.getPoint());
                modventas.setIdfactu(Integer.parseInt(prin.getTablaventa().getValueAt(fila, 0).toString()));

                if (colum == 8) {
                    prin.setVisible(false);
                    prin.setExtendedState(JFrame.MAXIMIZED_BOTH);
                    controventa.actualizarVenta(modventas.getIdfactu());
                }
                 if (colum == 9) {
                    prin.setVisible(false);
                    controventa.agregarDetalle(modventas.getIdfactu());
                }
                if (colum == 10) {
                    prin.setVisible(false);
                    controventa.ver_FacturaVenta(modventas.getIdfactu());
                }
                if (colum == 11) {
                    prin.setVisible(false);
                }
            }
        });

    }
//MODIFICADOR DE CORREO*******************************************************************************

    public boolean modificadorAccesoCorreo(String correo) {
        String corr = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9+_.-]+\\.[A-Z|a-z]{2,}$";
        Pattern validar = Pattern.compile(corr);//compila y valida lo anterior
        Matcher cor = validar.matcher(correo);//convierte el correo a caracter
        return cor.matches();//si esta de acuerdo con la estructura el retorna verdadero o falso
    }
//******************************************************************************************************

    @Override
    public void actionPerformed(ActionEvent e) {

        if (e.getSource().equals(prin.getBtnnuevo())) {
            prin.setVisible(false);
            controusu.controlUsuario();
        }
        if (e.getSource().equals(prin.getBtnnueclien())) {
            prin.setVisible(false);
            controcli.controlCliente();
        }
        if (e.getSource().equals(prin.getBtnnuevoprovee())) {
            prin.setVisible(false);
            controprovee.controlProveedor();
        }
        if (e.getSource().equals(prin.getBtnnuevoproducto())) {
            prin.setVisible(false);
            controproduc.controlProducto();
        }
        if (e.getSource().equals(prin.getBtnnuevaFactura())) {
            prin.setVisible(false);
            controfact.controlFacturaCompra();

        }
        if (e.getSource().equals(prin.getBtnnuevaVenta())) {
            prin.setVisible(false);
            controventa.controlVenta();
        }
    }

    @Override
    public void stateChanged(ChangeEvent e) {
        int seleccionar = prin.getTpPrincipal().getSelectedIndex();
        if (seleccionar == 0) {
        }
        if (seleccionar == 1) {
            gestionCliente();
        }
        if (seleccionar == 2) {
            gestionProveedor();
        }
        if (seleccionar == 3) {
            gestionProducto();
        }
        if (seleccionar == 4) {
            gestionFacturacompra();
        }
        if (seleccionar == 5) {
            gestionVenta();
        }
    }

    @Override
    public void insertUpdate(DocumentEvent e) {
        modusu.mostrarTablaUsuario(prin.getJtusuario(), prin.getJtfusuario().getText(), "Usuario");
        modcli.mostrarTablaCliente(prin.getJtcliente(), prin.getJtfcliente().getText(), "Cliente");
        modprovee.mostrarTablaProveedor(prin.getJtprovee(), prin.getJtfprovee().getText(), "Proveedor");
        modproduc.mostrarTablaProducto(prin.getTablaProducto(), prin.getTxtbuscarproduct().getText(), "Producto");
        modfactcomp.mostrarTablaFactCompra(prin.getTablafactura(), prin.getTxtbuscarfactura().getText(), "Factura");
        modventas.mostrarTablaVenta(prin.getTablaventa(), prin.getTxtbuscarventa().getText(), "Venta");
    }

    @Override
    public void removeUpdate(DocumentEvent e) {
        modusu.mostrarTablaUsuario(prin.getJtusuario(), prin.getJtfusuario().getText(), "Usuario");
        modcli.mostrarTablaCliente(prin.getJtcliente(), prin.getJtfcliente().getText(), "Cliente");
        modprovee.mostrarTablaProveedor(prin.getJtprovee(), prin.getJtfprovee().getText(), "Proveedor");
        modproduc.mostrarTablaProducto(prin.getTablaProducto(), prin.getTxtbuscarproduct().getText(), "Producto");
        modfactcomp.mostrarTablaFactCompra(prin.getTablafactura(), prin.getTxtbuscarfactura().getText(), "Factura");
        modventas.mostrarTablaVenta(prin.getTablaventa(), prin.getTxtbuscarventa().getText(), "Venta");
    }

    @Override
    public void changedUpdate(DocumentEvent e) {
        modusu.mostrarTablaUsuario(prin.getJtusuario(), prin.getJtfusuario().getText(), "Usuario");
        modcli.mostrarTablaCliente(prin.getJtcliente(), prin.getJtfcliente().getText(), "Cliente");
        modprovee.mostrarTablaProveedor(prin.getJtprovee(), prin.getJtfprovee().getText(), "Proveedor");
        modproduc.mostrarTablaProducto(prin.getTablaProducto(), prin.getTxtbuscarproduct().getText(), "Producto");
        modfactcomp.mostrarTablaFactCompra(prin.getTablafactura(), prin.getTxtbuscarfactura().getText(), "Factura");
        modventas.mostrarTablaVenta(prin.getTablaventa(), prin.getTxtbuscarventa().getText(), "Venta");
    }
}
