package Controlador;

import Modelo.ModeloLogin;
import Vista.Iniciar_Sesion;
//import Vista.Principal;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import javax.swing.JOptionPane;

public class ControladorLogin implements ActionListener {

    ModeloLogin modlog = new ModeloLogin();
    Iniciar_Sesion ini = new Iniciar_Sesion();
//    Principal prin = new Principal();
    ControladorPrincipal controprin = new ControladorPrincipal();

    public ControladorLogin() {
        ini.getBtnIniciar().addActionListener(this);
        ini.getBtnMostrar().addActionListener(this);

        ini.getJpContrasena().addFocusListener(new FocusAdapter() {
            @Override
            public void focusLost(FocusEvent e) {
                ini.getBtnIniciar().requestFocus();
            }
        });
        ini.getBtnIniciar().addKeyListener(new KeyAdapter() {
            @Override
            public void keyPressed(KeyEvent e) {
                if (e.getKeyCode() == KeyEvent.VK_ENTER) {
                    iniciar();
                }
            }
        });
    }

    public void iniciar() {
        modlog.setUsuario(ini.getTxtUsuar().getText());
        String pass = new String(ini.getJpContrasena().getPassword());
        modlog.setContrasena(pass);
        if (modlog.validar(modlog.getUsuario(), modlog.getContrasena())) {
            ini.setVisible(false);
            controprin.iniciarPrincipal(0);
        } else {
            JOptionPane.showMessageDialog(null, "Usuario o Contraseña incorrecta");
        }
    }

    public void iniciarVista() {
        ini.setLocationRelativeTo(null);//Centrando la Vista
        ini.setTitle("Iniciar Sesión");//Titulo a la vista
        ini.setVisible(true);//Visible la vista
        ini.getBtnIniciar().requestFocus();
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource().equals(ini.getBtnMostrar())) {

            if (ini.getJpContrasena().getEchoChar() == '\u2022') {
                ini.getJpContrasena().setEchoChar((char) 0);
                ini.getBtnMostrar().setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/ojo-cruzado.png")));
            } else {
                ini.getJpContrasena().setEchoChar('\u2022');
                ini.getBtnMostrar().setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/ojo.png")));
            }
        }
        if (e.getSource() == (ini.getBtnIniciar())) {
            iniciar();
        }
    }

}
