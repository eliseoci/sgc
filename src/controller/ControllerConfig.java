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
import model.PCSPQuestion;
import model.PCSProcess;
import model.PCSubCriteria;
import model.Period;
import model.PeriodCriteria;
import model.Subcriteria;
import model.Process;
import model.Question;
import org.apache.logging.log4j.LogManager;
import repository.RepositoryCriteria;
import repository.RepositoryPCSPQuestion;
import repository.RepositoryPCSProcess;
import repository.RepositoryPCSubCriteria;
import repository.RepositoryPeriod;
import repository.RepositoryPeriodCriteria;
import repository.RepositoryProcess;
import repository.RepositoryQuestion;
import repository.RepositorySubcriteria;
import view.period.FormConfig;
import view.period.FormPeriod;
import view.period.ListPeriod;

/**
 *
 * @author winvm
 */
public class ControllerConfig {

    private RepositoryPeriod repositoryPeriod;
    private RepositoryCriteria repositoryCriteria;
    private RepositorySubcriteria repositorySubcriteria;
    private RepositoryProcess repositoryProcess;
    private RepositoryQuestion repositoryQuestion;
    private RepositoryPeriodCriteria repositoryPeriodCriteria;
    private RepositoryPCSubCriteria repositoryPCSubCriteria;
    private RepositoryPCSProcess repositoryPCSProcess;
    private RepositoryPCSPQuestion repositoryPCSPQuestion;
    private static final org.apache.logging.log4j.Logger logger = LogManager.getLogger(ControllerConfig.class);
    
    public ControllerConfig() {
        repositoryPeriod = new RepositoryPeriod();
        repositoryCriteria = new RepositoryCriteria();
        repositorySubcriteria = new RepositorySubcriteria();
        repositoryProcess = new RepositoryProcess();
        repositoryPeriodCriteria = new RepositoryPeriodCriteria();
        repositoryPCSubCriteria = new RepositoryPCSubCriteria();
        repositoryPCSProcess = new RepositoryPCSProcess();
        repositoryQuestion = new RepositoryQuestion();
        repositoryPCSPQuestion = new RepositoryPCSPQuestion();
    }

