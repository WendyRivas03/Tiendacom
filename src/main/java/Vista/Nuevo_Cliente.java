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
public class Nuevo_Cliente extends javax.swing.JFrame {

    /**
     * Creates new form Nuevo_Cliente
     */
    public Nuevo_Cliente() {
        initComponents();
    }

    public JButton getBtncancelarcli() {
        return btncancelarcli;
    }

    public void setBtncancelarcli(JButton btncancelarcli) {
        this.btncancelarcli = btncancelarcli;
    }

    public JButton getBtnguardarcli() {
        return btnguardarcli;
    }

    public void setBtnguardarcli(JButton btnguardarcli) {
        this.btnguardarcli = btnguardarcli;
    }

    public JComboBox<String> getCmbgenecli() {
        return cmbgenecli;
    }

    public void setCmbgenecli(JComboBox<String> cmbgenecli) {
        this.cmbgenecli = cmbgenecli;
    }

    public JComboBox<String> getCmbtipodocu_cli() {
        return cmbtipodocu_cli;
    }

    public void setCmbtipodocu_cli(JComboBox<String> cmbtipodocu_cli) {
        this.cmbtipodocu_cli = cmbtipodocu_cli;
    }

    public JDateChooser getJdcfechacli() {
        return jdcfechacli;
    }

    public void setJdcfechacli(JDateChooser jdcfechacli) {
        this.jdcfechacli = jdcfechacli;
    }

    public JTextField getTxtcorrcli() {
        return txtcorrcli;
    }

    public void setTxtcorrcli(JTextField txtcorrcli) {
        this.txtcorrcli = txtcorrcli;
    }

    public JTextField getTxtdirecli() {
        return txtdirecli;
    }

    public void setTxtdirecli(JTextField txtdirecli) {
        this.txtdirecli = txtdirecli;
    }

    public JTextField getTxtdocucli() {
        return txtdocucli;
    }

    public void setTxtdocucli(JTextField txtdocucli) {
        this.txtdocucli = txtdocucli;
    }

    public JTextField getTxtnomcli() {
        return txtnomcli;
    }

    public void setTxtnomcli(JTextField txtnomcli) {
        this.txtnomcli = txtnomcli;
    }

    public JTextField getTxttelecli() {
        return txttelecli;
    }

    public void setTxttelecli(JTextField txttelecli) {
        this.txttelecli = txttelecli;
    }

    public JPanel getCliente() {
        return cliente;
    }

