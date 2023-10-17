package Controlador;

import Modelo.ModeloLogin;
import Vista.Iniciar_Sesion;
import Vista.Principal;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;

public class ControladorLogin implements ActionListener {

    ModeloLogin modlog = new ModeloLogin();
    Iniciar_Sesion ini = new Iniciar_Sesion();
    Principal prin = new Principal();
    ControladorPrincipal controprin = new ControladorPrincipal();

    public ControladorLogin() {
        ini.getBtnIniciar().addActionListener(this);
        ini.getBtnMostrar().addActionListener(this);
    }
    
    public void iniciarVista(){
        ini.setLocationRelativeTo(null);//Centrando la Vista
        ini.setTitle("Iniciar Sesión");//Titulo a la vista
        ini.setVisible(true);//Visible la vista
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource().equals(ini.getBtnMostrar())) {

            if (ini.getJpContrasena().getEchoChar() == '\u2022') {
                ini.getJpContrasena().setEchoChar((char) 0);
                ini.getBtnMostrar().setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/ojo-cruzado.png")));
            }else{
                ini.getJpContrasena().setEchoChar('\u2022');
                ini.getBtnMostrar().setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/ojo.png")));
            }
        }
        if (e.getSource()==(ini.getBtnIniciar())){
           modlog.setUsuario(ini.getTxtUsuar().getText());
           String pass = new String(ini.getJpContrasena().getPassword());
           modlog.setContrasena(pass);
           if(modlog.validar(modlog.getUsuario(), modlog.getContrasena())){
               ini.setVisible(false);
               controprin.iniciarPrincipal();
           }else{
               JOptionPane.showMessageDialog(null,"Usuario o Contraseña incorrecta");
           }
        }
    }

}
