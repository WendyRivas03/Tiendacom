package Controlador;

import Vista.Nuevo_Cliente;
import Vista.Nuevo_Proveedor;
import Vista.Nuevo_Usuario;
import Vista.Principal;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JFrame;

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
        prin.setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource().equals(prin.getBtnnuevo())) {
            prin.setVisible(false);
            controusu.controlUsuario();
        } 
        if (e.getSource().equals(prin.getBtnnueclien())){
                prin.setVisible(false);
                controcli.controlCliente();
        }
        if (e.getSource().equals(prin.getBtnnuevoprovee())){
            prin.setVisible(false);
            contropro.controlProveedor();
        }
    }
}
