/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package Vista;

import com.toedter.calendar.JDateChooser;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;


public class Nuevo_Usuario extends javax.swing.JFrame {

 
    public Nuevo_Usuario() {
        initComponents();
    }

    public JButton getBtcCancelar() {
        return btcCancelar;
    }

    public void setBtcCancelar(JButton btcCancelar) {
        this.btcCancelar = btcCancelar;
    }

    public JButton getBtnGuardar() {
        return btnGuardar;
    }

    public void setBtnGuardar(JButton btnGuardar) {
        this.btnGuardar = btnGuardar;
    }

    public JButton getBtnvista() {
        return btnvista;
    }

    public void setBtnvista(JButton btnvista) {
        this.btnvista = btnvista;
    }

    public JComboBox<String> getCmbSexo() {
        return cmbSexo;
    }

    public void setCmbSexo(JComboBox<String> cmbSexo) {
        this.cmbSexo = cmbSexo;
    }

    public JComboBox<String> getCmbrol() {
        return cmbrol;
    }

    public void setCmbrol(JComboBox<String> cmbrol) {
        this.cmbrol = cmbrol;
    }

    public JComboBox<String> getCmbtipodocu() {
        return cmbtipodocu;
    }

    public void setCmbtipodocu(JComboBox<String> cmbtipodocu) {
        this.cmbtipodocu = cmbtipodocu;
    }
    
    

    public JDateChooser getJdcfechanaci() {
        return jdcfechanaci;
    }

    public void setJdcfechanaci(JDateChooser jdcfechanaci) {
        this.jdcfechanaci = jdcfechanaci;
    }

    public JPasswordField getPssContrase() {
        return pssContrase;
    }

    public void setPssContrase(JPasswordField pssContrase) {
        this.pssContrase = pssContrase;
    }

    public JTextField getTxtCorreo() {
        return txtCorreo;
    }

    public void setTxtCorreo(JTextField txtCorreo) {
        this.txtCorreo = txtCorreo;
    }

    public JTextField getTxtDire() {
        return txtDire;
    }

    public void setTxtDire(JTextField txtDire) {
        this.txtDire = txtDire;
    }

    public JTextField getTxtDocumento() {
        return txtDocumento;
    }

    public void setTxtDocumento(JTextField txtDocumento) {
        this.txtDocumento = txtDocumento;
    }

    public JTextField getTxtLogin() {
        return txtLogin;
    }

    public void setTxtLogin(JTextField txtLogin) {
        this.txtLogin = txtLogin;
    }

    public JTextField getTxtNombre() {
        return txtNombre;
    }

    public void setTxtNombre(JTextField txtNombre) {
        this.txtNombre = txtNombre;
    }

    public JTextField getTxtTele() {
        return txtTele;
    }

    public void setTxtTele(JTextField txtTele) {
        this.txtTele = txtTele;
    }

    public JPanel getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(JPanel usuarios) {
        this.usuarios = usuarios;
    }
    
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jDesktopPane1 = new javax.swing.JDesktopPane();
        jLabel13 = new javax.swing.JLabel();
        usuarios = new javax.swing.JPanel();
        pssContrase = new javax.swing.JPasswordField();
        txtDire = new javax.swing.JTextField();
        btnvista = new javax.swing.JButton();
        lblCorreo = new javax.swing.JLabel();
        lblDocumento = new javax.swing.JLabel();
        lblLogin = new javax.swing.JLabel();
        txtNombre = new javax.swing.JTextField();
        txtTele = new javax.swing.JTextField();
        txtCorreo = new javax.swing.JTextField();
        lblTelefono = new javax.swing.JLabel();
        lblSexo = new javax.swing.JLabel();
        lbldire = new javax.swing.JLabel();
        lblNombre = new javax.swing.JLabel();
        cmbSexo = new javax.swing.JComboBox<>();
        lblContra = new javax.swing.JLabel();
        txtDocumento = new javax.swing.JTextField();
        lblRango = new javax.swing.JLabel();
        txtLogin = new javax.swing.JTextField();
        btnGuardar = new javax.swing.JButton();
        btcCancelar = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        cmbrol = new javax.swing.JComboBox<>();
        jLabel11 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jdcfechanaci = new com.toedter.calendar.JDateChooser();
        jLabel8 = new javax.swing.JLabel();
        lbltipo_doc = new javax.swing.JLabel();
        cmbtipodocu = new javax.swing.JComboBox<>();

