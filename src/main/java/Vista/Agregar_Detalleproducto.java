/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package Vista;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTable;
import javax.swing.JTextField;

/**
 *
 * @author SENA
 */
public class Agregar_Detalleproducto extends javax.swing.JFrame {

    /**
     * Creates new form Agregar_Producto
     */
    public Agregar_Detalleproducto() {
        initComponents();
    }

    public JPanel getJPanelAgregarProducto() {
        return JPanelAgregarProducto;
    }

    public void setJPanelAgregarProducto(JPanel JPanelAgregarProducto) {
        this.JPanelAgregarProducto = JPanelAgregarProducto;
    }

    public JTable getJTablaagragarproducto() {
        return JTablaagragarproducto;
    }

    public void setJTablaagragarproducto(JTable JTablaagragarproducto) {
        this.JTablaagragarproducto = JTablaagragarproducto;
    }
    
    public JButton getBtnagregar() {
        return btnagregar;
    }

    public void setBtnagregar(JButton btnagregar) {
        this.btnagregar = btnagregar;
    }

    public JTextField getTxtcantidadcompra() {
        return txtcantidadcompra;
    }

    public void setTxtcantidadcompra(JTextField txtcantidadcompra) {
        this.txtcantidadcompra = txtcantidadcompra;
    }

    public JTextField getTxtpreciounita() {
        return txtpreciounita;
    }

    public void setTxtpreciounita(JTextField txtpreciounita) {
        this.txtpreciounita = txtpreciounita;
    }

    public JButton getBtnbuscarproduct() {
        return btnbuscarproduct;
    }

    public void setBtnbuscarproduct(JButton btnbuscarproduct) {
        this.btnbuscarproduct = btnbuscarproduct;
    }

    public JLabel getLblfactura() {
        return lblfactura;
    }

    public void setLblfactura(JLabel lblfactura) {
        this.lblfactura = lblfactura;
    }
    

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        JPanelAgregarProducto = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        JTablaagragarproducto = new javax.swing.JTable();
        lblidproducto = new javax.swing.JLabel();
        lblcantidadcompra = new javax.swing.JLabel();
        txtcantidadcompra = new javax.swing.JTextField();
        lblpreciounitario = new javax.swing.JLabel();
        txtpreciounita = new javax.swing.JTextField();
        btnagregar = new javax.swing.JButton();
        btnbuscarproduct = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        lblfactura = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        JPanelAgregarProducto.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Agregar Detalle Factura", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Yu Gothic UI", 1, 36), new java.awt.Color(0, 153, 153))); // NOI18N

        JTablaagragarproducto.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {},
                {},
                {},
                {}
            },
            new String [] {

            }
        ));
        jScrollPane1.setViewportView(JTablaagragarproducto);

        lblidproducto.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblidproducto.setForeground(new java.awt.Color(0, 153, 153));
        lblidproducto.setText("Producto");

        lblcantidadcompra.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblcantidadcompra.setForeground(new java.awt.Color(0, 153, 153));
        lblcantidadcompra.setText("Cantidad Comprada");

        txtcantidadcompra.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        lblpreciounitario.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        lblpreciounitario.setForeground(new java.awt.Color(0, 153, 153));
        lblpreciounitario.setText("Precio Unitario");

        txtpreciounita.setFont(new java.awt.Font("Yu Gothic UI", 0, 14)); // NOI18N

        btnagregar.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        btnagregar.setForeground(new java.awt.Color(0, 153, 153));
        btnagregar.setText("Agregar");

        btnbuscarproduct.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/buscar1.png"))); // NOI18N
        btnbuscarproduct.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnbuscarproductActionPerformed(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Yu Gothic UI", 1, 18)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(0, 153, 153));
        jLabel1.setText("N° Factura");

        lblfactura.setFont(new java.awt.Font("Yu Gothic UI", 0, 18)); // NOI18N
        lblfactura.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(204, 204, 204)));

        javax.swing.GroupLayout JPanelAgregarProductoLayout = new javax.swing.GroupLayout(JPanelAgregarProducto);
        JPanelAgregarProducto.setLayout(JPanelAgregarProductoLayout);
        JPanelAgregarProductoLayout.setHorizontalGroup(
            JPanelAgregarProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(JPanelAgregarProductoLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(JPanelAgregarProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(JPanelAgregarProductoLayout.createSequentialGroup()
                        .addGroup(JPanelAgregarProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 1106, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(JPanelAgregarProductoLayout.createSequentialGroup()
                                .addComponent(jLabel1)
                                .addGap(18, 18, 18)
                                .addComponent(lblfactura, javax.swing.GroupLayout.PREFERRED_SIZE, 112, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(JPanelAgregarProductoLayout.createSequentialGroup()
                        .addComponent(lblidproducto)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(btnbuscarproduct)
                        .addGap(69, 69, 69)
                        .addComponent(lblcantidadcompra)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txtcantidadcompra, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(lblpreciounitario)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txtpreciounita, javax.swing.GroupLayout.PREFERRED_SIZE, 99, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnagregar)
                        .addGap(172, 172, 172))))
        );
        JPanelAgregarProductoLayout.setVerticalGroup(
            JPanelAgregarProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, JPanelAgregarProductoLayout.createSequentialGroup()
                .addGap(26, 26, 26)
                .addGroup(JPanelAgregarProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(lblfactura))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 23, Short.MAX_VALUE)
                .addGroup(JPanelAgregarProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, JPanelAgregarProductoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(lblidproducto)
                        .addComponent(lblcantidadcompra)
                        .addComponent(txtcantidadcompra, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(lblpreciounitario)
                        .addComponent(txtpreciounita, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(btnagregar))
                    .addComponent(btnbuscarproduct, javax.swing.GroupLayout.Alignment.TRAILING))
                .addGap(43, 43, 43)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 322, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(JPanelAgregarProducto, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(JPanelAgregarProducto, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnbuscarproductActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnbuscarproductActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnbuscarproductActionPerformed

    /**
     * @param args the command line arguments
     */

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel JPanelAgregarProducto;
    private javax.swing.JTable JTablaagragarproducto;
    private javax.swing.JButton btnagregar;
    private javax.swing.JButton btnbuscarproduct;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JLabel lblcantidadcompra;
    private javax.swing.JLabel lblfactura;
    private javax.swing.JLabel lblidproducto;
    private javax.swing.JLabel lblpreciounitario;
    private javax.swing.JTextField txtcantidadcompra;
    private javax.swing.JTextField txtpreciounita;
    // End of variables declaration//GEN-END:variables
}