    public void setCliente(JPanel cliente) {
        this.cliente = cliente;
    }

    
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        cliente = new javax.swing.JPanel();
        lbldocumento = new javax.swing.JLabel();
        lblnombre = new javax.swing.JLabel();
        lbltelefono = new javax.swing.JLabel();
        lblcorreo = new javax.swing.JLabel();
        lbldireccion = new javax.swing.JLabel();
        lblgenero = new javax.swing.JLabel();
        lblfechanaci = new javax.swing.JLabel();
        btnguardarcli = new javax.swing.JButton();
        btncancelarcli = new javax.swing.JButton();
        txtdocucli = new javax.swing.JTextField();
        txtnomcli = new javax.swing.JTextField();
        txttelecli = new javax.swing.JTextField();
        txtcorrcli = new javax.swing.JTextField();
        txtdirecli = new javax.swing.JTextField();
        cmbgenecli = new javax.swing.JComboBox<>();
        jdcfechacli = new com.toedter.calendar.JDateChooser();
        jLabel1 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        lbltipo_doc_cli = new javax.swing.JLabel();
        cmbtipodocu_cli = new javax.swing.JComboBox<>();
        jLabel9 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        cliente.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Nuevo Cliente", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Yu Gothic UI", 1, 36), new java.awt.Color(0, 153, 153))); // NOI18N

        lbldocumento.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lbldocumento.setForeground(new java.awt.Color(0, 153, 153));
        lbldocumento.setText("Documento");

        lblnombre.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblnombre.setForeground(new java.awt.Color(0, 153, 153));
        lblnombre.setText("Nombre");

        lbltelefono.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lbltelefono.setForeground(new java.awt.Color(0, 153, 153));
        lbltelefono.setText("Teléfono");

        lblcorreo.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblcorreo.setForeground(new java.awt.Color(0, 153, 153));
        lblcorreo.setText("Correo");

        lbldireccion.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lbldireccion.setForeground(new java.awt.Color(0, 153, 153));
        lbldireccion.setText("Dirección");

        lblgenero.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblgenero.setForeground(new java.awt.Color(0, 153, 153));
        lblgenero.setText("Género");

        lblfechanaci.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblfechanaci.setForeground(new java.awt.Color(0, 153, 153));
        lblfechanaci.setText("Fecha de Nacimiento");

        btnguardarcli.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        btnguardarcli.setForeground(new java.awt.Color(0, 153, 153));
        btnguardarcli.setText("Guardar");

        btncancelarcli.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        btncancelarcli.setForeground(new java.awt.Color(0, 153, 153));
        btncancelarcli.setText("Cancelar");

        txtdocucli.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        txtnomcli.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        txttelecli.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        txtcorrcli.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        txtdirecli.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        cmbgenecli.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        jLabel1.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(204, 0, 0));
        jLabel1.setText("*");

        jLabel5.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel5.setForeground(new java.awt.Color(204, 0, 0));
        jLabel5.setText("*");

        jLabel3.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(204, 0, 0));
        jLabel3.setText("*");

        jLabel7.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel7.setForeground(new java.awt.Color(204, 0, 0));
        jLabel7.setText("*");

        jLabel4.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(204, 0, 0));
        jLabel4.setText("*");

        jLabel6.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel6.setForeground(new java.awt.Color(204, 0, 0));
        jLabel6.setText("*");

        jLabel11.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel11.setForeground(new java.awt.Color(204, 0, 0));
        jLabel11.setText("*");

        lbltipo_doc_cli.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lbltipo_doc_cli.setForeground(new java.awt.Color(0, 153, 153));
        lbltipo_doc_cli.setText("Tipo de Documento");

        cmbtipodocu_cli.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N
        cmbtipodocu_cli.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccione...", "Cédula de ciudadanía", "Cédula de extranjería", "Pasaporte" }));

        jLabel9.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel9.setForeground(new java.awt.Color(204, 0, 0));
        jLabel9.setText("*");

        javax.swing.GroupLayout clienteLayout = new javax.swing.GroupLayout(cliente);
        cliente.setLayout(clienteLayout);
        clienteLayout.setHorizontalGroup(
            clienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(clienteLayout.createSequentialGroup()
                .addGap(143, 143, 143)
                .addComponent(btnguardarcli)
                .addGap(68, 68, 68)
                .addComponent(btncancelarcli)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(clienteLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(clienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(lbldocumento)
                    .addComponent(lblfechanaci)
                    .addComponent(lbldireccion)
                    .addComponent(lblcorreo)
                    .addComponent(lbltelefono)
                    .addComponent(lblnombre)
                    .addComponent(lblgenero)
                    .addComponent(lbltipo_doc_cli))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(clienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(clienteLayout.createSequentialGroup()
                        .addGroup(clienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(clienteLayout.createSequentialGroup()
                                .addGap(1, 1, 1)
                                .addGroup(clienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(txtnomcli)
                                    .addComponent(txttelecli)
                                    .addComponent(txtcorrcli)
                                    .addComponent(txtdirecli)
                                    .addComponent(cmbgenecli, javax.swing.GroupLayout.PREFERRED_SIZE, 253, javax.swing.GroupLayout.PREFERRED_SIZE)))
                            .addComponent(jdcfechacli, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 254, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(clienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(clienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addComponent(jLabel5)
                                .addComponent(jLabel3)
                                .addComponent(jLabel4)
                                .addComponent(jLabel6)
                                .addComponent(jLabel11, javax.swing.GroupLayout.Alignment.TRAILING))
                            .addComponent(jLabel7)))
                    .addGroup(clienteLayout.createSequentialGroup()
                        .addGroup(clienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(cmbtipodocu_cli, javax.swing.GroupLayout.PREFERRED_SIZE, 254, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txtdocucli, javax.swing.GroupLayout.PREFERRED_SIZE, 253, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGroup(clienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(clienteLayout.createSequentialGroup()
                                .addGap(6, 6, 6)
                                .addComponent(jLabel1))
                            .addGroup(clienteLayout.createSequentialGroup()
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel9)))))
                .addGap(49, 49, 49))
        );
        clienteLayout.setVerticalGroup(
            clienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(clienteLayout.createSequentialGroup()
                .addGap(25, 25, 25)
                .addGroup(clienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(clienteLayout.createSequentialGroup()
                        .addGroup(clienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(lbldocumento)
                            .addComponent(txtdocucli, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(12, 12, 12)
                        .addGroup(clienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(lbltipo_doc_cli)
                            .addComponent(cmbtipodocu_cli, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel9))
                        .addGap(17, 17, 17)
                        .addComponent(lblnombre)
                        .addGap(18, 18, 18)
                        .addComponent(lbltelefono)
                        .addGap(18, 18, 18)
                        .addComponent(lblcorreo)
                        .addGap(18, 18, 18)
                        .addComponent(lbldireccion)
                        .addGap(18, 18, 18)
                        .addComponent(lblgenero)
                        .addGap(18, 18, 18)
                        .addComponent(lblfechanaci))
                    .addGroup(clienteLayout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addGap(57, 57, 57)
                        .addGroup(clienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(txtnomcli, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel5))
                        .addGap(18, 18, 18)
                        .addGroup(clienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(txttelecli, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel3))
                        .addGap(18, 18, 18)
                        .addGroup(clienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(txtcorrcli, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel7))
                        .addGap(18, 18, 18)
                        .addGroup(clienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(txtdirecli, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel4))
                        .addGap(18, 18, 18)
                        .addGroup(clienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(cmbgenecli, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel6))
                        .addGap(18, 18, 18)
                        .addGroup(clienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jLabel11)
                            .addComponent(jdcfechacli, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addGap(18, 18, 18)
                .addGroup(clienteLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnguardarcli)
                    .addComponent(btncancelarcli))
                .addContainerGap(22, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(cliente, javax.swing.GroupLayout.PREFERRED_SIZE, 495, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(cliente, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    /**
     * @param args the command line arguments
     */
 

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btncancelarcli;
    private javax.swing.JButton btnguardarcli;
    private javax.swing.JPanel cliente;
    private javax.swing.JComboBox<String> cmbgenecli;
    private javax.swing.JComboBox<String> cmbtipodocu_cli;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel9;
    private com.toedter.calendar.JDateChooser jdcfechacli;
    private javax.swing.JLabel lblcorreo;
    private javax.swing.JLabel lbldireccion;
    private javax.swing.JLabel lbldocumento;
    private javax.swing.JLabel lblfechanaci;
    private javax.swing.JLabel lblgenero;
    private javax.swing.JLabel lblnombre;
    private javax.swing.JLabel lbltelefono;
    private javax.swing.JLabel lbltipo_doc_cli;
    private javax.swing.JTextField txtcorrcli;
    private javax.swing.JTextField txtdirecli;
    private javax.swing.JTextField txtdocucli;
    private javax.swing.JTextField txtnomcli;
    private javax.swing.JTextField txttelecli;
    // End of variables declaration//GEN-END:variables
}
