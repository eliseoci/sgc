/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author winvm
 */
public class PCSPQuestion {

    private int idpcspq;
    private int questions_idquestions;
    private int pcs_process;
    private int pc_subcriteria;
    private int period_criteria;
    private int period;

    public PCSPQuestion() {
    }

    public PCSPQuestion(int idpcspq, int questions_idquestions, int pcs_process, int pc_subcriteria, int period_criteria, int period) {
        this.idpcspq = idpcspq;
        this.questions_idquestions = questions_idquestions;
        this.pcs_process = pcs_process;
        this.pc_subcriteria = pc_subcriteria;
        this.period_criteria = period_criteria;
        this.period = period;
    }

    public int getIdpcspq() {
        return idpcspq;
    }

    public void setIdpcspq(int idpcspq) {
        this.idpcspq = idpcspq;
    }

    public int getQuestions_idquestions() {
        return questions_idquestions;
    }

    public void setQuestions_idquestions(int questions_idquestions) {
        this.questions_idquestions = questions_idquestions;
    }

    public int getPcs_process() {
        return pcs_process;
    }

    public void setPcs_process(int pcs_process) {
        this.pcs_process = pcs_process;
    }

    public int getPc_subcriteria() {
        return pc_subcriteria;
    }

    public void setPc_subcriteria(int pc_subcriteria) {
        this.pc_subcriteria = pc_subcriteria;
    }

    public int getPeriod_criteria() {
        return period_criteria;
    }

    public void setPeriod_criteria(int period_criteria) {
        this.period_criteria = period_criteria;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

}
