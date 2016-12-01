/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import javax.swing.ImageIcon;
import view.questions.ListQuestion;
import javax.swing.JFrame;
import javax.swing.JInternalFrame;
import view.criterias.ListCriteria;
import view.period.ComparePeriods;
import view.period.ListPeriod;
import view.period.SelectPeriod;
import view.process.ListProcess;
import view.subcriteria.ListSubC;

/**
 *
 * @author winvm
 */
public class WindowMain extends javax.swing.JFrame {

    /**
     * Creates new form WindowMain
     */
    public WindowMain() {
        initComponents();
        menuItemListQuestions.setVisible(false);
        menuItemListCriteria.setVisible(false);
        menuItemSubCriteria.setVisible(false);
        menuItemProcess.setVisible(false);
        this.setExtendedState(JFrame.MAXIMIZED_BOTH);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        desktopPane = new javax.swing.JDesktopPane();
        jLabel1 = new javax.swing.JLabel();
        menuBar = new javax.swing.JMenuBar();
        menuFile = new javax.swing.JMenu();
        menuItemExit = new javax.swing.JMenuItem();
        menuQuiz = new javax.swing.JMenu();
        menuItemNewQuiz = new javax.swing.JMenuItem();
        menuModules = new javax.swing.JMenu();
        menuItemPeriod = new javax.swing.JMenuItem();
        menuItemListCriteria = new javax.swing.JMenuItem();
        menuItemSubCriteria = new javax.swing.JMenuItem();
        menuItemProcess = new javax.swing.JMenuItem();
        menuItemListQuestions = new javax.swing.JMenuItem();
        menuItemListImprovement = new javax.swing.JMenuItem();
        menuReport = new javax.swing.JMenu();
        menuItemProcessData = new javax.swing.JMenuItem();
        menuItemReport = new javax.swing.JMenuItem();
        jMenuItem1 = new javax.swing.JMenuItem();
        jMenu1 = new javax.swing.JMenu();
        cambiarPass = new javax.swing.JMenuItem();
        jMenu2 = new javax.swing.JMenu();
        jMenuItem2 = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("EFQM - Sistema de Gestión de Calidad");

        desktopPane.setBackground(new java.awt.Color(255, 255, 255));

        jLabel1.setBackground(new java.awt.Color(255, 255, 255));
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/imagenes/logo.png"))); // NOI18N

        javax.swing.GroupLayout desktopPaneLayout = new javax.swing.GroupLayout(desktopPane);
        desktopPane.setLayout(desktopPaneLayout);
        desktopPaneLayout.setHorizontalGroup(
            desktopPaneLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        desktopPaneLayout.setVerticalGroup(
            desktopPaneLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        desktopPane.setLayer(jLabel1, javax.swing.JLayeredPane.DEFAULT_LAYER);

        menuBar.setBackground(new java.awt.Color(255, 255, 255));
        menuBar.setForeground(new java.awt.Color(255, 255, 255));

        menuFile.setText("Archivo");

        menuItemExit.setBackground(new java.awt.Color(255, 255, 255));
        menuItemExit.setText("Salir");
        menuItemExit.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuItemExitActionPerformed(evt);
            }
        });
        menuFile.add(menuItemExit);

        menuBar.add(menuFile);

        menuQuiz.setBackground(new java.awt.Color(255, 255, 255));
        menuQuiz.setText("Encuesta");