        javax.swing.GroupLayout jDesktopPane1Layout = new javax.swing.GroupLayout(jDesktopPane1);
        jDesktopPane1.setLayout(jDesktopPane1Layout);
        jDesktopPane1Layout.setHorizontalGroup(
            jDesktopPane1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 100, Short.MAX_VALUE)
        );
        jDesktopPane1Layout.setVerticalGroup(
            jDesktopPane1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 100, Short.MAX_VALUE)
        );

        jLabel13.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel13.setForeground(new java.awt.Color(204, 0, 0));
        jLabel13.setText("*");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        usuarios.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Nuevo Usuario", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Yu Gothic UI", 1, 36), new java.awt.Color(0, 153, 153))); // NOI18N
        usuarios.setForeground(new java.awt.Color(51, 51, 255));

        pssContrase.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        txtDire.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        btnvista.setBackground(new java.awt.Color(255, 204, 204));
        btnvista.setIcon(new javax.swing.ImageIcon("C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda_Com\\src\\main\\resources\\img\\ojo.png")); // NOI18N
        btnvista.setContentAreaFilled(false);

        lblCorreo.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblCorreo.setForeground(new java.awt.Color(0, 153, 153));
        lblCorreo.setText("Correo");

        lblDocumento.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblDocumento.setForeground(new java.awt.Color(0, 153, 153));
        lblDocumento.setText("Documento");

        lblLogin.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblLogin.setForeground(new java.awt.Color(0, 153, 153));
        lblLogin.setText("Login");

        txtNombre.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        txtTele.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        txtCorreo.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        lblTelefono.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblTelefono.setForeground(new java.awt.Color(0, 153, 153));
        lblTelefono.setText("Teléfono");

        lblSexo.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblSexo.setForeground(new java.awt.Color(0, 153, 153));
        lblSexo.setText("Sexo");

        lbldire.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lbldire.setForeground(new java.awt.Color(0, 153, 153));
        lbldire.setText("Dirección");

        lblNombre.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblNombre.setForeground(new java.awt.Color(0, 153, 153));
        lblNombre.setText("Nombre");

        cmbSexo.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        lblContra.setBackground(new java.awt.Color(255, 255, 255));
        lblContra.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblContra.setForeground(new java.awt.Color(0, 153, 153));
        lblContra.setText("Contraseña");

        txtDocumento.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        lblRango.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblRango.setForeground(new java.awt.Color(0, 153, 153));
        lblRango.setText("Rol");

        txtLogin.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        btnGuardar.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        btnGuardar.setForeground(new java.awt.Color(0, 153, 153));
        btnGuardar.setText("Guardar");

        btcCancelar.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        btcCancelar.setForeground(new java.awt.Color(0, 153, 153));
        btcCancelar.setText("Cancelar");

        jLabel1.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(204, 0, 0));
        jLabel1.setText("*");

        jLabel2.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(204, 0, 0));
        jLabel2.setText("*");

        jLabel3.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(204, 0, 0));
        jLabel3.setText("*");

        jLabel4.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(204, 0, 0));
        jLabel4.setText("*");

        jLabel5.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel5.setForeground(new java.awt.Color(204, 0, 0));
        jLabel5.setText("*");

        jLabel6.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel6.setForeground(new java.awt.Color(204, 0, 0));
        jLabel6.setText("*");

        jLabel9.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel9.setForeground(new java.awt.Color(204, 0, 0));
        jLabel9.setText("*");

        jLabel10.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel10.setForeground(new java.awt.Color(0, 153, 153));
        jLabel10.setText("Fecha de Nacimiento");

        cmbrol.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N
        cmbrol.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmbrolActionPerformed(evt);
            }
        });

        jLabel11.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel11.setForeground(new java.awt.Color(204, 0, 0));
        jLabel11.setText("*");

        jLabel12.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel12.setForeground(new java.awt.Color(204, 0, 0));
        jLabel12.setText("*");

        jLabel7.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel7.setForeground(new java.awt.Color(204, 0, 0));
        jLabel7.setText("*");

        jdcfechanaci.setDateFormatString("yyyy-MM-dd");

        jLabel8.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel8.setForeground(new java.awt.Color(204, 0, 0));
        jLabel8.setText("*");

        lbltipo_doc.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lbltipo_doc.setForeground(new java.awt.Color(0, 153, 153));
        lbltipo_doc.setText("Tipo de Documento");

        cmbtipodocu.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N
        cmbtipodocu.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccione...", "Cédula de ciudadanía", "Cédula de extranjería", "Pasaporte" }));

        javax.swing.GroupLayout usuariosLayout = new javax.swing.GroupLayout(usuarios);
        usuarios.setLayout(usuariosLayout);
        usuariosLayout.setHorizontalGroup(
            usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, usuariosLayout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(btnGuardar)
                .addGap(41, 41, 41)
                .addComponent(btcCancelar)
                .addGap(129, 129, 129))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, usuariosLayout.createSequentialGroup()
                .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(usuariosLayout.createSequentialGroup()
                        .addGap(17, 17, 17)
                        .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(lblDocumento, javax.swing.GroupLayout.PREFERRED_SIZE, 107, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(lblNombre)
                            .addComponent(lblRango)
                            .addComponent(lblTelefono)
                            .addComponent(lblCorreo)
                            .addComponent(lblSexo)
                            .addComponent(lbldire)
                            .addComponent(lbltipo_doc))
                        .addGap(13, 13, 13))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, usuariosLayout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, usuariosLayout.createSequentialGroup()
                                .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(lblLogin)
                                    .addComponent(lblContra))
                                .addGap(85, 85, 85))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, usuariosLayout.createSequentialGroup()
                                .addComponent(jLabel10)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)))))
                .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(txtDocumento)
                    .addComponent(txtNombre)
                    .addComponent(cmbSexo, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(txtDire)
                    .addComponent(cmbrol, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(txtTele)
                    .addComponent(txtCorreo)
                    .addGroup(usuariosLayout.createSequentialGroup()
                        .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addGroup(usuariosLayout.createSequentialGroup()
                                .addComponent(pssContrase)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(btnvista, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(14, 14, 14))
                            .addComponent(txtLogin, javax.swing.GroupLayout.PREFERRED_SIZE, 310, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jdcfechanaci, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addComponent(cmbtipodocu, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel8)
                    .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel2)
                            .addComponent(jLabel5)
                            .addComponent(jLabel3)
                            .addComponent(jLabel4)
                            .addComponent(jLabel6)
                            .addComponent(jLabel11, javax.swing.GroupLayout.Alignment.TRAILING))
                        .addComponent(jLabel12)
                        .addComponent(jLabel9, javax.swing.GroupLayout.Alignment.TRAILING))
                    .addComponent(jLabel7)
                    .addComponent(jLabel1))
                .addGap(62, 62, 62))
        );
        usuariosLayout.setVerticalGroup(
            usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(usuariosLayout.createSequentialGroup()
                .addGap(24, 24, 24)
                .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lblDocumento)
                    .addComponent(txtDocumento, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 12, Short.MAX_VALUE)
                .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel8)
                    .addComponent(lbltipo_doc)
                    .addComponent(cmbtipodocu, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, usuariosLayout.createSequentialGroup()
                        .addComponent(lblNombre)
                        .addGap(276, 276, 276)
                        .addComponent(lblLogin)
                        .addGap(20, 20, 20)
                        .addComponent(lblContra))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, usuariosLayout.createSequentialGroup()
                        .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(usuariosLayout.createSequentialGroup()
                                .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                    .addComponent(txtNombre, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jLabel2))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(cmbrol, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(lblRango))
                                    .addComponent(jLabel5))
                                .addGap(18, 18, 18)
                                .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                    .addComponent(txtTele, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jLabel3)
                                    .addComponent(lblTelefono))
                                .addGap(18, 18, 18)
                                .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                    .addComponent(txtCorreo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jLabel7)
                                    .addComponent(lblCorreo))
                                .addGap(18, 18, 18)
                                .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                    .addComponent(cmbSexo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jLabel4)
                                    .addComponent(lblSexo))
                                .addGap(18, 18, 18)
                                .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                    .addComponent(txtDire, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jLabel6)
                                    .addComponent(lbldire))
                                .addGap(18, 18, 18)
                                .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel11)
                                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, usuariosLayout.createSequentialGroup()
                                        .addComponent(jdcfechanaci, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED))))
                            .addGroup(usuariosLayout.createSequentialGroup()
                                .addComponent(jLabel10)
                                .addGap(12, 12, 12)))
                        .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(txtLogin, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel12))
                        .addGap(18, 18, 18)
                        .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(pssContrase, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel9)
                            .addComponent(btnvista))))
                .addGap(18, 18, 18)
                .addGroup(usuariosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btcCancelar)
                    .addComponent(btnGuardar)))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(usuarios, javax.swing.GroupLayout.PREFERRED_SIZE, 553, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(usuarios, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void cmbrolActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmbrolActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cmbrolActionPerformed

    /**
     * @param args the command line arguments
     */


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btcCancelar;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JButton btnvista;
    private javax.swing.JComboBox<String> cmbSexo;
    private javax.swing.JComboBox<String> cmbrol;
    private javax.swing.JComboBox<String> cmbtipodocu;
    private javax.swing.JDesktopPane jDesktopPane1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private com.toedter.calendar.JDateChooser jdcfechanaci;
    private javax.swing.JLabel lblContra;
    private javax.swing.JLabel lblCorreo;
    private javax.swing.JLabel lblDocumento;
    private javax.swing.JLabel lblLogin;
    private javax.swing.JLabel lblNombre;
    private javax.swing.JLabel lblRango;
    private javax.swing.JLabel lblSexo;
    private javax.swing.JLabel lblTelefono;
    private javax.swing.JLabel lbldire;
    private javax.swing.JLabel lbltipo_doc;
    private javax.swing.JPasswordField pssContrase;
    private javax.swing.JTextField txtCorreo;
    private javax.swing.JTextField txtDire;
    private javax.swing.JTextField txtDocumento;
    private javax.swing.JTextField txtLogin;
    private javax.swing.JTextField txtNombre;
    private javax.swing.JTextField txtTele;
    private javax.swing.JPanel usuarios;
    // End of variables declaration//GEN-END:variables
}
