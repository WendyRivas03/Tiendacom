package Controlador;

import Modelo.ModeloUsuario;
import Vista.Buscar_Usuario;
import Vista.Nueva_Factura_Compra;
import Vista.Principal;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.JFrame;

public class ControladorFacturaCompra implements ActionListener {

    Nueva_Factura_Compra factnuev = new Nueva_Factura_Compra();
    Principal prin = new Principal();
    Buscar_Usuario buscausu = new Buscar_Usuario();
    ModeloUsuario modusu = new ModeloUsuario();

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
            buscausu.setVisible(true);
            modusu.mostrarTablaUsuario(buscausu.getJTablaBuscarusuario(), "", "");
        }
        if (e.getSource().equals(factnuev.getBtncancelarfactcomp())) {
            factnuev.dispose();
        }
    }

}
