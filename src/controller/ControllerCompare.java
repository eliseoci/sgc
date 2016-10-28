/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.List;
import javax.swing.JOptionPane;
import model.ResultCriteria;
import model.Period;
import repository.RepositoryAverage;
import repository.RepositoryPeriod;
import view.period.ComparePeriods;

/**
 *
 * @author Cohen
 */
public class ControllerCompare {
    
    private RepositoryPeriod repositoryPeriod;
    private RepositoryAverage repositoryAverage;
    
    public ControllerCompare() {
        repositoryPeriod = new RepositoryPeriod();
        repositoryAverage = new RepositoryAverage();
    }
    
    public void getAllPeriod(ComparePeriods view) {
        try {
            List<Period> periods = repositoryPeriod.getAll();
            for (Period period : periods) {
                view.getCbSelectPeriod().addItem(period);
                view.getCbSelectPeriod1().addItem(period);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(view, "No se recupero los Periodos.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
    public String compararResultado(double v1, double v2){
        double dif = (v1 - v2);
        DecimalFormat df = new DecimalFormat("####.##");
        
        if(dif > 0){
            return "Retrocedió " + df.format(dif) + " puntos.";
        } else if(dif == 0){
            return "Se mantuvo el puntaje.";
        } else {
            return "Mejora de " + df.format(dif*(-1)) + " puntos.";
        }
    }
    
    public void openForm(ComparePeriods view) {
        if (view.getCbSelectPeriod().getSelectedIndex() > 0 && view.getCbSelectPeriod1().getSelectedIndex() > 0) {
            int idPeriod1 = ((Period) view.getCbSelectPeriod().getSelectedItem()).getId();
            int idPeriod2 = ((Period) view.getCbSelectPeriod1().getSelectedItem()).getId();
            if(idPeriod1 != idPeriod2){
                try {
                  List<ResultCriteria> o = (List<ResultCriteria>) repositoryAverage.getCriteriaResultsFromPeriod(idPeriod1);
                  List<ResultCriteria> o2 = (List<ResultCriteria>) repositoryAverage.getCriteriaResultsFromPeriod(idPeriod2);
                  view.initTable();
                  int i = 0;
                  double efqmPointsP1 = 0;
                  double efqmPointsP2 = 0;
                  for (ResultCriteria rc : o) {
                    efqmPointsP1 += rc.getValue();
                    efqmPointsP2 += o2.get(i).getValue();
                    Object[] row = new Object[4];
                    row[0] = rc.getDescription();
                    row[1] = rc.getValue();
                    row[2] = o2.get(i).getValue();
                    row[3] = compararResultado(rc.getValue(), o2.get(i).getValue());
                    i++;
                    view.getModel().addRow(row);
                  }
                    Object[] row = new Object[4];
                    row[0] = "Puntaje EFQM Total";
                    row[1] = efqmPointsP1;
                    row[2] = efqmPointsP2;
                    row[3] = compararResultado(efqmPointsP1, efqmPointsP2);
                    view.getModel().addRow(row);
                  view.getjTable1().setModel(view.getModel());
                  view.getjTable1().setVisible(true);
                } catch (Exception ex) {
                    ex.printStackTrace();
                    JOptionPane.showMessageDialog(view, "Ocurrio un error.", "Error", JOptionPane.ERROR_MESSAGE);
                }
            } else {
                showErrorMessage(view, "Debe seleccionar Periodos distintos");
            }
        } else {
            showErrorMessage(view, "Debe seleccionar un Periodo.");
        }
    }
    
    public void showErrorMessage(ComparePeriods view, String message){
        JOptionPane.showMessageDialog(view, message, "Error", JOptionPane.ERROR_MESSAGE);
    }
}
