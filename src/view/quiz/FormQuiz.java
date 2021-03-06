/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view.quiz;

import controller.ControllerQuiz;
import java.sql.SQLException;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;

/**
 *
 * @author winvm
 */
public class FormQuiz extends javax.swing.JDialog {

    /**
     * Creates new form Quiz
     */
    public FormQuiz(java.awt.Frame parent, boolean modal, int period) {
        super(parent, modal);
        initComponents();
        isFinished = false;
        setLocationRelativeTo(null);
        setTitle(getTitle() + " - Periodo: " + period);
        controllerQuiz = new ControllerQuiz();
        try {
            controllerQuiz.getAllQuiz(period);
            controllerQuiz.getQuiz(this);
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(this, "Error al inicializar la Encuesta.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public JLabel getTxtCountQuestion() {
        return txtCountQuestion;
    }

    public JComboBox getCbAnswer() {
        return cbAnswer;
    }

    public JLabel getLbCriteria() {
        return lbCriteria;
    }

    public JLabel getLbProcess() {
        return lbProcess;
    }

    public JLabel getLbSubCriteria() {
        return lbSubCriteria;
    }

    public JLabel getLbGuid() {
        return lbGuid;
    }

    public JTextArea getTxtQuestion() {
        return txtQuestion;
    }

    public int getIdPeriod() {
        return idPeriod;
    }

    public void setIdPeriod(int idPeriod) {
        this.idPeriod = idPeriod;
    }

    public void setIdQuestion(int idQuestion) {
        this.idQuestion = idQuestion;
    }

    public int getIdQuestion() {
        return idQuestion;
    }

    public int getIdProcess() {
        return idProcess;
    }

    public void setIdProcess(int idProcess) {
        this.idProcess = idProcess;
    }

    public int getIdSubCriteria() {
        return idSubCriteria;
    }

    public void setIdSubCriteria(int idSubCriteria) {
        this.idSubCriteria = idSubCriteria;
    }

    public int getIdCriteria() {
        return idCriteria;
    }

    public void setIdCriteria(int idCriteria) {
        this.idCriteria = idCriteria;
    }

    public JButton getBtnNextAndFinish() {
        return btnNextAndFinish;
    }

    public void setIsFinished(boolean isFinished) {
        this.isFinished = isFinished;
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
        btnCancel = new javax.swing.JButton();
        btnNextAndFinish = new javax.swing.JButton();
        cbAnswer = new javax.swing.JComboBox();
        jScrollPane1 = new javax.swing.JScrollPane();
        txtQuestion = new javax.swing.JTextArea();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        lbCriteria = new javax.swing.JLabel();
        lbSubCriteria = new javax.swing.JLabel();
        lbProcess = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        lbGuid = new javax.swing.JLabel();
        txtCountQuestion = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        evidence = new javax.swing.JTextField();

        setTitle("Nueva encuesta");
        setResizable(false);

        btnCancel.setText("Cancelar");
        btnCancel.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCancelActionPerformed(evt);
            }
        });

        btnNextAndFinish.setText("Siguiente");
        btnNextAndFinish.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnNextAndFinishActionPerformed(evt);
            }
        });

        cbAnswer.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Seleccionar Respuesta" }));

        txtQuestion.setEditable(false);
        txtQuestion.setColumns(20);
        txtQuestion.setLineWrap(true);
        txtQuestion.setRows(5);
        jScrollPane1.setViewportView(txtQuestion);

        jLabel1.setText("Criterio:");

        jLabel2.setText("Sub Criterio:");

        jLabel3.setText("Proceso:");

        lbCriteria.setText("Criteria text");

        lbSubCriteria.setText("Sub criteria text");

        lbProcess.setText("Process text");

        jLabel4.setText("GUID:");

        lbGuid.setText("txtGuid");

        txtCountQuestion.setText("txtCountQuestion");

        jLabel5.setText("Evidencia:");

        evidence.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                evidenceActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                        .addComponent(cbAnswer, javax.swing.GroupLayout.PREFERRED_SIZE, 174, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(btnNextAndFinish)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 353, Short.MAX_VALUE)
                        .addComponent(btnCancel))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel3)
                                    .addComponent(jLabel2)
                                    .addComponent(jLabel1))
                                .addGap(18, 18, 18)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(lbCriteria, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(lbProcess, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(lbSubCriteria, javax.swing.GroupLayout.DEFAULT_SIZE, 622, Short.MAX_VALUE)))
                            .addComponent(txtCountQuestion)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel4)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(lbGuid, javax.swing.GroupLayout.PREFERRED_SIZE, 272, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel5)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(evidence, javax.swing.GroupLayout.PREFERRED_SIZE, 164, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(lbCriteria))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(lbSubCriteria))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(lbProcess))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 19, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(evidence, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(txtCountQuestion)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(lbGuid))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnCancel)
                    .addComponent(btnNextAndFinish)
                    .addComponent(cbAnswer, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(26, 26, 26))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnCancelActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCancelActionPerformed
        int option = JOptionPane.showConfirmDialog(this, "¿Desea salir de la Encuesta? Se perderán los datos.", "Informacion", JOptionPane.WARNING_MESSAGE);
        if (JOptionPane.YES_OPTION == option) {
            this.dispose();
        }
    }//GEN-LAST:event_btnCancelActionPerformed

    private void btnNextAndFinishActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnNextAndFinishActionPerformed
        if (isFinished) {
            try {
                controllerQuiz.addResponse(this);
                controllerQuiz.saveRsponses(this);
                dispose();
            } catch (SQLException e) {
                e.printStackTrace();
                JOptionPane.showMessageDialog(this, "Ocurrio un error al intentar guardar las respuestas.", "Error", JOptionPane.ERROR_MESSAGE);
            } catch (ClassCastException ex){
                JOptionPane.showMessageDialog(this, "Debe seleccionar una respuesta.", "Error", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            if (cbAnswer.getSelectedIndex() != 0) {
                controllerQuiz.addResponse(this);
                controllerQuiz.getQuiz(this);
            } else {
                JOptionPane.showMessageDialog(this, "Debe seleccionar una respuesta.", "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    }//GEN-LAST:event_btnNextAndFinishActionPerformed

    private void evidenceActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_evidenceActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_evidenceActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCancel;
    private javax.swing.JButton btnNextAndFinish;
    private javax.swing.JComboBox cbAnswer;
    private javax.swing.JTextField evidence;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JLabel lbCriteria;
    private javax.swing.JLabel lbGuid;
    private javax.swing.JLabel lbProcess;
    private javax.swing.JLabel lbSubCriteria;
    private javax.swing.JLabel txtCountQuestion;
    private javax.swing.JTextArea txtQuestion;
    // End of variables declaration//GEN-END:variables
    private ControllerQuiz controllerQuiz;
    private int idPeriod;
    private int idQuestion;
    private int idProcess;
    private int idSubCriteria;
    private int idCriteria;
    private boolean isFinished;

    public javax.swing.JTextField getEvidence() {
        return evidence;
    }

    public void setEvidence(javax.swing.JTextField evidence) {
        this.evidence = evidence;
    }
}
