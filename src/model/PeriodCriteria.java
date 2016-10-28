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
public class PeriodCriteria {

    private int idpc;
    private int period;
    private int criteria;
    private String descriptionPeriod;
    private String descriptionCriteria;
    private double point;

    public PeriodCriteria(int idpc, String descriptionPeriod, String descriptionCriteria, double point) {
        this.idpc = idpc;
        this.descriptionPeriod = descriptionPeriod;
        this.descriptionCriteria = descriptionCriteria;
        this.point = point;
    }

    public PeriodCriteria() {
    }

    public int getIdpc() {
        return idpc;
    }

    public void setIdpc(int idpc) {
        this.idpc = idpc;
    }

    public String getDescriptionPeriod() {
        return descriptionPeriod;
    }

    public void setDescriptionPeriod(String descriptionPeriod) {
        this.descriptionPeriod = descriptionPeriod;
    }

    public String getDescriptionCriteria() {
        return descriptionCriteria;
    }

    public void setDescriptionCriteria(String descriptionCriteria) {
        this.descriptionCriteria = descriptionCriteria;
    }

    public double getPoint() {
        return point;
    }

    public void setPoint(double point) {
        this.point = point;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    public int getCriteria() {
        return criteria;
    }

    public void setCriteria(int criteria) {
        this.criteria = criteria;
    }

}
