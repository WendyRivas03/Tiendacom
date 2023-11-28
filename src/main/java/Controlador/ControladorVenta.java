package Controlador;

import Modelo.ModeloCliente;
import Modelo.ModeloUsuario;
import Modelo.ModeloVentas;
import Vista.Buscar;
import Vista.Buscar_Cliente;
import Vista.Nueva_Venta;
import Vista.Principal;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.BorderFactory;
import javax.swing.JFrame;
import javax.swing.border.Border;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

public class ControladorVenta implements ActionListener, DocumentListener {

    Nueva_Venta factventa = new Nueva_Venta();
    Principal prin = new Principal();
    Buscar buscarusu = new Buscar();
    Buscar_Cliente buscarcli = new Buscar_Cliente();
    ModeloUsuario modusu = new ModeloUsuario();
    ModeloCliente modclient = new ModeloCliente();
    ModeloVentas modventas = new ModeloVentas();

    //Constructor
    public ControladorVenta() {
        factventa.getBtnguardarventa().addActionListener(this);
        factventa.getBtncancelarventa().addActionListener(this);
        factventa.getBtnbuscarcliente().addActionListener(this);
        factventa.getBtnbuscarusuarioventa().addActionListener(this);
        buscarusu.getTxtbuscar().getDocument().addDocumentListener(this);
        buscarcli.getTxtbuscarcliente().getDocument().addDocumentListener(this);
        factventa.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);//Desactiva la x que cierra el programa para que permita abrir o volcer a la ventana principal
        factventa.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosed(WindowEvent e) {
                ControladorPrincipal princ = new ControladorPrincipal();
                princ.iniciarPrincipal(5);
            }
        });
    }

    public void controlVenta() {
        prin.setVisible(false);
        factventa.setLocationRelativeTo(null);
        factventa.setTitle("Nueva Venta");
        factventa.setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource().equals(factventa.getBtnbuscarcliente())) {
            factventa.setVisible(false);
            buscarcli.setLocationRelativeTo(null);
            modclient.mostrarTablaCliente(buscarcli.getJTablaBuscarcliente(), "", "Factura Venta");
            buscarcli.setVisible(true);
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
        }
    }

    @Override
    public void insertUpdate(DocumentEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void removeUpdate(DocumentEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void changedUpdate(DocumentEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
