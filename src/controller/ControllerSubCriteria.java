/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.SQLException;
import java.util.List;
import javax.swing.JOptionPane;
import model.Criteria;
import model.Subcriteria;
import repository.RepositoryCriteria;
import repository.RepositorySubcriteria;
import view.subcriteria.FormSubC;
import view.subcriteria.ListSubC;

/**
 *
 * @author winvm
 */
public class ControllerSubCriteria {

    private RepositorySubcriteria repositorySubcriteria;
    private RepositoryCriteria repositoryCriteria;

    public ControllerSubCriteria() {
        repositorySubcriteria = new RepositorySubcriteria();
        repositoryCriteria = new RepositoryCriteria();
    }

    public void getAll(ListSubC view) {
        try {
            List<Subcriteria> list = repositorySubcriteria.getAll();
            for (Subcriteria subcriteria : list) {
                Object[] row = new Object[2];
                row[0] = subcriteria.getId();
                row[1] = subcriteria.getDescription();
                view.getModel().addRow(row);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(view, "No se pudo recuperar los Sub Criterios.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void getById(FormSubC view) {
        try {
            Subcriteria subcriteria = repositorySubcriteria.getById(view.getId());
            view.getTxtSubC().setText(subcriteria.getDescription());
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(view, "Error al obtener el Sub Criterio.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void save(FormSubC view) {
        if (!view.getTxtSubC().getText().isEmpty()) {
            try {
                Subcriteria subcriteria = new Subcriteria();
                subcriteria.setDescription(view.getTxtSubC().getText());
                repositorySubcriteria.save(subcriteria);
                view.dispose();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(view, "Error al guardar el Sub Criterio.", "Error", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(view, "El cambo Sub Criterio no puede estar vacío.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void update(FormSubC view) {
        if (!view.getTxtSubC().getText().isEmpty()) {
            try {
                Subcriteria subcriteria = new Subcriteria();
                subcriteria.setId(view.getId());
                subcriteria.setDescription(view.getTxtSubC().getText());
                repositorySubcriteria.update(subcriteria);
                view.dispose();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(view, "Error al actualizar el Sub Criterio.", "Error", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(view, "El cambo Sub Criterio no puede estar vacío.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void delete(ListSubC view, int id) {
        try {
            repositorySubcriteria.delete(Integer.valueOf(id));
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(view, "Error al eliminar el Sub Criterio.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
}
