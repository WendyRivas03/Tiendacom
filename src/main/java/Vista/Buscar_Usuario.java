/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package Vista;

import javax.swing.JPanel;
import javax.swing.JTable;
import javax.swing.JTextField;

/**
 *
 * @author SENA
 */
public class Buscar_Usuario extends javax.swing.JFrame {

    /**
     * Creates new form Buscar_Usuario
     */
    public Buscar_Usuario() {
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

    public JTextField getTxtbuscarusuario2() {
        return txtbuscarusuario2;
    }

    public void setTxtbuscarusuario2(JTextField txtbuscarusuario2) {
        this.txtbuscarusuario2 = txtbuscarusuario2;
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
        txtbuscarusuario2 = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        JPanelbucarusuario.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Buscar Usuario", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Yu Gothic UI", 1, 36), new java.awt.Color(0, 153, 153))); // NOI18N

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

        txtbuscarusuario2.setFont(new java.awt.Font("Yu Gothic UI", 0, 18)); // NOI18N
        txtbuscarusuario2.setForeground(new java.awt.Color(204, 204, 204));
        txtbuscarusuario2.setText("Buscar Usuario");

        javax.swing.GroupLayout JPanelbucarusuarioLayout = new javax.swing.GroupLayout(JPanelbucarusuario);
        JPanelbucarusuario.setLayout(JPanelbucarusuarioLayout);
        JPanelbucarusuarioLayout.setHorizontalGroup(
            JPanelbucarusuarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(JPanelbucarusuarioLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(JPanelbucarusuarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 890, Short.MAX_VALUE)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, JPanelbucarusuarioLayout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(txtbuscarusuario2, javax.swing.GroupLayout.PREFERRED_SIZE, 271, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );
        JPanelbucarusuarioLayout.setVerticalGroup(
            JPanelbucarusuarioLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, JPanelbucarusuarioLayout.createSequentialGroup()
                .addGap(0, 10, Short.MAX_VALUE)
                .addComponent(txtbuscarusuario2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
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
    private javax.swing.JTextField txtbuscarusuario2;
    // End of variables declaration//GEN-END:variables
}
