package Controlador;

import Modelo.ModeloUsuario;
import Vista.Nuevo_Usuario;
import Vista.Principal;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Date;
import java.util.Map;
import javax.swing.BorderFactory;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.border.Border;

public class ControladorUsuario implements ActionListener {

    Nuevo_Usuario usu = new Nuevo_Usuario();
    Principal prin = new Principal();
    ModeloUsuario modusuario = new ModeloUsuario();

    //constructor
    public ControladorUsuario() {
        usu.getBtnGuardar().addActionListener(this);
        usu.getBtnvista().addActionListener(this);
        usu.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        usu.addWindowListener(new WindowAdapter() {
            public void windowClosed(WindowEvent e) {
                ControladorPrincipal princ = new ControladorPrincipal();
                princ.iniciarPrincipal(0);
            }
        });
    }

    public void controlUsuario() {
        prin.setVisible(false);
        usu.setLocationRelativeTo(null);
        usu.setTitle("Nuevo Usuario");
        usu.setVisible(true);

        //lleno combo box sexo
        usu.getCmbSexo().addItem("Seleccione...");
        Map<String, Integer> combosexo = modusuario.llenarCombo("sexo");
        for (String sexo : combosexo.keySet()) {
            usu.getCmbSexo().addItem(sexo);
        }
        //lleno combo box rol
        usu.getCmbrol().addItem("Seleccione...");
        Map<String, Integer> comborol = modusuario.llenarCombo("rol");
        for (String rol : comborol.keySet()) {
            usu.getCmbrol().addItem(rol);
        }
    }

    //Metodo adstracto
    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource().equals(usu.getBtnvista())) {

            if (usu.getPssContrase().getEchoChar() == '\u2022') {
                usu.getPssContrase().setEchoChar((char) 0);
                usu.getBtnvista().setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/ojo-cruzado.png")));
            } else {
                usu.getPssContrase().setEchoChar('\u2022');
                usu.getBtnvista().setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/ojo.png")));
            }
        }
        if (e.getSource().equals(usu.getBtnGuardar())) {
            //validar campos vacios
            if ((usu.getTxtDocumento().getText().isEmpty()) || (usu.getCmbtipodocu().getSelectedItem().equals("Seleccione...")) || (usu.getTxtNombre().getText().isEmpty()) || (usu.getTxtDire().getText().isEmpty())
                    || (usu.getTxtCorreo().getText().isEmpty()) || (usu.getTxtLogin().getText().isEmpty()) || (usu.getTxtTele().getText().isEmpty())
                    || (usu.getPssContrase().getPassword() == null) || (usu.getJdcfechanaci().getDate() == null) || (usu.getCmbrol().getSelectedItem().equals("Seleccione..."))
                    || (usu.getCmbSexo().getSelectedItem().equals("Seleccione..."))) {
                JOptionPane.showMessageDialog(null, "Debe ingresar información en todos los campos");
            } else {
                //Convertimos el dato de los combox al que entiende sql
                String valorSexo = usu.getCmbSexo().getSelectedItem().toString();
                int sexo = modusuario.llenarCombo("sexo").get(valorSexo);
                String valorRol = usu.getCmbrol().getSelectedItem().toString();
                int rol = modusuario.llenarCombo("rol").get(valorRol);

                // seleccion de fecha, cambia al formato de fecha al que entiende sql
                java.util.Date fec = usu.getJdcfechanaci().getDate();
                long fe = fec.getTime();
                java.sql.Date fecha = new Date(fe);

                //Contraseña
                char[] contra = usu.getPssContrase().getPassword();
                String contrasena = String.valueOf(contra);

                modusuario.setDoc(Integer.parseInt(usu.getTxtDocumento().getText()));
                modusuario.setTipo_doc(usu.getCmbtipodocu().getSelectedItem().toString());
                modusuario.setNom(usu.getTxtNombre().getText());
                modusuario.setDire(usu.getTxtDire().getText());
                modusuario.setCorreo(usu.getTxtCorreo().getText());
                modusuario.setTele(usu.getTxtTele().getText());
                modusuario.setLog(usu.getTxtLogin().getText());
                modusuario.setFec(fecha);
                modusuario.setContra(contrasena);
                modusuario.setSex(sexo);
                modusuario.setRol(rol);

                if (usu.getBtnGuardar().getText().equals("Guardar")) {
                    modusuario.insertarUsuario();
                    modusuario.limpiar(usu.getUsuarios().getComponents());
                } else {
                    modusuario.actualizarUsuario();
                    usu.setVisible(false);
                    prin.setVisible(true);
                    modusuario.mostrarTablaUsuario(prin.getJtusuario(), "", "Usuario");
//                    prin.getTpPrincipal().setSelectedIndex(0);
                }

            }
        }

    }
//Actualizar Usuario

    void actualizarUsuario(int doc) {
        modusuario.buscarUsuario(doc);
        usu.getTxtDocumento().setEnabled(false);
        usu.getTxtLogin().setEnabled(false);
        usu.getCmbtipodocu().setEnabled(false);
        usu.getTxtDocumento().setText(String.valueOf(doc));
        usu.getTxtNombre().setText(modusuario.getNom());
        usu.getTxtTele().setText(modusuario.getTele());
        usu.getTxtCorreo().setText(modusuario.getCorreo());
        usu.getTxtDire().setText(modusuario.getDire());
        usu.getTxtLogin().setText(modusuario.getLog());
        usu.getPssContrase().setText(modusuario.getContra());
        usu.getJdcfechanaci().setDate(modusuario.getFec());

        //llenar Sexo
        Map<String, Integer> info = modusuario.llenarCombo("sexo");
        for (String sexo : info.keySet()) {
            usu.getCmbSexo().addItem(sexo);
        }
        //obtener el valor de la base de datos
        String valoSexo = modusuario.obtenerSeleccion(info, modusuario.getSex());
        usu.getCmbSexo().setSelectedItem(valoSexo);

        //llenar Rol
        Map<String, Integer> info2 = modusuario.llenarCombo("rol");
        for (String rol : info2.keySet()) {
            usu.getCmbrol().addItem(rol);
        }

        //obtener el valor de la base de datos
        String valoRol = modusuario.obtenerSeleccion(info, modusuario.getRol());
        usu.getCmbrol().setSelectedItem(valoRol);

        //Llenar tipo de documento
        usu.getCmbtipodocu().setSelectedItem(modusuario.getTipo_doc());

        //Cambiar Titulo
        Border borde = BorderFactory.createTitledBorder(null, "Actualizar Usuario",
                javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION,
                new java.awt.Font("Yu Gothic UI", 1, 36),
                new java.awt.Color(204, 0, 204));
        usu.getUsuarios().setBorder(borde);
        prin.setVisible(false);
        usu.setLocationRelativeTo(null);
        usu.getBtnGuardar().setText("Actualizar");
        usu.setVisible(true);

    }
//Eliminar Usuario

    void eliminarUsuario(int doc) {
        int resp = JOptionPane.showConfirmDialog(null, "¿Desea eliminar al usuario? \n" + doc,
                 "Eliminar Usuario", JOptionPane.YES_OPTION);
        if (resp == JOptionPane.YES_OPTION) {
            modusuario.setDoc(doc);
            modusuario.eliminarUsuario();
        }
     }

}
