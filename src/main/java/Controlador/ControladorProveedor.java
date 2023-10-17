package Controlador;

import Modelo.ModeloProveedor;
import Vista.Nuevo_Proveedor;
import Vista.Principal;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Date;
import java.util.Map;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class ControladorProveedor implements ActionListener {

    Nuevo_Proveedor provee = new Nuevo_Proveedor();
    Principal prin = new Principal();
    ModeloProveedor modproveedor = new ModeloProveedor();

    public ControladorProveedor() {
        provee.getBtnguardarprovee().addActionListener(this);
        provee.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        provee.addWindowListener(new WindowAdapter() {
            public void windowClosed(WindowEvent e) {
                ControladorPrincipal princ = new ControladorPrincipal();
                princ.iniciarPrincipal();
            }
        });
    }

    public void controlProveedor() {
        prin.setVisible(false);
        provee.setLocationRelativeTo(null);
        provee.setTitle("Nuevo Proveedor");
        provee.setVisible(true);

        //lleno combo box sexo
        provee.getCmbgeneprovee().addItem("Seleccione...");
        Map<String, Integer> combosexo = modproveedor.llenarCombo("sexo");
        for (String sexo : combosexo.keySet()) {
            provee.getCmbgeneprovee().addItem(sexo);
        }
    }

    @Override
    public void actionPerformed(ActionEvent e) {
                if (e.getSource().equals(provee.getBtnguardarprovee())) {
            //validar campos vacios
            if ((provee.getTxtdocuprovee().getText().isEmpty()) || (provee.getTxtnomprovee().getText().isEmpty()) || (provee.getTxtdireprovee().getText().isEmpty())
                    || (provee.getTxtcorrprovee().getText().isEmpty()) || (provee.getTxtteleprovee().getText().isEmpty())|| (provee.getJdcfechaprovee().getDate() == null) 
                    || (provee.getTxttipo_per().getText().isEmpty()) ||(provee.getCmbgeneprovee().getSelectedItem().equals("Seleccione..."))) {
                JOptionPane.showMessageDialog(null, "Debe ingresar información en todos los campos");
            } else {
              //Convertimos el dato de los combox al que entiende sql
                String valorSexo = provee.getCmbgeneprovee().getSelectedItem().toString();
                int sexo = modproveedor.llenarCombo("sexo").get(valorSexo);
                
                // seleccion de fecha, cambia al formato de fecha al que entiende sql
                java.util.Date fec = provee.getJdcfechaprovee().getDate();
                long fe = fec.getTime();
                java.sql.Date fecha = new Date(fe);
                        
                modproveedor.setDoc(Integer.parseInt(provee.getTxtdocuprovee().getText()));
                modproveedor.setNom(provee.getTxtnomprovee().getText());
                modproveedor.setDire(provee.getTxtdireprovee().getText());
                modproveedor.setTipo_per(provee.getTxttipo_per().getText());
                modproveedor.setCorreo(provee.getTxtcorrprovee().getText());
                modproveedor.setTele(provee.getTxtteleprovee().getText());
                modproveedor.setFec(fecha);
                modproveedor.setSex(sexo);
                modproveedor.insertarProveedor();
                modproveedor.limpiar(provee.getJpProvee().getComponents());

            }
        }

    }

}
