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
public class Response {

    private String GUID;
    private int answer;
    private int idPeriod;
    private int idpc;
    private int idpcs;
    private int idpcsp;
    private int idpcspq;

    public Response() {
    }

    public Response(String GUID, int answer, int idPeriod, int idpc, int idpcs, int idpcsp, int idpcspq) {
        this.GUID = GUID;
        this.answer = answer;
        this.idPeriod = idPeriod;
        this.idpc = idpc;
        this.idpcs = idpcs;
        this.idpcsp = idpcsp;
        this.idpcspq = idpcspq;
    }

    public String getGUID() {
        return GUID;
    }

    public void setGUID(String GUID) {
        this.GUID = GUID;
    }

    public int getAnswer() {
        return answer;
    }

    public void setAnswer(int answer) {
        this.answer = answer;
    }

    public int getIdPeriod() {
        return idPeriod;
    }

    public void setIdPeriod(int idPeriod) {
        this.idPeriod = idPeriod;
    }

    public int getIdpc() {
        return idpc;
    }

    public void setIdpc(int idpc) {
        this.idpc = idpc;
    }

    public int getIdpcs() {
        return idpcs;
    }

    public void setIdpcs(int idpcs) {
        this.idpcs = idpcs;
    }

    public int getIdpcsp() {
        return idpcsp;
    }

    public void setIdpcsp(int idpcsp) {
        this.idpcsp = idpcsp;
    }

    public int getIdpcspq() {
        return idpcspq;
    }

    public void setIdpcspq(int idpcspq) {
        this.idpcspq = idpcspq;
    }

}
