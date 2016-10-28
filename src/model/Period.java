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
public class Period {

    private int id;
    private String description;
    private int processed;
    private int exists;

    public Period() {
    }

    public Period(int id, String description, int processed, int exists) {
        this.id = id;
        this.description = description;
        this.processed = processed;
        this.exists = exists;
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

    public int getProcessed() {
        return processed;
    }

    public void setProcessed(int processed) {
        this.processed = processed;
    }

    public int getExists() {
        return exists;
    }

    public void setExists(int exists) {
        this.exists = exists;
    }

    @Override
    public String toString() {
        return description;
    }

}
