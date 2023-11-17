package Controlador;

import Modelo.ModeloProducto;
import Vista.Nuevo_Producto;
import Vista.Principal;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.File;
import javax.swing.BorderFactory;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.border.Border;

public class ControladorProducto implements ActionListener {

    Nuevo_Producto pro = new Nuevo_Producto();
    Principal prin = new Principal();
    ModeloProducto modproduc = new ModeloProducto();

    public ControladorProducto() {
        pro.getBtnbuscarimagen().addActionListener(this);
        pro.getBtnguardproduct().addActionListener(this);
        pro.getBtncancelarproduc().addActionListener(this);
        pro.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        pro.addWindowListener(new WindowAdapter() {
            public void windowClosed(WindowEvent e) {
                ControladorPrincipal princ = new ControladorPrincipal();
                princ.iniciarPrincipal(3);
            }
        });
    }

    public void controlProducto() {
        prin.setVisible(false);
        pro.setLocationRelativeTo(null);
        pro.setTitle("Nuevo Producto");
        pro.setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {

        if (e.getSource().equals(pro.getBtnbuscarimagen())) {
            modproduc.buscarImagen();
        }

        if (e.getSource().equals(pro.getBtnguardproduct())) {
            //validar campos vacios
            if ((pro.getTxtnombreproduc().getText().isEmpty()) || (pro.getTexareadescripproduct().getText().isEmpty())) {
                JOptionPane.showMessageDialog(null, "Debe ingresar información en los campos de Nombre y Descripción");
            } else {
                modproduc.setNom(pro.getTxtnombreproduc().getText());
                modproduc.setDescri(pro.getTexareadescripproduct().getText());
                modproduc.setImagen(modproduc.convertirImagen(modproduc.getRuta()));

                if (pro.getBtnguardproduct().getText().equals("Guardar")) {
                    modproduc.insertarProducto();
                    modproduc.limpiar(pro.getPanelProducto().getComponents());
                } else {
                    modproduc.actualizarProducto();
                    pro.setVisible(false);
                    pro.dispose();
                    modproduc.mostrarTablaProducto(prin.getTablaProducto(), "", "Producto");
                }
            }
        }
        if (e.getSource().equals(pro.getBtncancelarproduc())) {
            pro.dispose();
        }
    }

    //Actualizar producto
    void actualizarProducto(int doc) {
        modproduc.buscarProducto(doc);
        pro.getTxtnombreproduc().setText(modproduc.getNom());
        pro.getTexareadescripproduct().setText(modproduc.getDescri());
        pro.getTxtimagenproduc().setText(modproduc.getRuta());

        File file = new File(modproduc.getRuta());
        String archivo = file.getName();//obtiene solo el nombre de la ruta
        pro.getTxtimagenproduc().setText(archivo);

        //Cambiar Titulo
        Border borde = BorderFactory.createTitledBorder(null, "Actualizar Producto",
                javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION,
                new java.awt.Font("Yu Gothic UI", 1, 36),
                new java.awt.Color(204, 0, 204));
        pro.getPanelProducto().setBorder(borde);
        prin.setVisible(false);
        pro.setLocationRelativeTo(null);
        pro.getBtnguardproduct().setText("Actualizar");
        pro.setVisible(true);
    }

    //Eliminar cliente
    void eliminarProducto(int doc) {
        int resp = JOptionPane.showConfirmDialog(null, "¿Desea eliminar el Producto? \n" + doc,
                "Eliminar Producto", JOptionPane.YES_OPTION);
        if (resp == JOptionPane.YES_OPTION) {
            modproduc.setDoc(doc);
            modproduc.eliminarProducto();
        }
    }
}