        menuItemNewQuiz.setBackground(new java.awt.Color(255, 255, 255));
        menuItemNewQuiz.setText("Nueva Encuesta");
        menuItemNewQuiz.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuItemNewQuizActionPerformed(evt);
            }
        });
        menuQuiz.add(menuItemNewQuiz);

        menuBar.add(menuQuiz);

        menuModules.setBackground(new java.awt.Color(255, 255, 255));
        menuModules.setText("Configuracion");

        menuItemPeriod.setBackground(new java.awt.Color(255, 255, 255));
        menuItemPeriod.setText("Periodos");
        menuItemPeriod.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuItemPeriodActionPerformed(evt);
            }
        });
        menuModules.add(menuItemPeriod);

        menuItemListCriteria.setBackground(new java.awt.Color(255, 255, 255));
        menuItemListCriteria.setText("Criterios");
        menuItemListCriteria.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuItemListCriteriaActionPerformed(evt);
            }
        });
        menuModules.add(menuItemListCriteria);

        menuItemSubCriteria.setBackground(new java.awt.Color(255, 255, 255));
        menuItemSubCriteria.setText("Sub Criterios");
        menuItemSubCriteria.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuItemSubCriteriaActionPerformed(evt);
            }
        });
        menuModules.add(menuItemSubCriteria);

        menuItemProcess.setBackground(new java.awt.Color(255, 255, 255));
        menuItemProcess.setText("Procesos");
        menuItemProcess.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuItemProcessActionPerformed(evt);
            }
        });
        menuModules.add(menuItemProcess);

        menuItemListQuestions.setBackground(new java.awt.Color(255, 255, 255));
        menuItemListQuestions.setText("Preguntas");
        menuItemListQuestions.setEnabled(false);
        menuItemListQuestions.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuItemListQuestionsActionPerformed(evt);
            }
        });
        menuModules.add(menuItemListQuestions);

        menuItemListImprovement.setBackground(new java.awt.Color(255, 255, 255));
        menuItemListImprovement.setText("Mejoras");
        menuItemListImprovement.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuItemListImprovementActionPerformed(evt);
            }
        });
        menuModules.add(menuItemListImprovement);

        menuBar.add(menuModules);

        menuReport.setBackground(new java.awt.Color(255, 255, 255));
        menuReport.setText("Reportes");

        menuItemProcessData.setBackground(new java.awt.Color(255, 255, 255));
        menuItemProcessData.setText("Procesar Datos");
        menuItemProcessData.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuItemProcessDataActionPerformed(evt);
            }
        });
        menuReport.add(menuItemProcessData);

        menuItemReport.setBackground(new java.awt.Color(255, 255, 255));
        menuItemReport.setText("Ver Informe Final");
        menuItemReport.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuItemReportActionPerformed(evt);
            }
        });
        menuReport.add(menuItemReport);

        jMenuItem1.setText("Comparar Resultados");
        jMenuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem1ActionPerformed(evt);
            }
        });
        menuReport.add(jMenuItem1);

        menuBar.add(menuReport);

        jMenu1.setText("Administrador");

        cambiarPass.setText("Modificar contraseña");
        cambiarPass.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cambiarPassActionPerformed(evt);
            }
        });
        jMenu1.add(cambiarPass);

        menuBar.add(jMenu1);

        jMenu2.setText("Acerca de");
        jMenu2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenu2ActionPerformed(evt);
            }
        });

        jMenuItem2.setText("Autores");
        jMenuItem2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem2ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem2);

        menuBar.add(jMenu2);

        setJMenuBar(menuBar);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(desktopPane)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(desktopPane, javax.swing.GroupLayout.Alignment.TRAILING)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void menuItemExitActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuItemExitActionPerformed
        System.exit(0);
    }//GEN-LAST:event_menuItemExitActionPerformed

    private void menuItemListQuestionsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuItemListQuestionsActionPerformed
        if (isOpen(this.listQuestions)) {
            this.listQuestions = new ListQuestion(this);
            this.desktopPane.add(this.listQuestions);
            this.listQuestions.setVisible(true);
        }
    }//GEN-LAST:event_menuItemListQuestionsActionPerformed

    private void menuItemNewQuizActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuItemNewQuizActionPerformed
        if (isOpen(this.selectPeriod)) {
            this.selectPeriod = new SelectPeriod(this, true, "quiz");
            this.selectPeriod.setVisible(true);
        }
    }//GEN-LAST:event_menuItemNewQuizActionPerformed

    private void menuItemListCriteriaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuItemListCriteriaActionPerformed
        if (isOpen(this.listCriterias)) {
            this.listCriterias = new ListCriteria(this);
            this.desktopPane.add(this.listCriterias);
            this.listCriterias.setVisible(true);
        }
    }//GEN-LAST:event_menuItemListCriteriaActionPerformed

    private void menuItemSubCriteriaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuItemSubCriteriaActionPerformed
        if (isOpen(listSubC)) {
            listSubC = new ListSubC(this);
            desktopPane.add(listSubC);
            listSubC.setVisible(true);
        }
    }//GEN-LAST:event_menuItemSubCriteriaActionPerformed

    private void menuItemProcessActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuItemProcessActionPerformed
        if (isOpen(listProcess)) {
            listProcess = new ListProcess(this);
            desktopPane.add(listProcess);
            listProcess.setVisible(true);
        }
    }//GEN-LAST:event_menuItemProcessActionPerformed

    private void menuItemReportActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuItemReportActionPerformed
        if (isOpen(this.selectPeriod)) {
            this.selectPeriod = new SelectPeriod(this, true, "report");
            this.selectPeriod.setVisible(true);
        }
    }//GEN-LAST:event_menuItemReportActionPerformed

    private void menuItemProcessDataActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuItemProcessDataActionPerformed
        if (isOpen(this.selectPeriod)) {
            this.selectPeriod = new SelectPeriod(this, true, "processdata");
            this.selectPeriod.setVisible(true);
        }
    }//GEN-LAST:event_menuItemProcessDataActionPerformed

    private void menuItemPeriodActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuItemPeriodActionPerformed
        if (isOpen(listPeriod)) {
            listPeriod = new ListPeriod(this);
            desktopPane.add(listPeriod);
            listPeriod.setVisible(true);
        }
    }//GEN-LAST:event_menuItemPeriodActionPerformed

    private void menuItemListImprovementActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_menuItemListImprovementActionPerformed
        if (isOpen(this.selectPeriod)) {
            this.selectPeriod = new SelectPeriod(this, true, "improvement");
            this.selectPeriod.setVisible(true);
        }
    }//GEN-LAST:event_menuItemListImprovementActionPerformed

    private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem1ActionPerformed
        if (isOpen(this.comparePeriods)) {
            this.comparePeriods = new ComparePeriods(this, true, null);
            this.comparePeriods.setVisible(true);
        }
    }//GEN-LAST:event_jMenuItem1ActionPerformed

    private void cambiarPassActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cambiarPassActionPerformed
        // TODO add your handling code here:
        this.newPasswordForm = new NewPasswordForm(this, true);
        this.newPasswordForm.setVisible(true);
    }//GEN-LAST:event_cambiarPassActionPerformed

    private void jMenu2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenu2ActionPerformed
        // TODO add your handling code here:
        
    }//GEN-LAST:event_jMenu2ActionPerformed

    private void jMenuItem2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem2ActionPerformed
        // TODO add your handling code here:
        this.acercaDe = new AcercaDe(this, true);
        this.acercaDe.setVisible(true);
    }//GEN-LAST:event_jMenuItem2ActionPerformed

    private boolean isOpen(Object obj) {
        JInternalFrame[] internalFrames = this.desktopPane.getAllFrames();
        boolean close = true;
        for (JInternalFrame intFrame : internalFrames) {
            if (intFrame == obj) {
                intFrame.setVisible(true);
                close = false;
            } else {
                intFrame.dispose();
            }
        }
        return close;
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JMenuItem cambiarPass;
    private javax.swing.JDesktopPane desktopPane;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem2;
    private javax.swing.JMenuBar menuBar;
    private javax.swing.JMenu menuFile;
    private javax.swing.JMenuItem menuItemExit;
    private javax.swing.JMenuItem menuItemListCriteria;
    private javax.swing.JMenuItem menuItemListImprovement;
    private javax.swing.JMenuItem menuItemListQuestions;
    private javax.swing.JMenuItem menuItemNewQuiz;
    private javax.swing.JMenuItem menuItemPeriod;
    private javax.swing.JMenuItem menuItemProcess;
    private javax.swing.JMenuItem menuItemProcessData;
    private javax.swing.JMenuItem menuItemReport;
    private javax.swing.JMenuItem menuItemSubCriteria;
    private javax.swing.JMenu menuModules;
    private javax.swing.JMenu menuQuiz;
    private javax.swing.JMenu menuReport;
    // End of variables declaration//GEN-END:variables
    private ListQuestion listQuestions;
    private SelectPeriod selectPeriod;
    private ComparePeriods comparePeriods;
    private ListCriteria listCriterias;
    private ListSubC listSubC;
    private ListProcess listProcess;
    private ListPeriod listPeriod;
    private NewPasswordForm newPasswordForm;
    private AcercaDe acercaDe;
}
