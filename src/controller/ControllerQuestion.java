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
import model.Process;
import model.Question;
import model.Subcriteria;
import org.apache.logging.log4j.LogManager;
import repository.RepositoryCriteria;
import repository.RepositoryProcess;
import repository.RepositoryQuestion;
import repository.RepositorySubcriteria;
import view.helper.HelperOfForms;
import view.questions.FormQuestion;
import view.questions.ListQuestion;

/**
 *
 * @author winvm
 */
public class ControllerQuestion {

    private RepositoryQuestion repositoryQuestions;
    private static final org.apache.logging.log4j.Logger logger = LogManager.getLogger(ControllerQuestion.class);
    public ControllerQuestion() {
        repositoryQuestions = new RepositoryQuestion();
    }

    public void getAllQuestions(ListQuestion internalFrame) throws SQLException {
        List<Question> list = repositoryQuestions.getAll();
        for (Question question : list) {
            Object[] row = new Object[2];
            row[0] = String.valueOf(question.getId());
            row[1] = question.getQuestion();
            internalFrame.getModel().addRow(row);
        }
        internalFrame.getTable().setModel(internalFrame.getModel());
    }

    public void add(FormQuestion addQuestion) {
        if (!addQuestion.getTxtQuestion().getText().isEmpty()) {
            try {
                Question question = new Question();
                question.setQuestion(addQuestion.getTxtQuestion().getText());
                repositoryQuestions.save(question);
                logger.trace("Pregunta creada");
                addQuestion.dispose();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(addQuestion, "Error al guardar la nueva Pregunta", "Error", JOptionPane.ERROR_MESSAGE);
                Logger.getLogger(ControllerQuestion.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            JOptionPane.showMessageDialog(addQuestion, "El campo Pregunta no debe ser vacío", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void update(FormQuestion formQuestion) {
        if (!formQuestion.getTxtQuestion().getText().isEmpty()) {
            try {
                Question question = new Question();
                question.setId(formQuestion.getId());
                question.setQuestion(formQuestion.getTxtQuestion().getText());
                repositoryQuestions.update(question);
                logger.trace("Pregunta #" + formQuestion.getId() + " actualizada");
                formQuestion.dispose();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(formQuestion, "Error al actualizar la Pregunta", "Error", JOptionPane.ERROR_MESSAGE);
                Logger.getLogger(ControllerQuestion.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            JOptionPane.showMessageDialog(formQuestion, "El campo Pregunta no debe ser vacío", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void delete(ListQuestion lq, int id) {
        try {
            repositoryQuestions.delete(id);
            logger.trace("Preegunta #" + id + " eliminada");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(lq, "Error al eliminar pregunta.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void getById(FormQuestion formQuestion, int id) {
        try {
            Question question = repositoryQuestions.getById(id);
            formQuestion.setId(question.getId());
            formQuestion.getTxtQuestion().setText(question.getQuestion());
        } catch (SQLException ex) {
            Logger.getLogger(ControllerQuestion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
