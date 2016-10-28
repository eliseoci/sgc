/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;



/**
 *
 * @author Gaby
 */
public class AreaPeriod {

    public int getIdArea_Period() {
        return idArea_Period;
    }

    public void setIdArea_Period(int idArea_Period) {
        this.idArea_Period = idArea_Period;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    public int getImprovementArea() {
        return improvementArea;
    }

    public void setImprovementArea(int improvementArea) {
        this.improvementArea = improvementArea;
    }

    public String getDescriptionPeriod() {
        return descriptionPeriod;
    }

    public void setDescriptionPeriod(String descriptionPeriod) {
        this.descriptionPeriod = descriptionPeriod;
    }

    public String getDescriptionArea() {
        return descriptionArea;
    }

    public void setDescriptionArea(String descriptionArea) {
        this.descriptionArea = descriptionArea;
    }
    
    private int idArea_Period;
    private int period;
    private int improvementArea;
    private String descriptionPeriod;
    private String descriptionArea;
    
    public AreaPeriod(int idArea_Period, String descriptionPeriod, String descriptionArea) {
        this.idArea_Period = idArea_Period;
        this.descriptionPeriod = descriptionPeriod;
        this.descriptionArea = descriptionArea;
        
    }
    public AreaPeriod() {
    }
}
