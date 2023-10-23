package Controlador;

import Modelo.ModeloUsuario;
import Vista.Nuevo_Cliente;
import Vista.Nuevo_Proveedor;
import Vista.Nuevo_Usuario;
import Vista.Principal;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.JFrame;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

public class ControladorPrincipal implements ActionListener {

    Principal prin = new Principal();
    Nuevo_Usuario usu = new Nuevo_Usuario();
    Nuevo_Cliente cli = new Nuevo_Cliente();
    Nuevo_Proveedor provee = new Nuevo_Proveedor();
    ControladorUsuario controusu = new ControladorUsuario();
    ControladorCliente controcli = new ControladorCliente();
    ControladorProveedor contropro = new ControladorProveedor();

    public ControladorPrincipal() {
        prin.getBtnnuevo().addActionListener(this);
        prin.getBtnnueclien().addActionListener(this);
        prin.getBtnnuevoprovee().addActionListener(this);
        usu.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        cli.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        provee.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
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
        if (prin.getTpPrincipal().getSelectedIndex() == 0) {
            modusu.mostrarTablaUsuario(prin.getJtusuario(), "");
        }
        prin.getTpPrincipal().addChangeListener(new ChangeListener() {

            @Override
            public void stateChanged(ChangeEvent e) {

            }
        });
        
        prin.getJtfusuario().addMouseListener(new MouseAdapter(){
            @Override
            public void mouseClicked(MouseEvent e){
                prin.getJtfusuario().setText("");
                prin.getJtfusuario().setForeground (new java.awt.Color(0, 0, 0));
            }
        }); 

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
    }
}
