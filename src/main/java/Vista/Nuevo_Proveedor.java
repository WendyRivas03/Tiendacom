/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package Vista;

import com.toedter.calendar.JDateChooser;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JPanel;
import javax.swing.JTextField;

/**
 *
 * @author SENA
 */
public class Nuevo_Proveedor extends javax.swing.JFrame {

    /**
     * Creates new form Nuevo_Proveedor
     */
    public Nuevo_Proveedor() {
        initComponents();
    }

    public JButton getBtncancelarprovee() {
        return btncancelarprovee;
    }

    public void setBtncancelarprovee(JButton btncancelarprovee) {
        this.btncancelarprovee = btncancelarprovee;
    }

    public JButton getBtnguardarprovee() {
        return btnguardarprovee;
    }

    public void setBtnguardarprovee(JButton btnguardarprovee) {
        this.btnguardarprovee = btnguardarprovee;
    }

    public JComboBox<String> getCmbgeneprovee() {
        return cmbgeneprovee;
    }

    public void setCmbgeneprovee(JComboBox<String> cmbgeneprovee) {
        this.cmbgeneprovee = cmbgeneprovee;
    }

    public JDateChooser getJdcfechaprovee() {
        return jdcfechaprovee;
    }

    public void setJdcfechaprovee(JDateChooser jdcfechaprovee) {
        this.jdcfechaprovee = jdcfechaprovee;
    }

    public JTextField getTxtcorrprovee() {
        return txtcorrprovee;
    }

    public void setTxtcorrprovee(JTextField txtcorrprovee) {
        this.txtcorrprovee = txtcorrprovee;
    }

    public JTextField getTxtdireprovee() {
        return txtdireprovee;
    }

    public void setTxtdireprovee(JTextField txtdireprovee) {
        this.txtdireprovee = txtdireprovee;
    }

    public JTextField getTxtdocuprovee() {
        return txtdocuprovee;
    }

    public void setTxtdocuprovee(JTextField txtdocuprovee) {
        this.txtdocuprovee = txtdocuprovee;
    }

    public JComboBox<String> getCmbtipodoc_prove() {
        return cmbtipodoc_prove;
    }

    public void setCmbtipodoc_prove(JComboBox<String> cmbtipodoc_prove) {
        this.cmbtipodoc_prove = cmbtipodoc_prove;
    }

    public JTextField getTxtnomprovee() {
        return txtnomprovee;
    }

    public void setTxtnomprovee(JTextField txtnomprovee) {
        this.txtnomprovee = txtnomprovee;
    }

    public JTextField getTxtteleprovee() {
        return txtteleprovee;
    }

    public void setTxtteleprovee(JTextField txtteleprovee) {
        this.txtteleprovee = txtteleprovee;
    }

    public JComboBox<String> getCmbtipersona() {
        return cmbtipersona;
    }

    public void setCmbtipersona(JComboBox<String> cmbtipersona) {
        this.cmbtipersona = cmbtipersona;
    }

    public JPanel getJpProvee() {
        return jpProvee;
    }

