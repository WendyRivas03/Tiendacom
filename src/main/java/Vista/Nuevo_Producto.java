/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package Vista;

import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;

/**
 *
 * @author SENA
 */
public class Nuevo_Producto extends javax.swing.JFrame {

    /**
     * Creates new form Nuevo_Producto
     */
    public Nuevo_Producto() {
        initComponents();
    }

    public JButton getBtnbuscarimagen() {
        return btnbuscarimagen;
    }

    public void setBtnbuscarimagen(JButton btnbuscarimagen) {
        this.btnbuscarimagen = btnbuscarimagen;
    }

    public JButton getBtncancelarproduc() {
        return btncancelarproduc;
    }

    public void setBtncancelarproduc(JButton btncancelarproduc) {
        this.btncancelarproduc = btncancelarproduc;
    }

    public JButton getBtnguardproduct() {
        return btnguardproduct;
    }

    public void setBtnguardproduct(JButton btnguardproduct) {
        this.btnguardproduct = btnguardproduct;
    }

    public JTextArea getTexareadescripproduct() {
        return texareadescripproduct;
    }

    public void setTexareadescripproduct(JTextArea texareadescripproduct) {
        this.texareadescripproduct = texareadescripproduct;
    }

    public JTextField getTxtimagenproduc() {
        return txtimagenproduc;
    }

    public void setTxtimagenproduc(JTextField txtimagenproduc) {
        this.txtimagenproduc = txtimagenproduc;
    }

    public JTextField getTxtnombreproduc() {
        return txtnombreproduc;
    }

    public void setTxtnombreproduc(JTextField txtnombreproduc) {
        this.txtnombreproduc = txtnombreproduc;
    }

    public JPanel getPanelProducto() {
        return PanelProducto;
    }

    public void setPanelProducto(JPanel PanelProducto) {
        this.PanelProducto = PanelProducto;
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        PanelProducto = new javax.swing.JPanel();
        lblnombreproduc = new javax.swing.JLabel();
        lbldescripcionproduc = new javax.swing.JLabel();
        lblimagenproduc = new javax.swing.JLabel();
        btnguardproduct = new javax.swing.JButton();
        btncancelarproduc = new javax.swing.JButton();
        txtnombreproduc = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        texareadescripproduct = new javax.swing.JTextArea();
        txtimagenproduc = new javax.swing.JTextField();
        btnbuscarimagen = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        PanelProducto.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Nuevo Producto", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Yu Gothic UI", 1, 36), new java.awt.Color(0, 153, 153))); // NOI18N

        lblnombreproduc.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblnombreproduc.setForeground(new java.awt.Color(0, 153, 153));
        lblnombreproduc.setText("Nombre");

        lbldescripcionproduc.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lbldescripcionproduc.setForeground(new java.awt.Color(0, 153, 153));
        lbldescripcionproduc.setText("Descripcion");

        lblimagenproduc.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblimagenproduc.setForeground(new java.awt.Color(0, 153, 153));
        lblimagenproduc.setText("Imagen");

        btnguardproduct.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        btnguardproduct.setForeground(new java.awt.Color(0, 153, 153));
        btnguardproduct.setText("Guardar");

        btncancelarproduc.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        btncancelarproduc.setForeground(new java.awt.Color(0, 153, 153));
        btncancelarproduc.setText("Cancelar");

        txtnombreproduc.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        texareadescripproduct.setColumns(20);
        texareadescripproduct.setRows(5);
        jScrollPane1.setViewportView(texareadescripproduct);

        txtimagenproduc.setEditable(false);
        txtimagenproduc.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        btnbuscarimagen.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/buscar2.png"))); // NOI18N
        btnbuscarimagen.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnbuscarimagenActionPerformed(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(204, 0, 0));
        jLabel1.setText("*");

        jLabel2.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(204, 0, 0));
        jLabel2.setText("*");

        javax.swing.GroupLayout PanelProductoLayout = new javax.swing.GroupLayout(PanelProducto);
        PanelProducto.setLayout(PanelProductoLayout);
        PanelProductoLayout.setHorizontalGroup(
            PanelProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(PanelProductoLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(PanelProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(PanelProductoLayout.createSequentialGroup()
                        .addComponent(lblimagenproduc)
                        .addGroup(PanelProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(PanelProductoLayout.createSequentialGroup()
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 107, Short.MAX_VALUE)
                                .addComponent(btnguardproduct)
                                .addGap(30, 30, 30)
                                .addComponent(btncancelarproduc)
                                .addContainerGap(103, Short.MAX_VALUE))
                            .addGroup(PanelProductoLayout.createSequentialGroup()
                                .addGap(47, 47, 47)
                                .addComponent(txtimagenproduc, javax.swing.GroupLayout.PREFERRED_SIZE, 318, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(btnbuscarimagen)
                                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
                    .addGroup(PanelProductoLayout.createSequentialGroup()
                        .addGroup(PanelProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(lblnombreproduc)
                            .addComponent(lbldescripcionproduc))
                        .addGap(11, 11, 11)
                        .addGroup(PanelProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 367, Short.MAX_VALUE)
                            .addComponent(txtnombreproduc))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(PanelProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel1)
                            .addComponent(jLabel2))
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
        );
        PanelProductoLayout.setVerticalGroup(
            PanelProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(PanelProductoLayout.createSequentialGroup()
                .addGap(27, 27, 27)
                .addGroup(PanelProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lblnombreproduc)
                    .addComponent(txtnombreproduc, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1))
                .addGroup(PanelProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(PanelProductoLayout.createSequentialGroup()
                        .addGap(40, 40, 40)
                        .addComponent(lbldescripcionproduc))
                    .addGroup(PanelProductoLayout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(PanelProductoLayout.createSequentialGroup()
                        .addGap(36, 36, 36)
                        .addComponent(jLabel2)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 30, Short.MAX_VALUE)
                .addGroup(PanelProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(btnbuscarimagen, javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(PanelProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(lblimagenproduc)
                        .addComponent(txtimagenproduc, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(37, 37, 37)
                .addGroup(PanelProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnguardproduct)
                    .addComponent(btncancelarproduc))
                .addGap(21, 21, 21))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(PanelProducto, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(PanelProducto, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnbuscarimagenActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnbuscarimagenActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnbuscarimagenActionPerformed

    /**
     * @param args the command line arguments
     */


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel PanelProducto;
    private javax.swing.JButton btnbuscarimagen;
    private javax.swing.JButton btncancelarproduc;
    private javax.swing.JButton btnguardproduct;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JLabel lbldescripcionproduc;
    private javax.swing.JLabel lblimagenproduc;
    private javax.swing.JLabel lblnombreproduc;
    private javax.swing.JTextArea texareadescripproduct;
    private javax.swing.JTextField txtimagenproduc;
    private javax.swing.JTextField txtnombreproduc;
    // End of variables declaration//GEN-END:variables
}
