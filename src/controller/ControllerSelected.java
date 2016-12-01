/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import db.ConnectionFactory;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.swing.JOptionPane;
import model.Period;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import repository.RepositoryAverage;
import repository.RepositoryPeriod;
import view.improvement.ListImprovement;
import view.period.SelectPeriod;
import view.quiz.FormQuiz;

/**
 *
 * @author winvm
 */
public class ControllerSelected {

    private static final Logger logger = LogManager.getLogger(ControllerSelected.class);
    private RepositoryPeriod repositoryPeriod;
    private RepositoryAverage repositoryAverage;

    public ControllerSelected() {
        repositoryPeriod = new RepositoryPeriod();
        repositoryAverage = new RepositoryAverage();
    }

    public void getAllPeriod(SelectPeriod view) {
        try {
            List<Period> periods;
            if(view.getOrigin().equals("improvement")){
                periods = repositoryPeriod.getAll();
            } else if(view.getOrigin().equals("report")){
                periods = repositoryPeriod.getAllPeriodsProcessed();
            } else {
                periods = repositoryPeriod.getAllPeriodsUnprocessed();
            }
            for (Period period : periods) {
                view.getCbSelectPeriod().addItem(period);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(view, "No se recupero los Periodos.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void openForm(SelectPeriod view) {
        if (view.getCbSelectPeriod().getSelectedIndex() > 0) {
            try {
                int idPeriod = ((Period) view.getCbSelectPeriod().getSelectedItem()).getId();
                switch (view.getOrigin()) {
                    case "quiz":
                        if (repositoryPeriod.existsPeriod(idPeriod) == 1) {
                            new FormQuiz(view.getParent(), true, idPeriod).setVisible(true);
                        } else {
                            JOptionPane.showMessageDialog(view, "Este Periodo ya fue procesado.", "Error", JOptionPane.ERROR_MESSAGE);
                        }
                        break;
                    case "processdata":
                        try {
                            if (repositoryPeriod.existsPeriod(idPeriod) == 1) {
                                repositoryAverage.processData(idPeriod);
                                JOptionPane.showMessageDialog(view, "Período procesado con éxito", "Éxito", JOptionPane.INFORMATION_MESSAGE);
                                logger.trace("El periodo " + idPeriod + "ha sido procesado");
                            } else {
                                JOptionPane.showMessageDialog(view, "Este Periodo ya fue procesado.", "Error", JOptionPane.ERROR_MESSAGE);
                            }
                        } catch (SQLException ex) {
                            JOptionPane.showMessageDialog(view, "No se pudo procesar los datos.", "Error", JOptionPane.ERROR_MESSAGE);
                        }
                        break;
                    case "report":
                        try {
                            view.setVisible(false);
                            Connection conn;
                            Class.forName("com.mysql.jdbc.Driver");
                            conn = ConnectionFactory.getDatabaseConnection();
                            JasperReport report = (JasperReport) JRLoader.loadObject("efqm.jasper");
                            Map parameters = new HashMap();
                            parameters.put("Period", idPeriod);
                            JasperPrint print = JasperFillManager.fillReport(report, parameters, conn);
                            JasperViewer.viewReport(print, false);
                            conn.close();
                        } catch (Exception ex) {
                            ex.printStackTrace();
                            JOptionPane.showMessageDialog(view, "Ocurrio un error al mostrar el reporte.", "Error", JOptionPane.ERROR_MESSAGE);
                        }
                        break;
                    case "improvement":
                        new ListImprovement(view.getParent(), true, idPeriod).setVisible(true);
                        break;
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                JOptionPane.showMessageDialog(view, "Ocurrio un error.", "Error", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(view, "Debe seleccionar un Periodo.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
}
