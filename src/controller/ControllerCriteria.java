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
import model.Criteria;
import repository.RepositoryCriteria;
import view.criterias.FormCriteria;
import view.criterias.ListCriteria;

/**
 *
 * @author winvm
 */
public class ControllerCriteria {

    private RepositoryCriteria repositoryCriteria;

    public ControllerCriteria() {
        repositoryCriteria = new RepositoryCriteria();
    }

    public void getAllCriterias(ListCriteria view) {
        try {
            List<Criteria> list = repositoryCriteria.getAll();
            for (Criteria criteria : list) {
                Object[] row = new Object[2];
                row[0] = criteria.getId();
                row[1] = criteria.getDescription();
                view.getModel().addRow(row);
            }
            view.getTable().setModel(view.getModel());
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(view, "No se pudo recuperar los Criterios almacenados.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void addCriteria(FormCriteria view) {
        if (!view.getTxtCriteria().getText().isEmpty()) {
            try {
                Criteria criteria = new Criteria();
                criteria.setDescription(view.getTxtCriteria().getText());
                repositoryCriteria.save(criteria);
                view.dispose();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(view, "Error al guardar el nuevo Criterio.", "Error", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(view, "El campo Criterio no debe estár vacío.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void updateCriteria(FormCriteria view) {
        if (!view.getTxtCriteria().getText().isEmpty()) {
            try {
                Criteria criteria = new Criteria();
                criteria.setId(view.getId());
                criteria.setDescription(view.getTxtCriteria().getText());
                repositoryCriteria.update(criteria);
                view.dispose();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(view, "Error al actualizar el Criterio.", "Error", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(view, "El campo Criterio no debe estár vacío.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void deleteCriteria(ListCriteria view ,int id){
        try {
            repositoryCriteria.delete(Integer.valueOf(id));
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(view, "Error al eliminar el Criterio.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void getCriteriaById(FormCriteria view) {
        try {
            Criteria criteria = repositoryCriteria.getCriteriaById(Integer.valueOf(view.getId()));
            view.getTxtCriteria().setText(criteria.getDescription());
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(view, "Error al recuperar Criterio seleccionado.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
}
