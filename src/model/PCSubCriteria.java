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
public class PCSubCriteria {

    private int idpcs;
    private int subcriteria;
    private int period_criteria;
    private int period;
    private float adjustment;
    private float percentage;

    public PCSubCriteria() {
    }

    public PCSubCriteria(int idpcs, int subcriteria, int period_criteria, int period, float adjustment, float percentage) {
        this.idpcs = idpcs;
        this.subcriteria = subcriteria;
        this.period_criteria = period_criteria;
        this.period = period;
        this.adjustment = adjustment;
        this.percentage = percentage;
    }

    public int getIdpcs() {
        return idpcs;
    }

    public void setIdpcs(int idpcs) {
        this.idpcs = idpcs;
    }

    public int getSubcriteria() {
        return subcriteria;
    }

    public void setSubcriteria(int subcriteria) {
        this.subcriteria = subcriteria;
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

    public float getAdjustment() {
        return adjustment;
    }

    public void setAdjustment(float adjustment) {
        this.adjustment = adjustment;
    }

    public float getPercentage() {
        return percentage;
    }

    public void setPercentage(float percentage) {
        this.percentage = percentage;
    }

}
