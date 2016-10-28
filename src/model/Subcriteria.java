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
public class Subcriteria {

    private int id;
    private String description;
    private int criteria;
    private String criteriaDescription;

    public Subcriteria(int id, String description, int criteria, String criteriaDescription) {
        this.id = id;
        this.description = description;
        this.criteria = criteria;
        this.criteriaDescription = criteriaDescription;
    }

    public Subcriteria() {
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

    public int getCriteria() {
        return criteria;
    }

    public void setCriteria(int criteria) {
        this.criteria = criteria;
    }

    public String getCriteriaDescription() {
        return criteriaDescription;
    }

    public void setCriteriaDescription(String criteriaDescription) {
        this.criteriaDescription = criteriaDescription;
    }

    @Override
    public String toString() {
        return description;
    }

}
