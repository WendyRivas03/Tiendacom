package Controlador;

import Modelo.ModeloProveedor;
import Modelo.ModeloUsuario;
import Vista.Buscar_Usuario;
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

public class ControladorFacturaCompra implements ActionListener {

    Nueva_Factura_Compra factnuev = new Nueva_Factura_Compra();
    Principal prin = new Principal();
    Buscar_Usuario buscausu = new Buscar_Usuario();
    ModeloUsuario modusu = new ModeloUsuario();
    ModeloProveedor modprovee = new ModeloProveedor();

    public ControladorFacturaCompra() {
        factnuev.getBtnguardarfactcomp().addActionListener(this);
        factnuev.getBtncancelarfactcomp().addActionListener(this);
        factnuev.getBtnbuscarproveedor().addActionListener(this);
        factnuev.getBtnbuscarusuario().addActionListener(this);
        factnuev.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);//Desactiva la x que cierra el programa para que permita abrir o volcer a la ventana principal
        factnuev.addWindowListener(new WindowAdapter() {
            public void windowClosed(WindowEvent e) {
                ControladorPrincipal princ = new ControladorPrincipal();
                princ.iniciarPrincipal(4);
            }
        });
        buscausu.addWindowListener(new WindowAdapter() {
            public void windowClosed(WindowEvent e) {
                factnuev.setVisible(true);
            }
        });

//        buscausu.getJTablaBuscarusuario().addMouseListener(new MouseAdapter() {
//            public void mouseClicked(MouseEvent e) {
//                int fila = buscausu.getJTablaBuscarusuario().rowAtPoint(e.getPoint());
//                int colum = buscausu.getJTablaBuscarusuario().columnAtPoint(e.getPoint());
//                modusu.setDoc(Integer.parseInt(buscausu.getJTablaBuscarusuario().getValueAt(fila, 0).toString()));
//
//                if (colum == 9) {
//                    buscausu.setVisible(false);
//                    factnuev.setVisible(true);
//                    Object idusua = modusu.getDoc();
//                    factnuev.getTxtidentiusufactcomp().setText(idusua.toString());
//                    JOptionPane.showMessageDialog(null, "Usuario Agregado");
//                }
//            }
//        });
    }

    public void controlFacturaCompra() {
        prin.setVisible(false);
        factnuev.setLocationRelativeTo(null);
        factnuev.setTitle("Nueva Factura Compra");
        factnuev.setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource().equals(factnuev.getBtnbuscarusuario())) {
            buscausu.getJTablaBuscarusuario().addMouseListener(new MouseAdapter() {
                public void mouseClicked(MouseEvent e) {
                    int fila = buscausu.getJTablaBuscarusuario().rowAtPoint(e.getPoint());
                    int colum = buscausu.getJTablaBuscarusuario().columnAtPoint(e.getPoint());
                    modusu.setDoc(Integer.parseInt(buscausu.getJTablaBuscarusuario().getValueAt(fila, 0).toString()));

                    if (colum == 9) {
                        buscausu.setVisible(false);
                        factnuev.setVisible(true);
                        Object idusua = modusu.getDoc();
                        factnuev.getTxtidentiusufactcomp().setText(idusua.toString());
                        JOptionPane.showMessageDialog(null, "Usuario Agregado");
                    }
                }
            });
            factnuev.setVisible(false);
            buscausu.setLocationRelativeTo(null);
            modusu.mostrarTablaUsuario(buscausu.getJTablaBuscarusuario(), "", "");
            buscausu.setVisible(true);
//            Border borde = BorderFactory.createTitledBorder(null, "Buscar Usuario",
//                    javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION,
//                    new java.awt.Font("Yu Gothic UI", 1, 36),
//                    new java.awt.Color(204, 0, 204));
//            buscausu.getJPanelbucarusuario().setBorder(borde);
        }
        if (e.getSource().equals(factnuev.getBtnbuscarproveedor())) {
            buscausu.getJTablaBuscarusuario().addMouseListener(new MouseAdapter() {
                public void mouseClicked(MouseEvent e) {
                    int fila = buscausu.getJTablaBuscarusuario().rowAtPoint(e.getPoint());
                    int colum = buscausu.getJTablaBuscarusuario().columnAtPoint(e.getPoint());
                    modprovee.setDoc(Integer.parseInt(buscausu.getJTablaBuscarusuario().getValueAt(fila, 0).toString()));

                    if (colum == 9) {
                        buscausu.setVisible(false);
                        factnuev.setVisible(true);
                        Object idusua = modprovee.getDoc();
                        factnuev.getTxtidentiprovefact().setText(idusua.toString());
                        JOptionPane.showMessageDialog(null, "Proveedor Agregado");
                    }
                }
            });
            factnuev.setVisible(false);
            buscausu.setLocationRelativeTo(null);
            modprovee.mostrarTablaProveedor(buscausu.getJTablaBuscarusuario(), "", "");
            buscausu.setVisible(true);
            Border borde = BorderFactory.createTitledBorder(null, "Buscar Proveedor",
                    javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION,
                    new java.awt.Font("Yu Gothic UI", 1, 36),
                    new java.awt.Color(204, 0, 204));
            buscausu.getJPanelbucarusuario().setBorder(borde);

        }

        if (e.getSource().equals(factnuev.getBtncancelarfactcomp())) {
            factnuev.dispose();
        }
    }

}

