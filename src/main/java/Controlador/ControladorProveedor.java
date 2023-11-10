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
import javax.swing.BorderFactory;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.border.Border;

public class ControladorProveedor implements ActionListener {

    Nuevo_Proveedor provee = new Nuevo_Proveedor();
    Principal prin = new Principal();
    ModeloProveedor modproveedor = new ModeloProveedor();

    public ControladorProveedor() {
        provee.getBtnguardarprovee().addActionListener(this);
        provee.getBtncancelarprovee().addActionListener(this);
        provee.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        provee.addWindowListener(new WindowAdapter() {
            public void windowClosed(WindowEvent e) {
                ControladorPrincipal princ = new ControladorPrincipal();
                princ.iniciarPrincipal(0);
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
            if ((provee.getTxtdocuprovee().getText().isEmpty()) || (provee.getCmbtipodoc_prove().getSelectedItem().equals("Seleccione...")) || (provee.getTxtnomprovee().getText().isEmpty()) || (provee.getTxtdireprovee().getText().isEmpty())
                    || (provee.getTxtcorrprovee().getText().isEmpty()) || (provee.getTxtteleprovee().getText().isEmpty()) || (provee.getJdcfechaprovee().getDate() == null)
                    || (provee.getCmbtipersona().getSelectedItem().equals("Seleccione...")) || (provee.getCmbgeneprovee().getSelectedItem().equals("Seleccione..."))) {
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
                modproveedor.setTipo_docu(provee.getCmbtipodoc_prove().getSelectedItem().toString());
                modproveedor.setNom(provee.getTxtnomprovee().getText());
                modproveedor.setDire(provee.getTxtdireprovee().getText());
                modproveedor.setTipo_per(provee.getCmbtipersona().getSelectedItem().toString());
                modproveedor.setCorreo(provee.getTxtcorrprovee().getText());
                modproveedor.setTele(provee.getTxtteleprovee().getText());
                modproveedor.setFec(fecha);
                modproveedor.setSex(sexo);

                if (provee.getBtnguardarprovee().getText().equals("Guardar")) {
                    modproveedor.insertarProveedor();
                    modproveedor.limpiar(provee.getJpProvee().getComponents());
                } else {
                    modproveedor.actualizarProveedor();
                    provee.setVisible(false);
                    provee.dispose();
                    modproveedor.mostrarTablaProveedor(prin.getJtprovee(), "", "Proveedor");
//                    prin.getTpPrincipal().setSelectedIndex(0);
                }
            }
        }
        if (e.getSource().equals(provee.getBtncancelarprovee())) {
            provee.dispose();
        }
    }
    //Actualizar proveedor

    void actualizarProveedor(int doc) {
        modproveedor.buscarProveedor(doc);
        provee.getTxtdocuprovee().setEnabled(false);
        provee.getCmbtipodoc_prove().setEnabled(false);
        provee.getTxtdocuprovee().setText(String.valueOf(doc));
        provee.getTxtnomprovee().setText(modproveedor.getNom());
        provee.getTxtteleprovee().setText(modproveedor.getTele());
        provee.getTxtcorrprovee().setText(modproveedor.getCorreo());
        provee.getTxtdireprovee().setText(modproveedor.getDire());
        provee.getCmbtipersona().setEnabled(true);
        provee.getJdcfechaprovee().setDate(modproveedor.getFec());

        //llenar Sexo
        Map<String, Integer> info = modproveedor.llenarCombo("sexo");
        for (String sexo : info.keySet()) {
            provee.getCmbgeneprovee().addItem(sexo);
        }
        //obtener el valor de la base de datos
        String valoSexo = modproveedor.obtenerSeleccion(info, modproveedor.getSex());
        provee.getCmbgeneprovee().setSelectedItem(valoSexo);

        //Llenar tipo de documento y de persona
        provee.getCmbtipodoc_prove().setSelectedItem(modproveedor.getTipo_docu());
        provee.getCmbtipersona().setSelectedItem(modproveedor.getTipo_per());

        //Cambiar Titulo
        Border borde = BorderFactory.createTitledBorder(null, "Actualizar Proveedor",
                javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION,
                new java.awt.Font("Yu Gothic UI", 1, 36),
                new java.awt.Color(204, 0, 204));
        provee.getJpProvee().setBorder(borde);
        prin.setVisible(false);
        provee.setLocationRelativeTo(null);
        provee.getBtnguardarprovee().setText("Actualizar");
        provee.setVisible(true);
    }

    //Eliminar cliente
    void eliminarProveedor(int doc) {
        int resp = JOptionPane.showConfirmDialog(null, "¿Desea eliminar al Proveedor? \n" + doc,
                "Eliminar Proveedor", JOptionPane.YES_OPTION);
        if (resp == JOptionPane.YES_OPTION) {
            modproveedor.setDoc(doc);
            modproveedor.eliminarProveedor();
        }
    }
}
