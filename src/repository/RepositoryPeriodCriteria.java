/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.SQLException;
import java.util.List;
import model.PeriodCriteria;

/**
 *
 * @author winvm
 */
public class RepositoryPeriodCriteria {

    public void save(PeriodCriteria periodCriteria) throws SQLException {
        CustomSqlMap.getInstance().insert("savePeriodCriteria", periodCriteria);
    }
    public List<PeriodCriteria> getAllCriteriaInPeriod(int id) throws SQLException {
        return (List<PeriodCriteria>) CustomSqlMap.getInstance().queryForList("getAllCriteriaInPeriod", id);
    }
    public int getId(PeriodCriteria periodCriteria) throws SQLException {
        return ((PeriodCriteria) CustomSqlMap.getInstance().queryForObject("selectIdPeriodCriteria", periodCriteria)).getIdpc();
    }
}
