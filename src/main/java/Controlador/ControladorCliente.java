package Controlador;

import Modelo.ModeloCliente;
import Vista.Nuevo_Cliente;
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

public class ControladorCliente implements ActionListener {

    Nuevo_Cliente cli = new Nuevo_Cliente();
    Principal prin = new Principal();
    ModeloCliente modcliente = new ModeloCliente();

    public ControladorCliente() {
        cli.getBtnguardarcli().addActionListener(this);
        cli.getBtncancelarcli().addActionListener(this);
        cli.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        cli.addWindowListener(new WindowAdapter() {
            public void windowClosed(WindowEvent e) {
                ControladorPrincipal princ = new ControladorPrincipal();
                princ.iniciarPrincipal(1);
            }
        });
    }

    public void controlCliente() {
        prin.setVisible(false);
        cli.setLocationRelativeTo(null);
        cli.setTitle("Nuevo Cliente");
        cli.setVisible(true);

        //lleno combo box sexo
        cli.getCmbgenecli().addItem("Seleccione...");
        Map<String, Integer> combosexo = modcliente.llenarCombo("sexo");
        for (String sexo : combosexo.keySet()) {
            cli.getCmbgenecli().addItem(sexo);
        }
    }

    @Override
    public void actionPerformed(ActionEvent e) {

        if (e.getSource().equals(cli.getBtnguardarcli())) {
            //validar campos vacios
            if ((cli.getTxtdocucli().getText().isEmpty()) || (cli.getCmbtipodocu_cli().getSelectedItem().equals("Seleccione...")) || (cli.getTxtnomcli().getText().isEmpty()) || (cli.getTxtdirecli().getText().isEmpty())
                    || (cli.getTxtcorrcli().getText().isEmpty()) || (cli.getTxttelecli().getText().isEmpty()) || (cli.getJdcfechacli().getDate() == null)
                    || (cli.getCmbgenecli().getSelectedItem().equals("Seleccione..."))) {
                JOptionPane.showMessageDialog(null, "Debe ingresar información en todos los campos");
            } else {
                ControladorPrincipal controprin = new ControladorPrincipal();
                if (controprin.modificadorAccesoCorreo(cli.getTxtcorrcli().getText()) == false) {
                    JOptionPane.showMessageDialog(null, "Correo Invalido");
                } else {
                    //Convertimos el dato de los combox al que entiende sql
                    String valorSexo = cli.getCmbgenecli().getSelectedItem().toString();
                    int sexo = modcliente.llenarCombo("sexo").get(valorSexo);

                    // seleccion de fecha, cambia al formato de fecha al que entiende sql
                    java.util.Date fec = cli.getJdcfechacli().getDate();
                    long fe = fec.getTime();
                    java.sql.Date fecha = new Date(fe);

                    modcliente.setDoc(Integer.parseInt(cli.getTxtdocucli().getText()));
                    modcliente.setTipo_doc(cli.getCmbtipodocu_cli().getSelectedItem().toString());
                    modcliente.setNom(cli.getTxtnomcli().getText());
                    modcliente.setTele(cli.getTxttelecli().getText());
                    modcliente.setCorreo(cli.getTxtcorrcli().getText());
                    modcliente.setDire(cli.getTxtdirecli().getText());
                    modcliente.setSex(sexo);
                    modcliente.setFec(fecha);

                    if (cli.getBtnguardarcli().getText().equals("Guardar")) {
                        modcliente.insertarCliente();
                        modcliente.limpiar(cli.getCliente().getComponents());
                        cli.dispose();
                    } else {
                        modcliente.actualizarCliente();
                        cli.setVisible(false);
                        cli.dispose();
                        modcliente.mostrarTablaCliente(prin.getJtcliente(), "", "Cliente");
//                    prin.getTpPrincipal().setSelectedIndex(0);
                    }
                }
            }

            if (e.getSource().equals(cli.getBtncancelarcli())) {
                cli.dispose();
            }
        }
    }

//Actualizar cliente
    void actualizarCliente(int doc) {
        modcliente.buscarCliente(doc);
        cli.getTxtdocucli().setEnabled(false);
        cli.getCmbtipodocu_cli().setEnabled(false);
        cli.getTxtdocucli().setText(String.valueOf(doc));
        cli.getTxtnomcli().setText(modcliente.getNom());
        cli.getTxttelecli().setText(modcliente.getTele());
        cli.getTxtcorrcli().setText(modcliente.getCorreo());
        cli.getTxtdirecli().setText(modcliente.getDire());
        cli.getJdcfechacli().setDate(modcliente.getFec());

        //llenar Sexo
        Map<String, Integer> info = modcliente.llenarCombo("sexo");
        for (String sexo : info.keySet()) {
            cli.getCmbgenecli().addItem(sexo);
        }
        //obtener el valor de la base de datos
        String valoSexo = modcliente.obtenerSeleccion(info, modcliente.getSex());
        cli.getCmbgenecli().setSelectedItem(valoSexo);

        //Llenar tipo de documento
        cli.getCmbtipodocu_cli().setSelectedItem(modcliente.getTipo_doc());

        //Cambiar Titulo
        Border borde = BorderFactory.createTitledBorder(null, "Actualizar Cliente",
                javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION,
                new java.awt.Font("Yu Gothic UI", 1, 36),
                new java.awt.Color(204, 0, 204));
        cli.getCliente().setBorder(borde);
        prin.setVisible(false);
        cli.setLocationRelativeTo(null);
        cli.getBtnguardarcli().setText("Actualizar");
        cli.setVisible(true);
    }
//Eliminar cliente

    void eliminarCliente(int doc) {
        int resp = JOptionPane.showConfirmDialog(null, "¿Desea eliminar al Cliente? \n" + doc,
                "Eliminar Cliente", JOptionPane.YES_OPTION);
        if (resp == JOptionPane.YES_OPTION) {
            modcliente.setDoc(doc);
            modcliente.eliminarCliente();
        }
    }
}
