/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.SQLException;
import java.util.List;
import model.Period;

/**
 *
 * @author winvm
 */
public class RepositoryPeriod {

    public void save(Period poll) throws SQLException {
        CustomSqlMap.getInstance().insert("savePeriod", poll);
    }

    public Period getById(Integer id) throws SQLException {
        return (Period) CustomSqlMap.getInstance().queryForObject("getByIdPeriod", id);
    }

    public List<Period> getAll() throws SQLException {
        return (List<Period>) CustomSqlMap.getInstance().queryForList("getAllPeriod");
    }

    public void updateDescription(Period period) throws SQLException {
        CustomSqlMap.getInstance().update("updateDescriptionPeriod", period);
    }

    public void updateupdateProcessPeriod(Integer period) throws SQLException {
        CustomSqlMap.getInstance().update("updateProcessPeriod", period);
    }

    public int existsPeriod(Integer period) throws SQLException {
        return ((Period) CustomSqlMap.getInstance().queryForObject("existsPeriod", period)).getExists();
    }
}
