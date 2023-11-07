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
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class ControladorCliente implements ActionListener {

    Nuevo_Cliente cli = new Nuevo_Cliente();
    Principal prin = new Principal();
    ModeloCliente modcliente = new ModeloCliente();

    public ControladorCliente() {
        cli.getBtnguardarcli().addActionListener(this);
        cli.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        cli.addWindowListener(new WindowAdapter() {
            public void windowClosed(WindowEvent e) {
                ControladorPrincipal princ = new ControladorPrincipal();
                princ.iniciarPrincipal(0);
            }
        });
    }

    public void controlCliente(){
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
            if ((cli.getTxtdocucli().getText().isEmpty()) ||(cli.getCmbtipodocu_cli().getSelectedItem().equals("Seleccione..."))|| (cli.getTxtnomcli().getText().isEmpty()) || (cli.getTxtdirecli().getText().isEmpty())
                    || (cli.getTxtcorrcli().getText().isEmpty()) || (cli.getTxttelecli().getText().isEmpty())|| (cli.getJdcfechacli().getDate() == null) 
                    || (cli.getCmbgenecli().getSelectedItem().equals("Seleccione..."))) {
                JOptionPane.showMessageDialog(null, "Debe ingresar información en todos los campos");
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
                modcliente.insertarCliente();
                modcliente.limpiar(cli.getCliente().getComponents());
                
                if (cli.getBtnguardarcli().getText().equals("Guardar")) {
                    modcliente.insertarCliente();
                    modcliente.limpiar(cli.getCliente().getComponents());
                } else {
//                    modcliente.actualizarUsuario();
//                    usu.setVisible(false);
//                    prin.setVisible(true);
                    modcliente.mostrarTablaCliente(prin.getJtcliente(), "", "Cliente");
//                    prin.getTpPrincipal().setSelectedIndex(0);
                }
            }
        }
    }

    //Actualizar cliente
    void actualizarCliente(int doc) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
//Eliminar cliente
    void eliminarCliente(int doc) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
