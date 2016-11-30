/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view.improvement;

import com.vchibilisco.helper.CustomTableModel;
import com.vchibilisco.helper.HelperOfForms;
import controller.ControllerImprovements;
import java.awt.Frame;
import javax.swing.JOptionPane;
import javax.swing.JTable;

/**
 *
 * @author winvm
 */
public class ListImprovement extends javax.swing.JDialog {

    /**
     * Creates new form ListImprovement
     */
    public ListImprovement(java.awt.Frame parent, boolean modal, int period) {
        super(parent, modal);
        this.parent = parent;
        this.period = period;
        table = new JTable();
        model = new CustomTableModel();
        String[] column = {"ID", "Titulo", "Prioridad", "Estado"};
        HelperOfForms.initTable(table, model, column);
        controllerImprovements = new ControllerImprovements();
        initComponents();
        controllerImprovements.getAllImprovement(this);
        setLocationRelativeTo(null);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jToolBar1 = new javax.swing.JToolBar();
        btnNew = new javax.swing.JButton();
        jSeparator1 = new javax.swing.JToolBar.Separator();
        btnUpdate = new javax.swing.JButton();
        jSeparator2 = new javax.swing.JToolBar.Separator();
        btnDelete = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane(table);

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Mejoras");
        setResizable(false);

        jToolBar1.setFloatable(false);
        jToolBar1.setRollover(true);

        btnNew.setText("Nuevo");
        btnNew.setFocusable(false);
        btnNew.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnNew.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        btnNew.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnNewActionPerformed(evt);
            }
        });
        jToolBar1.add(btnNew);
        jToolBar1.add(jSeparator1);

        btnUpdate.setText("Actualizar");
        btnUpdate.setFocusable(false);
        btnUpdate.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnUpdate.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        btnUpdate.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnUpdateActionPerformed(evt);
            }
        });
        jToolBar1.add(btnUpdate);
        jToolBar1.add(jSeparator2);

        btnDelete.setText("Eliminar");
        btnDelete.setFocusable(false);
        btnDelete.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnDelete.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        btnDelete.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDeleteActionPerformed(evt);
            }
        });
        jToolBar1.add(btnDelete);

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jToolBar1, javax.swing.GroupLayout.DEFAULT_SIZE, 587, Short.MAX_VALUE)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1)
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jToolBar1, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 304, Short.MAX_VALUE)
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnNewActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnNewActionPerformed
        new FormImprovement(parent, true, controllerImprovements).setVisible(true);
        HelperOfForms.cleanModel(model);
        controllerImprovements.getAllImprovement(this);
    }//GEN-LAST:event_btnNewActionPerformed

    private void btnDeleteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDeleteActionPerformed
        try {
            if (JOptionPane.showConfirmDialog(parent, "Desea elimiar la Mejora?", "Confirmacion", JOptionPane.WARNING_MESSAGE) == JOptionPane.YES_OPTION) {
                controllerImprovements.delete(this, HelperOfForms.getValueOfCell(table, model, 0));
                HelperOfForms.cleanModel(model);
                controllerImprovements.getAllImprovement(this);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            JOptionPane.showMessageDialog(this, "Seleccione un registro.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_btnDeleteActionPerformed

    private void btnUpdateActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnUpdateActionPerformed
        try {
            new FormImprovement(parent, true, controllerImprovements, HelperOfForms.getValueOfCell(table, model, 0)).setVisible(true);
            HelperOfForms.cleanModel(model);
            controllerImprovements.getAllImprovement(this);
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, "Debe seleccionar una Mejora.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_btnUpdateActionPerformed

    public int getPeriod() {
        return period;
    }

    public JTable getTable() {
        return table;
    }

    public CustomTableModel getModel() {
        return model;
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnDelete;
    private javax.swing.JButton btnNew;
    private javax.swing.JButton btnUpdate;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JToolBar.Separator jSeparator1;
    private javax.swing.JToolBar.Separator jSeparator2;
    private javax.swing.JToolBar jToolBar1;
    // End of variables declaration//GEN-END:variables
    private JTable table;
    private CustomTableModel model;
    private int period;
    private ControllerImprovements controllerImprovements;
    private Frame parent;
}
