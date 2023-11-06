package Controlador;

import Modelo.ModeloProducto;
import Vista.Nuevo_Producto;
import Vista.Principal;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.File;
import javax.swing.JFrame;

public class ControladorProducto implements ActionListener {

    Nuevo_Producto pro = new Nuevo_Producto();
    Principal prin = new Principal();
    ModeloProducto modproduc = new ModeloProducto();

    public ControladorProducto() {
        pro.getBtnbuscarimagen().addActionListener(this);
        pro.getBtnguardproduct().addActionListener(this);
        pro.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        pro.addWindowListener(new WindowAdapter() {
            public void windowClosed(WindowEvent e) {
                ControladorPrincipal princ = new ControladorPrincipal();
                princ.iniciarPrincipal(0);
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
        
        if(e.getSource().equals(pro.getBtnbuscarimagen())){
            modproduc.buscarImagen();
            File file= new File(modproduc.getRuta());
            String archivo= file.getName();//obtiene solo el nombre de la ruta
            pro.getTxtimagenproduc().setText(archivo);
        }
        if(e.getSource().equals(pro.getBtnguardproduct())){
            modproduc.setNom(pro.getTxtnombreproduc().getText());
            modproduc.setDescri(pro.getTexareadescripproduct().getText());
            modproduc.setImagen(modproduc.convertirImagen(modproduc.getRuta()));
            modproduc.insertarProducto();
            modproduc.limpiar(pro.get)
        }

    }

}
