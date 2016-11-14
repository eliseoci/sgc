/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import model.Answer;
import model.AverageByResponses;
import model.Quiz;
import model.Response;
import org.apache.logging.log4j.LogManager;
import repository.RepositoryAnswer;
import repository.RepositoryAverage;
import repository.RepositoryQuiz;
import repository.RepositoryResponse;
import view.helper.HelperOfForms;
import view.quiz.FormQuiz;

/**
 *
 * @author winvm
 */
public class ControllerQuiz {

    private RepositoryAnswer repositoryAnswer;
    private RepositoryQuiz repositoryQuiz;
    private RepositoryResponse repositoryResponse;
    private RepositoryAverage repositoryAverage;
    private List<Quiz> quizs;
    private List<Answer> answers;
    private List<Response> responses;
    private int question;
    private final String GUID;
    private static final org.apache.logging.log4j.Logger logger = LogManager.getLogger(ControllerQuiz.class);
    
    public ControllerQuiz() {
        repositoryAnswer = new RepositoryAnswer();
        repositoryQuiz = new RepositoryQuiz();
        repositoryResponse = new RepositoryResponse();
        repositoryAverage = new RepositoryAverage();
        UUID uuid = UUID.randomUUID();
        GUID = uuid.toString();
        question = 0;
        responses = new ArrayList<>();
    }

    public void getAllQuiz(int period) throws SQLException {
        List<Quiz> result = repositoryQuiz.getAllQuiz(period);
        if (result != null || result.size() > 0) {
            quizs = result;
        } else {
            JOptionPane.showMessageDialog(null, "Este Periodo no esta configurado, o ya fue procesado.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void getAllAnswer(FormQuiz formQuiz) throws SQLException {
        answers = repositoryAnswer.getAllAnswer(formQuiz.getIdCriteria());
        HelperOfForms.cleanJComboBox(formQuiz.getCbAnswer(), "Seleccionar Respuesta");
        for (Answer answer : answers) {
            formQuiz.getCbAnswer().addItem(answer);
        }
    }

    public void getQuiz(FormQuiz formQuiz) {
        if (question < quizs.size()) {
            try {
                Quiz quiz = quizs.get(question);
                formQuiz.setIdPeriod(quiz.getIdPeriod());
                
                formQuiz.getLbCriteria().setText(quiz.getCriteria());
                formQuiz.setIdCriteria(quiz.getIdpc());
                
                formQuiz.getLbSubCriteria().setText(quiz.getSubcriteria());
                formQuiz.setIdSubCriteria(quiz.getIdpcs());
                
                formQuiz.getLbProcess().setText(quiz.getProcess());
                formQuiz.setIdProcess(quiz.getIdpcsp());
                
                formQuiz.getTxtQuestion().setText(quiz.getQuestion());
                formQuiz.setIdQuestion(quiz.getIdpcspq());
                
                formQuiz.getLbGuid().setText(GUID);
                formQuiz.getCbAnswer().setSelectedIndex(0);
                formQuiz.getCbAnswer().setFocusable(true);
                
                getAllAnswer(formQuiz);
                formQuiz.getTxtCountQuestion().setText(
                        String.valueOf(question + 1) + " de " + String.valueOf(quizs.size()));
                
                question += 1;
                if (question >= quizs.size()) {
                    formQuiz.setIsFinished(true);
                    formQuiz.getBtnNextAndFinish().setText("Finalizar");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                JOptionPane.showMessageDialog(null, "Error al obtener las respuestas.", "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    public void addResponse(FormQuiz formQuiz) {
        Response r = new Response();
        r.setGUID(GUID);
        r.setAnswer(((Answer) formQuiz.getCbAnswer().getSelectedItem()).getId());
        r.setIdpcspq(formQuiz.getIdQuestion());
        r.setIdpcsp(formQuiz.getIdProcess());
        r.setIdpcs(formQuiz.getIdSubCriteria());
        r.setIdpc(formQuiz.getIdCriteria());
        r.setIdPeriod(formQuiz.getIdPeriod());
        responses.add(r);
    }

    public void saveRsponses(FormQuiz view) throws SQLException {
        repositoryResponse.insertAllResponses(responses);
        repositoryAverage.averageByResponses(new AverageByResponses(view.getIdPeriod(), GUID));
        logger.trace("Respuestas insertadas");
    }
}