    public void setJpProvee(JPanel jpProvee) {
        this.jpProvee = jpProvee;
    }

    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jpProvee = new javax.swing.JPanel();
        lbldocumento = new javax.swing.JLabel();
        txtdocuprovee = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        txtnomprovee = new javax.swing.JTextField();
        lblnombre = new javax.swing.JLabel();
        lbltelefono = new javax.swing.JLabel();
        txtteleprovee = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        txtcorrprovee = new javax.swing.JTextField();
        lblcorreo = new javax.swing.JLabel();
        lbldireccion = new javax.swing.JLabel();
        txtdireprovee = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        cmbgeneprovee = new javax.swing.JComboBox<>();
        lblgenero = new javax.swing.JLabel();
        lblfechanaci = new javax.swing.JLabel();
        jdcfechaprovee = new com.toedter.calendar.JDateChooser();
        jLabel11 = new javax.swing.JLabel();
        btncancelarprovee = new javax.swing.JButton();
        btnguardarprovee = new javax.swing.JButton();
        lbltipo_per = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        lbltipo_doc_prov = new javax.swing.JLabel();
        cmbtipersona = new javax.swing.JComboBox<>();
        jLabel9 = new javax.swing.JLabel();
        cmbtipodoc_prove = new javax.swing.JComboBox<>();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jpProvee.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Nuevo Proveedor", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Yu Gothic UI", 1, 36), new java.awt.Color(0, 153, 153))); // NOI18N

        lbldocumento.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lbldocumento.setForeground(new java.awt.Color(0, 153, 153));
        lbldocumento.setText("Documento");

        txtdocuprovee.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        jLabel1.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(204, 0, 0));
        jLabel1.setText("*");

        jLabel5.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel5.setForeground(new java.awt.Color(204, 0, 0));
        jLabel5.setText("*");

        txtnomprovee.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        lblnombre.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblnombre.setForeground(new java.awt.Color(0, 153, 153));
        lblnombre.setText("Nombre");

        lbltelefono.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lbltelefono.setForeground(new java.awt.Color(0, 153, 153));
        lbltelefono.setText("Teléfono");

        txtteleprovee.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        jLabel7.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel7.setForeground(new java.awt.Color(204, 0, 0));
        jLabel7.setText("*");

        jLabel3.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(204, 0, 0));
        jLabel3.setText("*");

        txtcorrprovee.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        lblcorreo.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblcorreo.setForeground(new java.awt.Color(0, 153, 153));
        lblcorreo.setText("Correo");

        lbldireccion.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lbldireccion.setForeground(new java.awt.Color(0, 153, 153));
        lbldireccion.setText("Dirección");

        txtdireprovee.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        jLabel4.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(204, 0, 0));
        jLabel4.setText("*");

        jLabel6.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel6.setForeground(new java.awt.Color(204, 0, 0));
        jLabel6.setText("*");

        cmbgeneprovee.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        lblgenero.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblgenero.setForeground(new java.awt.Color(0, 153, 153));
        lblgenero.setText("Género");

        lblfechanaci.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblfechanaci.setForeground(new java.awt.Color(0, 153, 153));
        lblfechanaci.setText("Fecha de Nacimiento");

        jLabel11.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel11.setForeground(new java.awt.Color(204, 0, 0));
        jLabel11.setText("*");

        btncancelarprovee.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        btncancelarprovee.setForeground(new java.awt.Color(0, 153, 153));
        btncancelarprovee.setText("Cancelar");

        btnguardarprovee.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        btnguardarprovee.setForeground(new java.awt.Color(0, 153, 153));
        btnguardarprovee.setText("Guardar");

        lbltipo_per.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lbltipo_per.setForeground(new java.awt.Color(0, 153, 153));
        lbltipo_per.setText("Tipo de persona");

        jLabel8.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel8.setForeground(new java.awt.Color(204, 0, 0));
        jLabel8.setText("*");

        lbltipo_doc_prov.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lbltipo_doc_prov.setForeground(new java.awt.Color(0, 153, 153));
        lbltipo_doc_prov.setText("Tipo de documento");

        cmbtipersona.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N
        cmbtipersona.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccione...", "Natural", "Juridica" }));
        cmbtipersona.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmbtipersonaActionPerformed(evt);
            }
        });

        jLabel9.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel9.setForeground(new java.awt.Color(204, 0, 0));
        jLabel9.setText("*");

        cmbtipodoc_prove.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N
        cmbtipodoc_prove.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccione...", "Nit", "Cédula" }));

        javax.swing.GroupLayout jpProveeLayout = new javax.swing.GroupLayout(jpProvee);
        jpProvee.setLayout(jpProveeLayout);
        jpProveeLayout.setHorizontalGroup(
            jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jpProveeLayout.createSequentialGroup()
                .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jpProveeLayout.createSequentialGroup()
                        .addGap(144, 144, 144)
                        .addComponent(btnguardarprovee)
                        .addGap(68, 68, 68)
                        .addComponent(btncancelarprovee))
                    .addGroup(jpProveeLayout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(jpProveeLayout.createSequentialGroup()
                                .addComponent(lbldocumento)
                                .addGap(140, 140, 140)
                                .addComponent(txtdocuprovee, javax.swing.GroupLayout.PREFERRED_SIZE, 253, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                .addComponent(txtnomprovee, javax.swing.GroupLayout.DEFAULT_SIZE, 253, Short.MAX_VALUE)
                                .addComponent(txtteleprovee)
                                .addComponent(txtcorrprovee)
                                .addComponent(txtdireprovee)))
                        .addGap(6, 6, 6)
                        .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel1)
                            .addComponent(jLabel9)
                            .addComponent(jLabel5)
                            .addComponent(jLabel3)
                            .addComponent(jLabel4)
                            .addComponent(jLabel7)))
                    .addGroup(jpProveeLayout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(lbldireccion)
                            .addComponent(lblcorreo)
                            .addComponent(lbltelefono)
                            .addComponent(lblnombre)
                            .addGroup(jpProveeLayout.createSequentialGroup()
                                .addComponent(lbltipo_doc_prov)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 74, Short.MAX_VALUE)
                                .addComponent(cmbtipodoc_prove, javax.swing.GroupLayout.PREFERRED_SIZE, 253, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(15, 15, 15))
                            .addGroup(jpProveeLayout.createSequentialGroup()
                                .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(lblfechanaci)
                                    .addComponent(lblgenero)
                                    .addComponent(lbltipo_per))
                                .addGap(65, 65, 65)
                                .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(cmbtipersona, 0, 254, Short.MAX_VALUE)
                                    .addComponent(jdcfechaprovee, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(cmbgeneprovee, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel8)
                                    .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                        .addComponent(jLabel6)
                                        .addComponent(jLabel11, javax.swing.GroupLayout.Alignment.TRAILING)))))))
                .addContainerGap(25, Short.MAX_VALUE))
        );
        jpProveeLayout.setVerticalGroup(
            jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jpProveeLayout.createSequentialGroup()
                .addGap(25, 25, 25)
                .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(lbldocumento)
                        .addComponent(txtdocuprovee, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jLabel1))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(lbltipo_doc_prov)
                    .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel9)
                        .addComponent(cmbtipodoc_prove, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 12, Short.MAX_VALUE)
                .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jpProveeLayout.createSequentialGroup()
                        .addComponent(txtnomprovee, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(13, 13, 13)
                        .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(lbltelefono)
                            .addComponent(txtteleprovee, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(lblcorreo)
                            .addComponent(txtcorrprovee, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(lbldireccion)
                            .addComponent(txtdireprovee, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(jpProveeLayout.createSequentialGroup()
                        .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel5)
                            .addComponent(lblnombre))
                        .addGap(10, 10, 10)
                        .addComponent(jLabel3)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel7)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel4)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jpProveeLayout.createSequentialGroup()
                        .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jpProveeLayout.createSequentialGroup()
                                .addComponent(lbltipo_per)
                                .addGap(19, 19, 19))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jpProveeLayout.createSequentialGroup()
                                .addComponent(cmbtipersona, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)))
                        .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(lblgenero)
                            .addComponent(cmbgeneprovee, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(lblfechanaci, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jdcfechaprovee, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addGap(16, 16, 16)
                        .addGroup(jpProveeLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(btnguardarprovee)
                            .addComponent(btncancelarprovee)))
                    .addGroup(jpProveeLayout.createSequentialGroup()
                        .addGap(12, 12, 12)
                        .addComponent(jLabel8)
                        .addGap(19, 19, 19)
                        .addComponent(jLabel6)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel11)))
                .addGap(14, 14, 14))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jpProvee, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jpProvee, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void cmbtipersonaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmbtipersonaActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cmbtipersonaActionPerformed

    /**
     * @param args the command line arguments
     */


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btncancelarprovee;
    private javax.swing.JButton btnguardarprovee;
    private javax.swing.JComboBox<String> cmbgeneprovee;
    private javax.swing.JComboBox<String> cmbtipersona;
    private javax.swing.JComboBox<String> cmbtipodoc_prove;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private com.toedter.calendar.JDateChooser jdcfechaprovee;
    private javax.swing.JPanel jpProvee;
    private javax.swing.JLabel lblcorreo;
    private javax.swing.JLabel lbldireccion;
    private javax.swing.JLabel lbldocumento;
    private javax.swing.JLabel lblfechanaci;
    private javax.swing.JLabel lblgenero;
    private javax.swing.JLabel lblnombre;
    private javax.swing.JLabel lbltelefono;
    private javax.swing.JLabel lbltipo_doc_prov;
    private javax.swing.JLabel lbltipo_per;
    private javax.swing.JTextField txtcorrprovee;
    private javax.swing.JTextField txtdireprovee;
    private javax.swing.JTextField txtdocuprovee;
    private javax.swing.JTextField txtnomprovee;
    private javax.swing.JTextField txtteleprovee;
    // End of variables declaration//GEN-END:variables
}
