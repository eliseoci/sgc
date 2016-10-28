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
public class Improvements {

    private int idimprovements;
    private String title;
    private String description;
    private int period;
    private int priority;
    private int status;

    public Improvements() {
    }

    public Improvements(int idimprovements, String title, String description, int period, int priority, int status) {
        this.idimprovements = idimprovements;
        this.title = title;
        this.description = description;
        this.period = period;
        this.priority = priority;
        this.status = status;
    }

    public int getIdimprovements() {
        return idimprovements;
    }

    public void setIdimprovements(int idimprovements) {
        this.idimprovements = idimprovements;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
