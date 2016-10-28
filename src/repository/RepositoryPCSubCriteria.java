/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.SQLException;
import model.PCSubCriteria;

/**
 *
 * @author winvm
 */
public class RepositoryPCSubCriteria {
    public void save(PCSubCriteria periodCriteria) throws SQLException {
        CustomSqlMap.getInstance().insert("savePCSubCriteria", periodCriteria);
    }

    public int getId(PCSubCriteria periodCriteria) throws SQLException {
        return ((PCSubCriteria) CustomSqlMap.getInstance().queryForObject("selectIdPCSubCriteria", periodCriteria)).getIdpcs();
    }
}
