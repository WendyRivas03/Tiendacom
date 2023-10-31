
package Modelo;

import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;


public class ModeloProducto {
    private String nom, descri,img;
    private byte imagen[];

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDescri() {
        return descri;
    }

    public void setDescri(String descri) {
        this.descri = descri;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }
    
    //BUSCAR IMAGEN
    public void buscarImagen(){
        JFileChooser archivos = new JFileChooser();
        FileNameExtensionFilter filtro = new FileNameExtensionFilter(
        "JPG,PNG & GIF","jpg", "png","gif");
        archivos.setFileFilter(filtro);
        
        if(archivos.showOpenDialog(null)==JFileChooser.APPROVE_OPTION){
            setImg(archivos.getSelectedFile().getAbsolutePath());
        }
        
    }
    
}
