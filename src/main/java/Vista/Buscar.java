/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package Vista;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTable;
import javax.swing.JTextField;

/**
 *
 * @author SENA
 */
public class Buscar extends javax.swing.JFrame {

    /**
     * Creates new form Buscar_Usuario
     */
    public Buscar() {
        initComponents();
    }

    public JPanel getJPanelbucarusuario() {
        return JPanelbucarusuario;
    }

    public void setJPanelbucarusuario(JPanel JPanelbucarusuario) {
        this.JPanelbucarusuario = JPanelbucarusuario;
    }

    public JTable getJTablaBuscarusuario() {
        return JTablaBuscarusuario;
    }

    public void setJTablaBuscarusuario(JTable JTablaBuscarusuario) {
        this.JTablaBuscarusuario = JTablaBuscarusuario;
    }

    public JTextField getTxtbuscar() {
        return txtbuscar;
    }

    public void setTxtbuscar(JTextField txtbuscar) {
        this.txtbuscar = txtbuscar;
    }


    public JLabel getLblTitulo() {
        return lblTitulo;
    }

    public void setLblTitulo(JLabel lblTitulo) {
        this.lblTitulo = lblTitulo;
    }  

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        JPanelbucarusuario = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        JTablaBuscarusuario = new javax.swing.JTable();
        txtbuscar = new javax.swing.JTextField();
        lblTitulo = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        JPanelbucarusuario.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Buscar Factura", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Yu Gothic UI", 1, 36), new java.awt.Color(0, 153, 153))); // NOI18N

        JTablaBuscarusuario.setFont(new java.awt.Font("Yu Gothic UI", 0, 18)); // NOI18N
        JTablaBuscarusuario.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {},
                {},
                {},
                {}
            },
            new String [] {

            }
        ));
        jScrollPane1.setViewportView(JTablaBuscarusuario);

        txtbuscar.setFont(new java.awt.Font("Yu Gothic UI", 0, 18)); // NOI18N
        txtbuscar.setForeground(new java.awt.Color(204, 204, 204));
        txtbuscar.setText("Buscar ");

        lblTitulo.setFont(new java.awt.Font("Yu Gothic UI", 1, 24)); // NOI18N
        lblTitulo.setForeground(new java.awt.Color(0, 153, 153));
        lblTitulo.setText("Usuario");

        javax.swing.GroupLayout JPanelbucarusuarioLayout = new javax.swing.GroupLayout(JPanelbucarusuario);
        JPanelbucarusuario.setLayout(JPanelbucarusuarioLayout);
        JPanelbucarusuarioLayout.setHorizontalGroup(
            JPanelbucarusuarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(JPanelbucarusuarioLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(JPanelbucarusuarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 890, Short.MAX_VALUE)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, JPanelbucarusuarioLayout.createSequentialGroup()
                        .addComponent(lblTitulo)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(txtbuscar, javax.swing.GroupLayout.PREFERRED_SIZE, 271, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );
        JPanelbucarusuarioLayout.setVerticalGroup(
            JPanelbucarusuarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, JPanelbucarusuarioLayout.createSequentialGroup()
                .addGap(0, 7, Short.MAX_VALUE)
                .addGroup(JPanelbucarusuarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtbuscar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblTitulo))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 331, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(JPanelbucarusuario, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(JPanelbucarusuario, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    /**
     * @param args the command line arguments
     */
    

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel JPanelbucarusuario;
    private javax.swing.JTable JTablaBuscarusuario;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JLabel lblTitulo;
    private javax.swing.JTextField txtbuscar;
    // End of variables declaration//GEN-END:variables
}
