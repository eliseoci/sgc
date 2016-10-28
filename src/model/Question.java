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
public class Question {

    private int id;
    private String question;
    private int enable;
    private int groups;
    private String gDesc;
    private int subCriteria;
    private String subDesc;
    private int criteria;
    private String criDesc;

    public Question() {
    }

    public Question(int id, String question, int enable, int groups) {
        this.id = id;
        this.question = question;
        this.enable = enable;
        this.groups = groups;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public int getEnable() {
        return enable;
    }

    public void setEnable(int enable) {
        this.enable = enable;
    }

    public int getGroups() {
        return groups;
    }

    public void setGroups(int groups) {
        this.groups = groups;
    }

    public int getSubCriteria() {
        return subCriteria;
    }

    public void setSubCriteria(int subCriteria) {
        this.subCriteria = subCriteria;
    }

    public int getCriteria() {
        return criteria;
    }

    public void setCriteria(int criteria) {
        this.criteria = criteria;
    }

    public String getgDesc() {
        return gDesc;
    }

    public void setgDesc(String gDesc) {
        this.gDesc = gDesc;
    }

    public String getSubDesc() {
        return subDesc;
    }

    public void setSubDesc(String subDesc) {
        this.subDesc = subDesc;
    }

    public String getCriDesc() {
        return criDesc;
    }

    public void setCriDesc(String criDesc) {
        this.criDesc = criDesc;
    }

}
