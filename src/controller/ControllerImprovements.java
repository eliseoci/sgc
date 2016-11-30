/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import model.Improvements;
import model.Priority;
import model.Status;
import org.apache.logging.log4j.LogManager;
import repository.RepositoryImprovements;
import repository.RepositoryPriority;
import repository.RepositoryStatus;
import view.helper.HelperOfForms;
import view.improvement.FormImprovement;
import view.improvement.ListImprovement;

/**
 *
 * @author winvm
 */
public class ControllerImprovements {

    private RepositoryImprovements repositoryImprovements;
    private RepositoryPriority repositoryPriority;
    private RepositoryStatus repositoryStatus;
    private int period;
    private static final org.apache.logging.log4j.Logger logger = LogManager.getLogger(ControllerImprovements.class);

    public ControllerImprovements() {
        repositoryImprovements = new RepositoryImprovements();
        repositoryPriority = new RepositoryPriority();
        repositoryStatus = new RepositoryStatus();
    }

    public void getAllImprovement(ListImprovement view) {
        try {
            period = view.getPeriod();
            List<Improvements> listImprovements = repositoryImprovements.getAll(period);
            for (Improvements improvement : listImprovements) {
                Object[] row = new Object[4];
                String priority = "";
                String status = "";
                row[0] = improvement.getIdimprovements();
                row[1] = improvement.getTitle();
                if(improvement.getPriority() == 1) {
                    priority = "Baja";
                } else if(improvement.getPriority() == 2){
                    priority = "Media";
                } else {
                    priority = "Alta";
                }
                row[2] = priority;
                if(improvement.getStatus()== 1) {
                    status = "Sin tratar";
                } else if(improvement.getStatus() == 2){
                    status = "En progreso";
                } else {
                    status = "Finalizado";
                }
                row[3] = status;
                view.getModel().addRow(row);
            }
            view.getTable().setModel(view.getModel());
        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(view, "Error al obtener las mejoras.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void getAllPriority(FormImprovement view) {
        try {
            List<Priority> prioritys = repositoryPriority.getAll();
            for (Priority priority : prioritys) {
                view.getCbPriority().addItem(priority);
            }
        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(view, "Error al obtener las prioridades.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void getAllStatus(FormImprovement view) {
        try {
            List<Status> listStatus = repositoryStatus.getAll();
            for (Status status : listStatus) {
                view.getCbStatus().addItem(status);
            }
        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(view, "Error al obtener las prioridades.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void save(FormImprovement view) {
        if (!view.getTxtTitle().getText().isEmpty()
                && !view.getTxtDescription().getText().isEmpty()) {
            if (view.getCbPriority().getSelectedIndex() > 0
                    && view.getCbStatus().getSelectedIndex() > 0) {
                try {
                    Improvements improvements = new Improvements();
                    improvements.setTitle(view.getTxtTitle().getText());
                    improvements.setDescription(view.getTxtDescription().getText());
                    improvements.setPeriod(period);
                    improvements.setPriority(((Priority) view.getCbPriority().getSelectedItem()).getIdpriority());
                    improvements.setStatus(((Status) view.getCbStatus().getSelectedItem()).getIdstatus());
                    repositoryImprovements.save(improvements);
                    logger.trace("Mejora creada");
                    view.dispose();
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(view, "Ocurrio un error al guardar.", "Error", JOptionPane.ERROR_MESSAGE);
                }
            } else {
                JOptionPane.showMessageDialog(view, "Debe seleccionar Prioridad y Estado.", "Informacion", JOptionPane.INFORMATION_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(view, "Debe completar todos los campos.", "Informacion", JOptionPane.INFORMATION_MESSAGE);
        }
    }

    public void delete(ListImprovement view, int id) {
        try {
            repositoryImprovements.delete(Integer.valueOf(id));
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(view, "Error al eliminar la Mejora.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void getByPk(FormImprovement view) {
        try {
            Improvements improvements = repositoryImprovements.getByPk(view.getId());
            view.getTxtTitle().setText(improvements.getTitle());
            view.getTxtDescription().setText(improvements.getDescription());
            for (int i = 1; i < view.getCbPriority().getModel().getSize(); i++) {
                if (((Priority) view.getCbPriority().getItemAt(i)).getIdpriority() == improvements.getPriority()) {
                    view.getCbPriority().setSelectedIndex(i);
                }
            }
            for (int i = 1; i < view.getCbStatus().getModel().getSize(); i++) {
                if (((Status) view.getCbStatus().getItemAt(i)).getIdstatus()== improvements.getStatus()) {
                    view.getCbStatus().setSelectedIndex(i);
                }
            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(view, "Error al recuperar la Mejora.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void update(FormImprovement view) {
        if (!view.getTxtTitle().getText().isEmpty()
                && !view.getTxtDescription().getText().isEmpty()) {
            if (view.getCbPriority().getSelectedIndex() > 0
                    && view.getCbStatus().getSelectedIndex() > 0) {
                try {
                    Improvements improvements = new Improvements();
                    improvements.setIdimprovements(view.getId());
                    improvements.setTitle(view.getTxtTitle().getText());
                    improvements.setDescription(view.getTxtDescription().getText());
                    improvements.setPeriod(period);
                    improvements.setPriority(((Priority) view.getCbPriority().getSelectedItem()).getIdpriority());
                    improvements.setStatus(((Status) view.getCbStatus().getSelectedItem()).getIdstatus());
                    repositoryImprovements.update(improvements);
                    logger.trace("Mejora #" + view.getId() + " actualizada");
                    view.dispose();
                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(view, "Ocurrio un error al guardar.", "Error", JOptionPane.ERROR_MESSAGE);
                }
            } else {
                JOptionPane.showMessageDialog(view, "Debe seleccionar Prioridad y Estado.", "Informacion", JOptionPane.INFORMATION_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(view, "Debe completar todos los campos.", "Informacion", JOptionPane.INFORMATION_MESSAGE);
        }
    }
}
