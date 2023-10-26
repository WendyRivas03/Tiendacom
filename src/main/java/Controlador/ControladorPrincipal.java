package Controlador;

import Modelo.ModeloUsuario;
import Vista.Nueva_Factura_Compra;
import Vista.Nueva_Venta;
import Vista.Nuevo_Cliente;
import Vista.Nuevo_Producto;
import Vista.Nuevo_Proveedor;
import Vista.Nuevo_Usuario;
import Vista.Principal;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.JFrame;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

public class ControladorPrincipal implements ActionListener {

    Principal prin = new Principal();
    Nuevo_Usuario usu = new Nuevo_Usuario();
    Nuevo_Cliente cli = new Nuevo_Cliente();
    Nuevo_Proveedor provee = new Nuevo_Proveedor();
    Nuevo_Producto produc = new Nuevo_Producto();
    Nueva_Factura_Compra factcompr = new Nueva_Factura_Compra();
    Nueva_Venta vent = new Nueva_Venta();
    ControladorUsuario controusu = new ControladorUsuario();
    ControladorCliente controcli = new ControladorCliente();
    ControladorProveedor contropro = new ControladorProveedor();

    public ControladorPrincipal() {
        prin.getBtnnuevo().addActionListener(this);
        prin.getBtnnueclien().addActionListener(this);
        prin.getBtnnuevoprovee().addActionListener(this);
        prin.getBtnnuevoproducto().addActionListener(this);
        prin.getBtnnuevaFactura().addActionListener(this);
        prin.getBtnnuevaVenta().addActionListener(this);
        usu.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        cli.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        provee.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        produc.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        factcompr.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        vent.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
    }

    public void iniciarPrincipal() {
        prin.setLocationRelativeTo(null);
        prin.setTitle("Principal");
        prin.setExtendedState(JFrame.MAXIMIZED_BOTH);
        prin.setVisible(true);
        gestionarPestanas();
    }

    public void gestionarPestanas() {
        ModeloUsuario modusu = new ModeloUsuario();
        int seleccionar = prin.getTpPrincipal().getSelectedIndex();
        if (seleccionar == 0) {
            modusu.mostrarTablaUsuario(prin.getJtusuario(), "");

            prin.getTpPrincipal().addChangeListener(new ChangeListener() {

                @Override
                public void stateChanged(ChangeEvent e) {

                }
            });
            prin.getJtfusuario().addMouseListener(new MouseAdapter() {
                @Override
                public void mouseClicked(MouseEvent e) {
                    prin.getJtfusuario().setText("");
                    prin.getJtfusuario().setForeground(new java.awt.Color(0, 0, 0));
                }
            });
            prin.getJtfusuario().getDocument().addDocumentListener(new DocumentListener() {
                @Override
                public void insertUpdate(DocumentEvent e) {
                    modusu.mostrarTablaUsuario(prin.getJtusuario(), prin.getJtfusuario().getText());
                }

                @Override
                public void removeUpdate(DocumentEvent e) {
                    modusu.mostrarTablaUsuario(prin.getJtusuario(), prin.getJtfusuario().getText());
                }

                @Override
                public void changedUpdate(DocumentEvent e) {
                    modusu.mostrarTablaUsuario(prin.getJtusuario(), prin.getJtfusuario().getText());
                }
            });
            //Para darle clic al boton de editar
            prin.getJtusuario().addMouseListener(new MouseAdapter() {
                @Override
                public void mouseClicked(MouseEvent e) {
                    int fila = prin.getJtusuario().rowAtPoint(e.getPoint());
                    int colum = prin.getJtusuario().columnAtPoint(e.getPoint());
                    modusu.setDoc(Integer.parseInt(prin.getJtusuario().getValueAt(fila, 1).toString()));

                    if (colum == 9) {
                        controusu.actualizarUsuario(modusu.getDoc());
                    }
                }
            });
        }
    }

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
            contropro.controlProveedor();
        }
        if (e.getSource().equals(prin.getBtnnuevoproducto())) {
            prin.setVisible(false);
            produc.setLocationRelativeTo(null);
            produc.setTitle("Nuevo Producto");
            produc.setVisible(true);
        }
        if (e.getSource().equals(prin.getBtnnuevaFactura())) {
            prin.setVisible(false);
            factcompr.setLocationRelativeTo(null);
            factcompr.setTitle("Nueva Factura Compra");
            factcompr.setVisible(true);
        }
        if (e.getSource().equals(prin.getBtnnuevaVenta())) {
            prin.setVisible(false);
            vent.setLocationRelativeTo(null);
            vent.setTitle("Nueva Venta");
            vent.setVisible(true);
        }
    }
}
