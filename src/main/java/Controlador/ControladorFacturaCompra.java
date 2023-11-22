package Controlador;

import Modelo.ModeloFacturaCompra;
import Modelo.ModeloProveedor;
import Modelo.ModeloUsuario;
import Vista.Buscar;
import Vista.Nueva_Factura_Compra;
import Vista.Principal;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.BorderFactory;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.border.Border;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

public class ControladorFacturaCompra implements ActionListener, DocumentListener {

    Nueva_Factura_Compra factnuev = new Nueva_Factura_Compra();
    Principal prin = new Principal();
    Buscar buscar = new Buscar();
    ModeloUsuario modusu = new ModeloUsuario();
    ModeloProveedor modprovee = new ModeloProveedor();
    ModeloFacturaCompra modfactnuev = new ModeloFacturaCompra();

    public ControladorFacturaCompra() {
        factnuev.getBtnguardarfactcomp().addActionListener(this);
        factnuev.getBtncancelarfactcomp().addActionListener(this);
        factnuev.getBtnbuscarproveedor().addActionListener(this);
        factnuev.getBtnbuscarusuario().addActionListener(this);
        buscar.getTxtbuscar().getDocument().addDocumentListener(this);
        factnuev.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);//Desactiva la x que cierra el programa para que permita abrir o volcer a la ventana principal
        buscar.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        factnuev.addWindowListener(new WindowAdapter() {
            public void windowClosed(WindowEvent e) {
                ControladorPrincipal princ = new ControladorPrincipal();
                princ.iniciarPrincipal(4);
            }
        });
        buscar.addWindowListener(new WindowAdapter() {
            public void windowClosed(WindowEvent e) {
                factnuev.setVisible(true);
                buscar.setVisible(false);
            }
        });
    }

    public void controlFacturaCompra() {
        prin.setVisible(false);
        factnuev.setLocationRelativeTo(null);
        factnuev.setTitle("Nueva Factura Compra");
        factnuev.setVisible(true);
        buscar();
    }

    public void buscar() {
        buscar.getJTablaBuscarusuario().addMouseListener(new MouseAdapter() {
            public void mouseClicked(MouseEvent e) {
                int fila = buscar.getJTablaBuscarusuario().rowAtPoint(e.getPoint());
                int colum = buscar.getJTablaBuscarusuario().columnAtPoint(e.getPoint());

                if (buscar.getLblTitulo().getText().equals("Usuario")) {
                    modusu.setDoc(Integer.parseInt(buscar.getJTablaBuscarusuario().getValueAt(fila, 0).toString()));
                    if (colum == 9) {
                        buscar.setVisible(false);
                        factnuev.setVisible(true);
                        Object idusua = modusu.getDoc();
                        factnuev.getTxtidentiusufactcomp().setText(idusua.toString());
                        JOptionPane.showMessageDialog(null, "Usuario Agregado");
                    }
                } else {
                    modprovee.setDoc(Integer.parseInt(buscar.getJTablaBuscarusuario().getValueAt(fila, 0).toString()));
                    if (colum == 9) {
                        buscar.setVisible(false);
                        factnuev.setVisible(true);
                        Object idprovee = modprovee.getDoc();
                        factnuev.getTxtidentiprovefact().setText(idprovee.toString());
                        JOptionPane.showMessageDialog(null, "Proveedor Agregado");
                    }
                }
            }
        });

        buscar.getTxtbuscar().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                buscar.getTxtbuscar().setText("");
                buscar.getTxtbuscar().setForeground(new java.awt.Color(0, 0, 0));

            }
        });
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource().equals(factnuev.getBtnbuscarusuario())) {
            buscar.getLblTitulo().setText("Usuario");
            factnuev.setVisible(false);
            buscar.setLocationRelativeTo(null);
            modusu.mostrarTablaUsuario(buscar.getJTablaBuscarusuario(), "", "Nueva Factura");
            buscar.setVisible(true);
            Border borde = BorderFactory.createTitledBorder(null, "Buscar Usuario",
                    javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION,
                    new java.awt.Font("Yu Gothic UI", 1, 36),
                    new java.awt.Color(204, 0, 204));
            buscar.getJPanelbucarusuario().setBorder(borde);
        }

        if (e.getSource().equals(factnuev.getBtnbuscarproveedor())) {
            buscar.getLblTitulo().setText("Proveedor");
            factnuev.setVisible(false);
            buscar.setLocationRelativeTo(null);
            modprovee.mostrarTablaProveedor(buscar.getJTablaBuscarusuario(), "", "Nueva Factura");
            buscar.setVisible(true);
            Border borde = BorderFactory.createTitledBorder(null, "Buscar Proveedor",
                    javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION,
                    new java.awt.Font("Yu Gothic UI", 1, 36),
                    new java.awt.Color(204, 0, 204));
            buscar.getJPanelbucarusuario().setBorder(borde);
        }
        
        if (e.getSource().equals(factnuev.getBtnguardarfactcomp())){
            //validar campos vacios
            if ((factnuev.getTxtidentiprovefact().getText().isEmpty()) || (factnuev.getTxtidentiusufactcomp().getText().isEmpty()) || (factnuev.getCmbtipopagofactcompa().getSelectedItem().equals("Seleccione..."))) {
                JOptionPane.showMessageDialog(null, "Debe ingresar información en los campos de Nombre y Descripción");
            } else {
                modfactnuev.setDocprovee(Integer.parseInt(factnuev.getTxtidentiprovefact().getText()));
                modfactnuev.setDocusu((Integer.parseInt(factnuev.getTxtidentiusufactcomp().getText())));
                modfactnuev.setTipo_pag(factnuev.getCmbtipopagofactcompa().getSelectedItem().toString());

                if (factnuev.getBtnguardarfactcomp().getText().equals("Guardar")) {
                    modfactnuev.insertarFactcompra();
                    modfactnuev.limpiar(factnuev.getPanelFacturacompra().getComponents());
                } else {
//                    modfactnuev.actualizarProducto();
                    factnuev.setVisible(false);
                    factnuev.dispose();
                    modfactnuev.mostrarTablaFactCompra(prin.getTablafactura(), "", "Factura");
                }
            }
        }

        if (e.getSource().equals(factnuev.getBtncancelarfactcomp())) {
            factnuev.dispose();
        }
    }

    @Override
    public void insertUpdate(DocumentEvent e) {
        if (buscar.getLblTitulo().getText().equals("Usuario")) {
            modusu.mostrarTablaUsuario(buscar.getJTablaBuscarusuario(), buscar.getTxtbuscar().getText(), "Nueva Factura");
        } else {
            modprovee.mostrarTablaProveedor(buscar.getJTablaBuscarusuario(), buscar.getTxtbuscar().getText(), "Nueva Factura");
        }
    }

    @Override
    public void removeUpdate(DocumentEvent e) {
        if (buscar.getLblTitulo().getText().equals("Usuario")) {
            modusu.mostrarTablaUsuario(buscar.getJTablaBuscarusuario(), buscar.getTxtbuscar().getText(), "Nueva Factura");
        } else {
            modprovee.mostrarTablaProveedor(buscar.getJTablaBuscarusuario(), buscar.getTxtbuscar().getText(), "Nueva Factura");
        }
    }

    @Override
    public void changedUpdate(DocumentEvent e) {
        if (buscar.getLblTitulo().getText().equals("Usuario")) {
            modusu.mostrarTablaUsuario(buscar.getJTablaBuscarusuario(), buscar.getTxtbuscar().getText(), "Nueva Factura");
        } else {
            modprovee.mostrarTablaProveedor(buscar.getJTablaBuscarusuario(), buscar.getTxtbuscar().getText(), "Nueva Factura");
        }
    }

}
