/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.SQLException;
import java.util.List;
import javax.swing.JOptionPane;
import model.Process;
import repository.RepositoryProcess;
import view.process.FormProcess;
import view.process.ListProcess;

/**
 *
 * @author winvm
 */
public class ControllerProcess {

    private RepositoryProcess repositoryProcess;

    public ControllerProcess() {
        repositoryProcess = new RepositoryProcess();
    }

    public void getAll(ListProcess view) {
        try {
            List<Process> list = repositoryProcess.getAll();
            for (Process groups : list) {
                Object[] row = new Object[2];
                row[0] = groups.getId();
                row[1] = groups.getDescription();
                view.getModel().addRow(row);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(view, "No se pudo recuperar los Procesos almacenados.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void save(FormProcess view) {
        if (!view.getTxtProcess().getText().isEmpty()) {
            try {
                Process groups = new Process();
                groups.setDescription(view.getTxtProcess().getText());
                repositoryProcess.save(groups);
                view.dispose();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(view, "No se guardo el nuevo Proceso.", "Error", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(view, "El campo Proceso no puede ser vacío.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void update(FormProcess view) {

        if (!view.getTxtProcess().getText().isEmpty()) {
            try {
                Process groups = new Process();
                groups.setId(view.getId());
                groups.setDescription(view.getTxtProcess().getText());
                repositoryProcess.update(groups);
                view.dispose();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(view, "No se actualizó el Proceso.", "Error", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(view, "El campo Proceso no puede ser vacío.", "Error", JOptionPane.ERROR_MESSAGE);
        }

    }

    public void getById(FormProcess view) {
        try {
            Process groups = repositoryProcess.getById(Integer.valueOf(view.getId()));
            view.getTxtProcess().setText(groups.getDescription());
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(view, "No se recuperó el Proceso.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void deleteProcess(ListProcess view, int id) {

        try {
            repositoryProcess.delete(Integer.valueOf(id));
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(view, "Error al eliminar el Proceso.", "Error", JOptionPane.ERROR_MESSAGE);
        }

    }
}
