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
public class Quiz {

    private int idPeriod;
    private int idpc;
    private int idpcs;
    private int idpcsp;
    private int idpcspq;
    private String period;
    private String criteria;
    private String subcriteria;
    private String process;
    private String question;

    public Quiz() {
    }

    public Quiz(int idPeriod, int idpc, int idpcs, int idpcsp, int idpcspq, String period, String criteria, String subcriteria, String process, String question) {
        this.idPeriod = idPeriod;
        this.idpc = idpc;
        this.idpcs = idpcs;
        this.idpcsp = idpcsp;
        this.idpcspq = idpcspq;
        this.period = period;
        this.criteria = criteria;
        this.subcriteria = subcriteria;
        this.process = process;
        this.question = question;
    }

    public int getIdPeriod() {
        return idPeriod;
    }

    public void setIdPeriod(int idPeriod) {
        this.idPeriod = idPeriod;
    }

    public int getIdpc() {
        return idpc;
    }

    public void setIdpc(int idpc) {
        this.idpc = idpc;
    }

    public int getIdpcs() {
        return idpcs;
    }

    public void setIdpcs(int idpcs) {
        this.idpcs = idpcs;
    }

    public int getIdpcsp() {
        return idpcsp;
    }

    public void setIdpcsp(int idpcsp) {
        this.idpcsp = idpcsp;
    }

    public int getIdpcspq() {
        return idpcspq;
    }

    public void setIdpcspq(int idpcspq) {
        this.idpcspq = idpcspq;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public String getCriteria() {
        return criteria;
    }

    public void setCriteria(String criteria) {
        this.criteria = criteria;
    }

    public String getSubcriteria() {
        return subcriteria;
    }

    public void setSubcriteria(String subcriteria) {
        this.subcriteria = subcriteria;
    }

    public String getProcess() {
        return process;
    }

    public void setProcess(String process) {
        this.process = process;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

}
