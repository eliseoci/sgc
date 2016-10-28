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
public class Process {

    private int id;
    private String description;
    private int subcriteria;
    private String subcriteriaDescription;
    private int criteria;
    private String criteriaDescription;

    public Process() {
    }

    public Process(int id, String description, int subcriteria) {
        this.id = id;
        this.description = description;
        this.subcriteria = subcriteria;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getSubcriteria() {
        return subcriteria;
    }

    public void setSubcriteria(int subcriteria) {
        this.subcriteria = subcriteria;
    }

    public String getSubcriteriaDescription() {
        return subcriteriaDescription;
    }

    public void setSubcriteriaDescription(String subcriteriaDescription) {
        this.subcriteriaDescription = subcriteriaDescription;
    }

    public String getCriteriaDescription() {
        return criteriaDescription;
    }

    public void setCriteriaDescription(String criteriaDescription) {
        this.criteriaDescription = criteriaDescription;
    }

    public int getCriteria() {
        return criteria;
    }

    public void setCriteria(int criteria) {
        this.criteria = criteria;
    }

    @Override
    public String toString() {
        return description;
    }

}
