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
public class PCSProcess {

    private int idpcsp;
    private int process;
    private int pc_subcriteria;
    private int period_criteria;
    private int period;

    public PCSProcess() {
    }

    public PCSProcess(int idpcsp, int process, int pc_subcriteria, int period_criteria, int period) {
        this.idpcsp = idpcsp;
        this.process = process;
        this.pc_subcriteria = pc_subcriteria;
        this.period_criteria = period_criteria;
        this.period = period;
    }

    public int getIdpcsp() {
        return idpcsp;
    }

    public void setIdpcsp(int idpcsp) {
        this.idpcsp = idpcsp;
    }

    public int getProcess() {
        return process;
    }

    public void setProcess(int process) {
        this.process = process;
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