    public void savePeriod(FormPeriod view) {
        if (!view.getTxtPeriod().getText().isEmpty()) {
            try {
                Period period = new Period();
                period.setDescription(view.getTxtPeriod().getText());
                repositoryPeriod.save(period);
                view.dispose();
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(view, "No se guardó el Período", "Error", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(view, "El campo Período no puede estar vacío", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void clonePeriod(FormPeriod view) {
        if (!view.getTxtPeriod().getText().isEmpty()) {
            try {
                List<PeriodCriteria> pcs = repositoryPeriodCriteria.getAllCriteriaInPeriod(view.getId());
                for(PeriodCriteria pc : pcs){
                    
                }
                Period period = new Period();
                period.setDescription(view.getTxtPeriod().getText());
                repositoryPeriod.save(period);
                view.dispose();
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(view, "No se guardó el Período", "Error", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(view, "El campo Período no puede estar vacío", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public void update(FormPeriod view) {
        try {
            Period period = new Period();
            period.setId(view.getId());
            period.setDescription(view.getTxtPeriod().getText());
            repositoryPeriod.updateDescription(period);
            view.dispose();
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(view, "No se actualizar el Período", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void saveCriteria(String value) {
        try {
            Criteria criteria = new Criteria();
            criteria.setDescription(value);
            repositoryCriteria.save(criteria);
        } catch (Exception ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(null, "No se guardo el Criterio", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void saveSubCriteria(String value) {
        try {
            Subcriteria subcriteria = new Subcriteria();
            subcriteria.setDescription(value);
            repositorySubcriteria.save(subcriteria);
        } catch (Exception ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(null, "No se guardo el Criterio", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void saveProcess(String value) {
        try {
            Process process = new Process();
            process.setDescription(value);
            repositoryProcess.save(process);
        } catch (Exception ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(null, "No se guardo el Proceso", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void getAllPeriod(ListPeriod view) {
        try {
            List<Period> periods = repositoryPeriod.getAll();
            for (Period period : periods) {
                Object[] row = new Object[3];
                row[0] = period.getId();
                row[1] = period.getDescription();
                row[2] = period.getProcessed() == 1;
                view.getModel().addRow(row);
            }
            view.getTable().setModel(view.getModel());
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(view, "No se pudo recuperar los Períodos", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void getPeriodById(FormPeriod view) {
        try {
            Period period = repositoryPeriod.getById(Integer.valueOf(view.getId()));
            view.getTxtPeriod().setText(period.getDescription());
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(view, "No se pudo recuperar el Período", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
    

    public void getAllCriteria(FormConfig view) {
        try {
            List<Criteria> criterias = repositoryCriteria.getAll();
            for (Criteria criteria : criterias) {
                view.getCbCriteria().addItem(criteria);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(view, "Error al obtener los Criterios.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void getAllSubCriteria(FormConfig view) {
        try {
            List<Subcriteria> subcriterias = repositorySubcriteria.getAllSubcriteria();
            for (Subcriteria subcriteria : subcriterias) {
                view.getCbSubCriteria().addItem(subcriteria);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(view, "Error al obtener los Criterios.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void getAllProcess(FormConfig view) {
        try {
            List<Process> processes = repositoryProcess.getAllProcess();
            for (Process group : processes) {
                view.getCbProcess().addItem(group);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(view, "Error al obtener los Procesos.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void saveConfigPeriodCriteria(FormConfig view) {
        if (view.getCbCriteria().getSelectedIndex() > 0
                && !view.getTxtPointEfqm().getText().isEmpty()) {
            try {
                PeriodCriteria periodCriteria = new PeriodCriteria();
                periodCriteria.setCriteria(((Criteria) view.getCbCriteria().getSelectedItem()).getId());
                periodCriteria.setPeriod(view.getIdPeriod());
                periodCriteria.setPoint(new Double(view.getTxtPointEfqm().getText()));
                repositoryPeriodCriteria.save(periodCriteria);
                view.setIdPeriodCriteria(repositoryPeriodCriteria.getId(periodCriteria));
                view.enabledCriteria(false);
                view.enabledSubCriteria(true);
            } catch (Exception ex) {
                ex.printStackTrace();
                JOptionPane.showMessageDialog(view, "No se guardo la configuracion de Criterios.", "Error", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(view, "Todos los campos deben estar completos.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void saveConfigPCSubCriteria(FormConfig view) {
        if (view.getCbSubCriteria().getSelectedIndex() > 0) {
            try {
                PCSubCriteria pCSubCriteria = new PCSubCriteria();
                pCSubCriteria.setPeriod_criteria(view.getIdPeriodCriteria());
                pCSubCriteria.setPeriod(view.getIdPeriod());
                pCSubCriteria.setSubcriteria(((Subcriteria) view.getCbSubCriteria().getSelectedItem()).getId());
                if (!view.getTxtAdjustment().getText().isEmpty()) {
                    pCSubCriteria.setAdjustment(new Float(view.getTxtAdjustment().getText()));
                }
                if (!view.getTxtPercentage().getText().isEmpty()) {
                    pCSubCriteria.setPercentage(new Float(view.getTxtPercentage().getText()));
                }
                repositoryPCSubCriteria.save(pCSubCriteria);
                view.setIdPCSubCriteria(repositoryPCSubCriteria.getId(pCSubCriteria));
                view.enabledSubCriteria(false);
                view.enabledProcess(true);
            } catch (Exception ex) {
                ex.printStackTrace();
                JOptionPane.showMessageDialog(view, "No se guardo la configuracion de SubCriterios.", "Error", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(view, "Todos los campos deben estar completos.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void saveConfigPCSProcess(FormConfig view) {
        if (view.getCbProcess().getSelectedIndex() > 0) {
            try {
                PCSProcess process = new PCSProcess();
                process.setProcess(((Process) view.getCbProcess().getSelectedItem()).getId());
                process.setPc_subcriteria(view.getIdPCSubCriteria());
                process.setPeriod_criteria(view.getIdPeriodCriteria());
                process.setPeriod(view.getIdPeriod());
                repositoryPCSProcess.save(process);
                view.setIdPCSProcess(repositoryPCSProcess.getId(process));
                view.enabledProcess(false);
                view.enabledQuestion(true);
            } catch (Exception ex) {
                ex.printStackTrace();
                JOptionPane.showMessageDialog(view, "No se guardo la configuracion de Proceso.", "Error", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(view, "Todos los campos deben estar completos.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void saveConfigPCSPQuestion(FormConfig view) {
        if (!view.getTxtQuestion().getText().isEmpty()) {
            try {
                Question question = new Question();
                question.setQuestion(view.getTxtQuestion().getText());
                repositoryQuestion.save(question);
                PCSPQuestion pCSPQuestion = new PCSPQuestion();
                pCSPQuestion.setQuestions_idquestions(repositoryQuestion.getId(question));
                pCSPQuestion.setPcs_process(view.getIdPCSProcess());
                pCSPQuestion.setPc_subcriteria(view.getIdPCSubCriteria());
                pCSPQuestion.setPeriod_criteria(view.getIdPeriodCriteria());
                pCSPQuestion.setPeriod(view.getIdPeriod());
                repositoryPCSPQuestion.save(pCSPQuestion);
                view.getTxtQuestion().setText("");
                JOptionPane.showMessageDialog(view, "La configuracion fue almacenada.", "Informacion", JOptionPane.INFORMATION_MESSAGE);
            } catch (Exception ex) {
                ex.printStackTrace();
                JOptionPane.showMessageDialog(view, "No se guardo la configuracion de Pregunta.", "Error", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(view, "Todos los campos deben estar completos.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
}
