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
public class Priority {

    private int idpriority;
    private String description;

    public Priority() {
    }

    public Priority(int idpriority, String description) {
        this.idpriority = idpriority;
        this.description = description;
    }

    public int getIdpriority() {
        return idpriority;
    }

    public void setIdpriority(int idpriority) {
        this.idpriority = idpriority;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return description;
    }

}
